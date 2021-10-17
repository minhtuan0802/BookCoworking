//
//  PaymentSuccess.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/21/21.
//

import UIKit

class PaymentSuccess: UIViewController {

    @IBOutlet weak var btnContinue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnContinue.backgroundColor = UIColor().mainColor()
        btnContinue.setTitleColor(.white, for: .normal)
        btnContinue.layer.cornerRadius = 8
    }

    @IBAction func didTabContinue(_ sender: Any) {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
