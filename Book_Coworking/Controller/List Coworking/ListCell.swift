//
//  ListCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/5/21.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var imgDes: UIImageView!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelNameCoworking: UILabel!
    
    var coworking: Coworking? {
        didSet {
            labelNameCoworking.text = coworking?.name
            labelAddress.text = coworking?.address
            labelAddress.numberOfLines = 0
            labelRate.text = "\(coworking?.rate ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
