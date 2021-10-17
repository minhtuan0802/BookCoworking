//
//  PopupTimePiker.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/20/21.
//

import UIKit

class PopupTimePiker: UIViewController {

    @IBOutlet weak var btnTimeEnd: UIButton!
    @IBOutlet weak var btnTimeStart: UIButton!
    @IBOutlet weak var datePiker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButtonTimeStart(_ sender: Any) {
        btnTimeStart.setTitleColor(UIColor().mainColor(), for: .normal)
        btnTimeEnd.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func didTapButtonTimeEnd(_ sender: Any) {
        btnTimeEnd.setTitleColor(UIColor().mainColor(), for: .normal)
        btnTimeStart.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnConfirm(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
