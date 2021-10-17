//
//  RoomTypeCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/16/21.
//

import UIKit
import DropDown

class RoomTypeCell: UITableViewCell {
    
    @IBOutlet weak var btnType: UIButton!
    @IBOutlet weak var textFieldType: UITextField!
    let dropDown = DropDown()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textFieldType.setIcon(UIImage(systemName: "chevron.down") ?? UIImage(), 10)
        dropDown.dataSource = ["Table", "Office"]
        //        btnType.setTitle(dropDown.dataSource[0], for: .normal)
        textFieldType.text = dropDown.dataSource[0]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func didTapBtnType(_ sender: UIButton) {
        dropDown.anchorView = sender
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropDown.show()
        dropDown.selectionAction = {
            [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            //                  sender.setTitle(item, for: .normal)
            self!.textFieldType.text = item
        }
    }
}
