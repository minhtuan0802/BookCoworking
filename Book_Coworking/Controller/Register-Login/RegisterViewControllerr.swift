//
//  RegisterViewControllerr.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/8/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import ProgressHUD

class RegisterViewControllerr: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "img_login")
        return image
    }()
    
    let viewButon: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor().mainColor()
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.6156862745, blue: 0.3803921569, alpha: 1)
        return view
    }()
    
    let viewButonSignIn: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    let viewButonSignUp: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.maskedCorners =  [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .white
        return view
    }()
    
    
    let labelSignIn: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign In"
        label.textColor = .white
        return label
    }()
    
    let labelSignUp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign Up"
        
        return label
    }()
    
    let viewSignInContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewSignUpContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelError: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "Error"
        label.textColor = .red
        
        return label
    }()
    
    let forgotPassword: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    // MARK: - Variable
    let inputUserName = UITextField().textField(placeholder: "User Name")
    let inputEmail = UITextField().textField(placeholder: "Email")
    let inputPassword = UITextField().textField(placeholder: "Password")
    let inputComfirmPassword = UITextField().textField(placeholder: "Comfirm Password")
    let buttonSignIn = UIButton().button(text: "Sign In")
    let buttonSignUp = UIButton().button(text: "Sign Up")
    var isSignInView = true
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.isNavigationBarHidden = true
        // add view
        view.addSubview(imageView)
        view.addSubview(viewButon)
        viewButon.addSubview(viewButonSignIn)
        viewButon.addSubview(viewButonSignUp)
        viewButonSignIn.addSubview(labelSignIn)
        viewButonSignUp.addSubview(labelSignUp)
        
        setUpLayout()
        
        let tapSignIn = UITapGestureRecognizer(target: self, action: #selector(didTabChooseSignIn))
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(didTabChooseSignUp))
        viewButonSignIn.addGestureRecognizer(tapSignIn)
        viewButonSignUp.addGestureRecognizer(tapSignUp)
        buttonSignUp.addTarget(self, action: #selector(didTabButtonSignUp), for: .touchUpInside)
        buttonSignIn.addTarget(self, action: #selector(didTabButtionSignIn), for: .touchUpInside)
        forgotPassword.addTarget(self, action: #selector(didTabForgotPassword), for: .touchUpInside)
        
    }
    
    // MARK: - Set up Layout
    
    func setUpLayout() {
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        viewButon.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -30).isActive = true
        viewButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        viewButon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        viewButon.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        viewButonSignIn.topAnchor.constraint(equalTo: viewButon.topAnchor, constant: 0).isActive = true
        viewButonSignIn.leadingAnchor.constraint(equalTo: viewButon.leadingAnchor, constant: 0).isActive = true
        viewButonSignIn.heightAnchor.constraint(equalTo: viewButon.heightAnchor, constant: 0).isActive = true
        viewButonSignIn.widthAnchor.constraint(equalTo: viewButon.widthAnchor, multiplier: 1/2).isActive = true
        
        labelSignIn.centerXAnchor.constraint(equalTo: viewButonSignIn.centerXAnchor).isActive = true
        labelSignIn.centerYAnchor.constraint(equalTo: viewButonSignIn.centerYAnchor).isActive = true
        
        viewButonSignUp.topAnchor.constraint(equalTo: viewButon.topAnchor, constant: 0).isActive = true
        viewButonSignUp.leadingAnchor.constraint(equalTo: viewButonSignIn.trailingAnchor, constant: 0).isActive = true
        viewButonSignUp.trailingAnchor.constraint(equalTo: viewButon.trailingAnchor, constant: 0).isActive = true
        viewButonSignUp.heightAnchor.constraint(equalTo: viewButon.heightAnchor, constant: 0).isActive = true
        
        labelSignUp.centerXAnchor.constraint(equalTo: viewButonSignUp.centerXAnchor).isActive = true
        labelSignUp.centerYAnchor.constraint(equalTo: viewButonSignUp.centerYAnchor).isActive = true
        
        setUpSignInLayout()
    }
    
    
    func setUpSignInLayout(){
        view.addSubview(viewSignInContent)
        viewSignInContent.addSubview(inputEmail)
        viewSignInContent.addSubview(inputPassword)
        viewSignInContent.addSubview(forgotPassword)
        viewSignInContent.addSubview(labelError)
        viewSignInContent.addSubview(buttonSignIn)
        
        inputPassword.isSecureTextEntry = true
        self.inputPassword.delegate = self
        self.inputEmail.delegate = self

        labelError.isHidden = true
        
        viewSignInContent.topAnchor.constraint(equalTo: viewButon.bottomAnchor, constant: 20).isActive = true
        viewSignInContent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        viewSignInContent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        viewSignInContent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        inputEmail.topAnchor.constraint(equalTo: viewSignInContent.topAnchor, constant: 0).isActive = true
        inputEmail.leadingAnchor.constraint(equalTo: viewSignInContent.leadingAnchor, constant: 20).isActive = true
        inputEmail.trailingAnchor.constraint(equalTo: viewSignInContent.trailingAnchor, constant: -20).isActive = true
        inputEmail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        inputPassword.topAnchor.constraint(equalTo: inputEmail.bottomAnchor, constant: 20).isActive = true
        inputPassword.leadingAnchor.constraint(equalTo: inputEmail.leadingAnchor, constant: 0).isActive = true
        inputPassword.trailingAnchor.constraint(equalTo: inputEmail.trailingAnchor, constant: 0).isActive = true
        inputPassword.heightAnchor.constraint(equalTo: inputEmail.heightAnchor, multiplier: 1).isActive = true
        
        forgotPassword.topAnchor.constraint(equalTo: inputPassword.bottomAnchor, constant: 5).isActive = true
        forgotPassword.leadingAnchor.constraint(equalTo: inputPassword.leadingAnchor, constant: 0).isActive = true
        forgotPassword.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        labelError.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 2).isActive = true
        labelError.leadingAnchor.constraint(equalTo: forgotPassword.leadingAnchor, constant: 0).isActive = true
        labelError.trailingAnchor.constraint(equalTo: inputPassword.trailingAnchor, constant: 0).isActive = true
        
        buttonSignIn.topAnchor.constraint(equalTo: labelError.bottomAnchor, constant: 5).isActive = true
        buttonSignIn.leadingAnchor.constraint(equalTo: inputPassword.leadingAnchor, constant: 0).isActive = true
        buttonSignIn.trailingAnchor.constraint(equalTo: inputPassword.trailingAnchor, constant: 0).isActive = true
        buttonSignIn.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setUpSignUpLayout() {
        view.addSubview(viewSignUpContent)
        viewSignUpContent.addSubview(inputUserName)
        viewSignUpContent.addSubview(inputEmail)
        viewSignUpContent.addSubview(inputPassword)
        viewSignUpContent.addSubview(inputComfirmPassword)
        viewSignUpContent.addSubview(labelError)
        viewSignUpContent.addSubview(buttonSignUp)
        
        self.inputComfirmPassword.delegate = self
        self.inputUserName.delegate = self
        self.inputEmail.delegate = self
        self.inputPassword.delegate = self

        inputPassword.isSecureTextEntry = true
        inputComfirmPassword.isSecureTextEntry = true
        labelError.isHidden = true
        
        viewSignUpContent.topAnchor.constraint(equalTo: viewButon.bottomAnchor, constant: 20).isActive = true
        viewSignUpContent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        viewSignUpContent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        viewSignUpContent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        inputUserName.topAnchor.constraint(equalTo: viewSignUpContent.topAnchor, constant: 0).isActive = true
        inputUserName.leadingAnchor.constraint(equalTo: viewSignUpContent.leadingAnchor, constant: 20).isActive = true
        inputUserName.trailingAnchor.constraint(equalTo: viewSignUpContent.trailingAnchor, constant: -20).isActive = true
        inputUserName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        inputEmail.topAnchor.constraint(equalTo: inputUserName.bottomAnchor, constant: 20).isActive = true
        inputEmail.leadingAnchor.constraint(equalTo: inputUserName.leadingAnchor, constant: 0).isActive = true
        inputEmail.trailingAnchor.constraint(equalTo: inputUserName.trailingAnchor, constant: 0).isActive = true
        inputEmail.heightAnchor.constraint(equalTo: inputUserName.heightAnchor, multiplier: 1).isActive = true
        
        inputPassword.topAnchor.constraint(equalTo: inputEmail.bottomAnchor, constant: 20).isActive = true
        inputPassword.leadingAnchor.constraint(equalTo: inputEmail.leadingAnchor, constant: 0).isActive = true
        inputPassword.trailingAnchor.constraint(equalTo: inputEmail.trailingAnchor, constant: 0).isActive = true
        inputPassword.heightAnchor.constraint(equalTo: inputEmail.heightAnchor, multiplier: 1).isActive = true
        
        inputComfirmPassword.topAnchor.constraint(equalTo: inputPassword.bottomAnchor, constant: 20).isActive = true
        inputComfirmPassword.leadingAnchor.constraint(equalTo: inputPassword.leadingAnchor, constant: 0).isActive = true
        inputComfirmPassword.trailingAnchor.constraint(equalTo: inputPassword.trailingAnchor, constant: 0).isActive = true
        inputComfirmPassword.heightAnchor.constraint(equalTo: inputPassword.heightAnchor, multiplier: 1).isActive = true
        
        labelError.topAnchor.constraint(equalTo: inputComfirmPassword.bottomAnchor, constant: 20).isActive = true
        labelError.leadingAnchor.constraint(equalTo: inputComfirmPassword.leadingAnchor, constant: 0).isActive = true
        labelError.trailingAnchor.constraint(equalTo: inputComfirmPassword.trailingAnchor, constant: 0).isActive = true
        
        
        buttonSignUp.topAnchor.constraint(equalTo: labelError.bottomAnchor, constant: 10).isActive = true
        buttonSignUp.leadingAnchor.constraint(equalTo: inputComfirmPassword.leadingAnchor, constant: 0).isActive = true
        buttonSignUp.trailingAnchor.constraint(equalTo: inputComfirmPassword.trailingAnchor, constant: 0).isActive = true
        buttonSignUp.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    //MARK: - show view sign in/up
    @objc func didTabChooseSignIn() {
        view.frame.origin.y = 0
        viewButonSignIn.backgroundColor = UIColor().mainColor()
        viewButonSignUp.backgroundColor = .white
        labelSignUp.textColor = .black
        labelSignIn.textColor = .white
        viewSignUpContent.isHidden = true
        viewSignInContent.isHidden = false
        setUpSignInLayout()
        isSignInView = true
    }
    
    @objc func didTabChooseSignUp() {
        viewButonSignUp.backgroundColor = UIColor().mainColor()
        viewButonSignIn.backgroundColor = .systemBackground
        labelSignIn.textColor = .black
        labelSignUp.textColor = .white
        viewSignInContent.isHidden = true
        viewSignUpContent.isHidden = false
        setUpSignUpLayout()
        isSignInView = false
        changeViewKeyBoardAppear()
    }
    
    //MARK: -process button
    
    @objc func didTabButtonSignUp(){
        guard let email = inputEmail.text, let password = inputPassword.text,
              let username = inputUserName.text
        else { return  }
        
        if isValidation() {
            Auth.auth().createUser(withEmail: email, password: password) { success, error in
                
                // create collection user
                let vc = TabBarViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
                let db = Firestore.firestore()
                let settings = db.settings
                settings.areTimestampsInSnapshotsEnabled = true
                db.settings = settings
                let collection = db.collection("User")
                let document = collection.document(email)

                document.setData(["Name": username, "Email": email])
                ProgressHUD.show()
            }
        }
    }
    
    @objc func didTabButtionSignIn() {
        guard let email = inputEmail.text, let password = inputPassword.text else { return  }
        
        if isValidationSignIn() {
            ProgressHUD.show()
            Auth.auth().signIn(withEmail: email, password: password) {result, error in
                ProgressHUD.dismiss()
                if result != nil {
                    let vc = TabBarViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }
        }
    }
    
    @objc func didTabForgotPassword() {
        Auth.auth().sendPasswordReset(withEmail: inputEmail.text!) { error in
            print(error ?? "Error here")
        }
        
        let alert = UIAlertController(title: "Alert", message: "Please check your email", preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "OK", style: .default) { act in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertActionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Check Validation
    
    func isValidation() -> Bool {
        if inputEmail.text!.isEmpty || inputPassword.text!.isEmpty || inputUserName.text!.isEmpty {
            labelError.isHidden = false
            labelError.text = "Error empty data input"
            return false
        }
        
        else if inputPassword.text != inputComfirmPassword.text {
            labelError.isHidden = false
            labelError.text = "Password and Confirm Password not match"
            return false
        }
        else if !isValidateEmail(inputEmail.text!) {
            labelError.isHidden = false
            labelError.text = "Email invalidate"
            return false
        }
        
        return true
    }
    
    func isValidationSignIn() -> Bool {
        if inputEmail.text!.isEmpty || inputPassword.text!.isEmpty{
            labelError.isHidden = false
            labelError.text = "Error empty data input"
            return false
        }
        else if !isValidateEmail(inputEmail.text!) {
            labelError.isHidden = false
            labelError.text = "Email invalidate"
            return false
        }
        
        return true
    }
    
    func isValidateEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //MARK: - Layout when keyboard appear
    
    func changeViewKeyBoardAppear() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillDischange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillDischange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
    }
    
    func changeViewKeyBoardAppearSignIn() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyBoardWillDischange(notification: Notification) {
//        print("Key board will show: \(notification.name.rawValue)")
        if !isSignInView {
            view.frame.origin.y = -170
        }
        else {
            view.frame.origin.y = 0

        }
    }
    @objc func keyBoardWillHide(notification: Notification) {
        view.frame.origin.y = 0
    }
    
}

extension RegisterViewControllerr: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
