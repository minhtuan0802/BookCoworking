//
//  Reviewcontroller.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/30/21.
//

import UIKit
import Cosmos
import TinyConstraints
import FirebaseFirestore
import FirebaseAuth

class Reviewcontroller: UIViewController {
    let labelStar: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please write Overall level of satisfaction with my service"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let labelWriteRw: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Write Your Review"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let textView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        textView.layer.cornerRadius = 8
        return textView
    }()
    var rate = 3.0
    var nameCoworking = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveReview))
        view.addSubview(labelStar)
        view.addSubview(cosmosView)
        view.addSubview(labelWriteRw)
        view.addSubview(textView)
        
        setUpLayout()
        configRate()
    }
    
    func setUpLayout() {
        labelStar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        labelStar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        labelStar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        cosmosView.topAnchor.constraint(equalTo: labelStar.bottomAnchor, constant: 10).isActive = true
        cosmosView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        labelWriteRw.topAnchor.constraint(equalTo: cosmosView.bottomAnchor, constant: 20).isActive = true
        labelWriteRw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textView.topAnchor.constraint(equalTo: labelWriteRw.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func configRate() {
        cosmosView.didFinishTouchingCosmos = { rating in
            self.rate = rating
        }
    }
    
    @objc func saveReview() {

        createDocument().getDocument { snapshot, error in
            guard let data = snapshot?.data() else { return }
            
            let db = Firestore.firestore()
            let collection = db.collection("Review")
            let document = collection.document(UUID().uuidString)

            document.setData(["Coworking" : self.nameCoworking, "Rate" : self.rate, "Review" : self.textView.text ?? "" , "Username" : data["Name"]! ])
        }
        
        let vc = OrderManager()
        navigationController?.pushViewController(vc, animated: true)
    }
}
