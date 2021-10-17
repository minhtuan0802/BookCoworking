//
//  OrderCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/21/21.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var viewState: UILabel!
    @IBOutlet weak var lbDetailTimeBooking: UILabel!
    @IBOutlet weak var lbDateOrder: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbDateSetBooking: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnReview.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
