//
//  Review.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 10/1/21.
//

import Foundation
import Firebase

class Review {
    var id = ""
    var rating = 3.0
    var content = ""
    var username = ""
    var coworking = ""
    
    init() {
        
    }
    
    init(snapShot: QueryDocumentSnapshot) {
        self.id = snapShot.reference.documentID
        if let rating = snapShot.data()["Rate"] as? Double {
            self.rating = rating
        }
        if let content = snapShot.data()["Review"] as? String {
            self.content = content
        }
        if let username = snapShot.data()["Username"] as? String {
            self.username = username
        }
        if let coworking = snapShot.data()["Coworking"] as? String {
            self.coworking = coworking
        }
    }
    
}
