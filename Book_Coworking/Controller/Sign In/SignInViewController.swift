//
//  SignInViewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/3/21.
//

import UIKit
import FirebaseAuth
import ProgressHUD

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }

    @IBAction func didTabCreateAccount(_ sender: Any) {
        let vc = RegisterViewControllerr()
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTabSignIn(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPassword.text else { return  }
        
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
