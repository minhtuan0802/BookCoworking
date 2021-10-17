//
//  SignUpViewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/3/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import ProgressHUD


class SignUpViewController: UIViewController {

    //MARK:  - Outlet
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    //MARK:  - procecc sign up
    @IBAction func buttonSignUp(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPassword.text,
              let username = txtUsername.text, let commfirmPassword = txtConfirmPassword.text
        else { return  }
        
        Auth.auth().createUser(withEmail: email, password: password) { success, error in
            
            // create collection user
            let vc = TabBarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
            let db = Firestore.firestore()
            let collection = db.collection("User")
            let document = collection.document(email)
            
            document.setData(["Name": username, "Email": email])
            ProgressHUD.show()
        }
    }
    
}
