//
//  VoucherCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/23/21.
//

import UIKit

class VoucherCell: UITableViewCell {
    @IBOutlet weak var viewContent: UIView!
    
    @IBOutlet weak var imageVoucher: UIImageView!
    @IBOutlet weak var lbCodePromotion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContent.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
