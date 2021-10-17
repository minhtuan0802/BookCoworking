//
//  ShowAllReviewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 10/4/21.
//

import UIKit

class ShowAllReviewController: UIViewController {

    @IBOutlet weak var tableReview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableReview()
    }
    
    func configTableReview() {
        tableReview.delegate = self
        tableReview.dataSource = self
        tableReview.register(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "ReviewCell")
    }

}

extension ShowAllReviewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        cell.cosmosView.rating = reviews?[indexPath.row].rating ?? 3.0
        cell.lbContent.text = reviews?[indexPath.row].content
        cell.lbName.text = reviews?[indexPath.row].username
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
