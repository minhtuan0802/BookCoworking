//
//  ReviewCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 10/1/21.
//

import UIKit
import Cosmos
import FirebaseFirestore

class ReviewCell: UITableViewCell {

    @IBOutlet weak var imageAva: UIImageView!
    @IBOutlet weak var cosmosView: CosmosView!
    
    @IBOutlet weak var lbContent: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageAva.layer.cornerRadius = imageAva.bounds.height/2
    }
    
    func setupLayout() {
        contentView.topAnchor.constraint(equalTo: lbName.bottomAnchor, constant: 8).isActive = true
        contentView.leadingAnchor.constraint(equalTo: lbName.leadingAnchor, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
