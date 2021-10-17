//
//  Order.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/20/21.
//

import Foundation
import Firebase

class Order {
    var id: String = ""
    var name: String = ""
    var type: String = ""
    var dateBookOrder: String = ""
    var dateOrder: String = ""
    var timeOrderStart: String = ""
    var timeOrderEnd: String = ""
    var number: Int = 1
    var phone: Int = 1
    var promo: String = ""
    var address: String = ""
    var isEnd : Bool = false
    
    init(_ id: String,_ name: String,_ type: String,_ dateBookOrder: String,_ dateOrder: String,_ timeOrderStart: String,_ timeOrderEnd: String,_ number: Int,_ phone: Int,_ promo: String,_ address: String,_ isEnd: Bool) {
        self.id = id
        self.name = name
        self.type = type
        self.dateBookOrder = dateBookOrder
        self.dateOrder = dateOrder
        self.timeOrderStart = timeOrderStart
        self.timeOrderEnd = timeOrderEnd
        self.number = number
        self.phone = phone
        self.promo = promo
        self.address = address
        self.isEnd = isEnd
    
    }
    
    init(snapShot: QueryDocumentSnapshot) {
        self.id = snapShot.reference.documentID
        if let name = snapShot.data()["Name"] as? String {
            self.name = name
        }
        if let address = snapShot.data()["Address"] as? String {
            self.address = address
        }
        if let type = snapShot.data()["Type"] as? String {
            self.type = type
        }
        if let dateBookOrder = snapShot.data()["Date booking order"] as? String {
            self.dateBookOrder = dateBookOrder
        }
        if let dateOrder = snapShot.data()["Date order"] as? String {
            self.dateOrder = dateOrder
        }
        if let timeOrderStart = snapShot.data()["Time start"] as? String {
            self.timeOrderStart = timeOrderStart
        }
        if let timeOrderEnd = snapShot.data()["Time end"] as? String {
            self.timeOrderEnd = timeOrderEnd
        }
        if let number = snapShot.data()["Number"] as? Int {
            self.number = number
        }
        if let phone = snapShot.data()["Phone"] as? Int {
            self.phone = phone
        }
        if let promo = snapShot.data()["Promotion"] as? String {
            self.promo = promo
        }
        if let isEnd = snapShot.data()["IsEnd"] as? Bool {
            self.isEnd = isEnd
        }
        if let isEnd = snapShot.data()["IsEnd"] as? Bool {
            self.isEnd = isEnd
        }
      
    }

}

var orderBook = Order("","","", "", "", "", "", 1, 1, "", "", false)

