//
//  UITextField.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/10/21.
//

import UIKit

extension UITextField {
    func textField(placeholder: String) -> UITextField {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.autocapitalizationType = .none
        input.placeholder = placeholder
        input.layer.cornerRadius = 8
        input.layer.borderWidth = 0.5
        input.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.6156862745, blue: 0.3803921569, alpha: 1)
        input.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        input.leftViewMode = .always
        return input
    }
    
    func setIcon(_ image: UIImage,_ padding: Int){
        let iconWidth = 12;
        let iconHeight = 12;
        
        let imageView = UIImageView()
        imageView.image = image
        
        let todoX = Int(self.frame.size.width) - padding
        let todoY = self.frame.size.height/2 - 6
        imageView.contentMode = .scaleAspectFit
        
        imageView.frame = CGRect(x: Int(todoX), y: Int(todoY), width: iconWidth, height: iconHeight)
        self.addSubview(imageView)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.rightView = paddingView
    }
    
    

}
