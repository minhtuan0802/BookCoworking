//
//  ProfileViewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/3/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class ProfileViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableSetting: UITableView!
    @IBOutlet weak var buttonChangeAvata: UIImageView!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var img_avata: UIImageView!
    
    var dataTitleSetting = ["My Order", "My vouchers", "Edit profile" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let signOutButton = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(didTabSignOut))
        navigationItem.rightBarButtonItem = signOutButton
        navigationController?.navigationBar.tintColor = UIColor().mainColor()
        tableSetting.delegate = self
        tableSetting.dataSource = self
        tableSetting.tableFooterView = UIView()
        setUpView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        
    }
    
    @objc func didTabSignOut() {
        try? Auth.auth().signOut()
        let senceDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
        senceDelegate?.setRootViewController()
    }
    
    func fetchData() {
        createDocument().getDocument { snapshot, error in
            guard let data = snapshot?.data() as? [String : String],
                  let name = data["Name"],let email = data["Email"] else {
                print("Data was empty")
                return
            }
            let ref = data["profile_photo"]
            
            self.downloadUrlForProfilePicture(path: ref ?? "") { url in
                guard let url = url else {
                    return
                }
                let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                    guard let data_image = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.img_avata.image = UIImage(data: data_image)
                    }
                }
                task.resume()
            }
            DispatchQueue.main.async {
                self.labelName.text = name
                self.labelEmail.text = email
            }
        }
        
        changeImageAvata()
    }
    //MARK: - Change Image Avata
    public func downloadUrlForProfilePicture(
        path: String,
        completion: @escaping (URL?) -> Void
    ) {
        Storage.storage().reference(withPath: path)
            .downloadURL { url, _ in
                completion(url)
            }
    }
    
    func changeImageAvata() {
        let didTabChangeAvata = UITapGestureRecognizer(target: self, action: #selector(didTabButtonChangeAvata))
        buttonChangeAvata.addGestureRecognizer(didTabChangeAvata)
    }
    
    @objc func didTabButtonChangeAvata() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func setUpView() {
        img_avata.layer.cornerRadius = img_avata.frame.height/2
        img_avata.clipsToBounds = true
    }
    
    func uploadUserProfilePicture(email: String, image: UIImage?, completion: @escaping (Bool) -> Void) {
        guard let pngData = image?.pngData() else { return  }
        Storage.storage().reference(withPath: "profile_pictures/\(email)/photo.png")
            .putData(pngData, metadata: nil) { metadata, error in
                guard metadata != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func updateProfilePhoto(email: String, completion: @escaping (Bool) -> Void){
        print("Code go here")
        let photoReference = "profile_pictures/\(email)/photo.png"
        let db = Firestore.firestore()
        let collection = db.collection("User")
        let document = collection.document(email)
        document.getDocument { snapshot, error in
            guard var data = snapshot?.data(), error == nil else {
                return
            }
            data["profile_photo"] = photoReference
            document.setData(data) { error in
                completion(error == nil)
            }
        }
    }
}

//MARK: - Extension ViewController

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTitleSetting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataTitleSetting[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = OrderManager()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1 {
            let vc = VoucherController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        
        if let theImage = image {
            img_avata.image = theImage
        }
        guard let currentEmail = Auth.auth().currentUser?.email else {
            return
        }
        
        uploadUserProfilePicture(email: currentEmail, image: image) { success in
            if success {
                self.updateProfilePhoto(email: currentEmail) { updated in
                    guard updated else {
                        return
                    }
                    DispatchQueue.main.async { [self] in
                        self.fetchData()
                    }
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
