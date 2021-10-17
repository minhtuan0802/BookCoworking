//
//  EntityPopup.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/17/21.
//

import Foundation

class EntityPopup: NSObject {
    var tag: Int = 0
    var name: String = ""
    
    init(tag: Int, name: String) {
        self.tag = tag
        self.name = name
    }
}
