//
//  CardCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/13/21.
//

import UIKit

class CardCell: UICollectionViewCell {

    @IBOutlet weak var viewShadow: UIView!
    @IBOutlet weak var viewCard: UIView!
    
    @IBOutlet weak var lbRate: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbNameCoworing: UILabel!
    
    @IBOutlet weak var imgDes: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()

        viewShadow.layer.cornerRadius = 30
        viewShadow.layer.masksToBounds = false
        viewShadow.layer.shadowOpacity = 0.5
        viewShadow.layer.shadowRadius = 1
        viewShadow.layer.shadowOffset = .zero
//        viewShadow.layer.shouldRasterize = true
//        viewShadow.layer.rasterizationScale = UIScreen.main.scale
        
        viewCard.layer.cornerRadius = 30
        viewCard.clipsToBounds = true
        viewCard.layer.shadowOpacity = 1
        viewCard.layer.shadowRadius = 30
        viewCard.layer.shadowOffset = .zero
        viewCard.layer.shouldRasterize = true
       
    }

}
