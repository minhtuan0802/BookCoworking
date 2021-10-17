//
//  PromotionCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/23/21.
//

import UIKit

class PromotionCell: UITableViewCell {

    @IBOutlet weak var tfPromotion: UITextField!
    @IBOutlet weak var btnPromotion: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
