//
//  PaymentMethodCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/21/21.
//

import UIKit

class PaymentMethodCell: UITableViewCell {

    @IBOutlet weak var btnMomo: UIButton!
    @IBOutlet weak var btnBankTransfer: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnBankTransfer.layer.borderWidth = 0.5
        btnBankTransfer.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.6156862745, blue: 0.3803921569, alpha: 1)
        btnBankTransfer.layer.cornerRadius = 10
        
        btnMomo.layer.borderWidth = 0.5
        btnMomo.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.6156862745, blue: 0.3803921569, alpha: 1)
        btnMomo.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
