//
//  UIButton.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/10/21.
//

import UIKit

extension UIButton {
    func button(text: String) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor().mainColor()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

}
