//
//  CreateDocument.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/30/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

public func createDocument() -> AnyObject {
    guard let curentUser = Auth.auth().currentUser else { return "" as AnyObject}
    let db = Firestore.firestore()
    let settings = db.settings
    settings.areTimestampsInSnapshotsEnabled = true
    db.settings = settings
    let collection = db.collection("User")
    let document = collection.document(curentUser.email!)
    
    return document
}
