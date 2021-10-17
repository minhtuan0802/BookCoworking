//
//  PolicyCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/20/21.
//

import UIKit

class PolicyCell: UITableViewCell {

    @IBOutlet weak var policy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        policy.text = "This reservation is non-refundable.Time display are based on accommodation's local time."
        policy.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
