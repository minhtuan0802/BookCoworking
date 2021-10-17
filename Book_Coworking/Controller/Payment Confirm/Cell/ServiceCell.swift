//
//  ServiceCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/20/21.
//

import UIKit

class ServiceCell: UITableViewCell {

    @IBOutlet weak var imgCoworking: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgCoworking.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
