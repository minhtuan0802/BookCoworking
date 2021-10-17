//
//  EnterInforBookingCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/16/21.
//

import UIKit

class EnterInforBookingCell: UITableViewCell {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtPhone.keyboardType = .numberPad
        txtNumber.keyboardType = .numberPad
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
