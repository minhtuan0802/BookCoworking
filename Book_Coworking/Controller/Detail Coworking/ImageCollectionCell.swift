//
//  ImageCollectionCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/15/21.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imgSlide: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgSlide.layer.cornerRadius = 30
    }

}
