//
//  OrderManager.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/21/21.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class OrderManager: UIViewController {
    
    @IBOutlet weak var tableOrder: UITableView!
    @IBOutlet weak var btnOrderHistory: UIButton!
    @IBOutlet weak var btnOpenOrder: UIButton!
    let timeCurrent = Date()
    var formatter = DateFormatter()

    var orders: [Order]?
    var ordersOpen: [Order] = []
    var ordersComplete: [Order] = []
    var isShowOpen: Bool = true
    
    var arrayOrder: [Any] = []
    var indexReview = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        title = "Order Manager"
        navigationController?.isNavigationBarHidden = false
        layoutbutton()
        configTableView()
    }
    
    func layoutbutton() {
        btnOpenOrder.layer.cornerRadius = 10
        btnOrderHistory.layer.cornerRadius = 10
        btnOpenOrder.setTitleColor( UIColor().mainColor(), for: .normal)
    }
    
    func configTableView() {
        tableOrder.delegate = self
        tableOrder.dataSource = self
        tableOrder.tableFooterView = UIView()
        tableOrder.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "OrderCell")
        fethchData()
    }
    
    func fethchData(){
        // load data form firebase
        let orderCollection = createDocument().collection("Order")
        
        orderCollection.addSnapshotListener { querySnapshot, error in
            self.orders = querySnapshot?.documents.map({Order.init(snapShot: $0)})

            self.setUpState()
            self.tableOrder.reloadData()
        }
    }
    
    func setUpState() {
        formatter.dateFormat = "dd/MM/yyyy"
//        let timeCurrentFormat = formatter.string(from: timeCurrent)
        for item in orders! {
            (formatter.date(from: item.dateOrder)! > timeCurrent) ? (item.isEnd = false) : (item.isEnd = true)
            item.isEnd ? ordersComplete.append(item) : ordersOpen.append(item)
        }
    }
    
    @IBAction func didTabOpenOrder(_ sender: Any) {
        btnOpenOrder.setTitleColor( UIColor().mainColor(), for: .normal)
        btnOrderHistory.setTitleColor(.black, for: .normal)
        isShowOpen = true
        self.tableOrder.reloadData()
    }
    
    @IBAction func didTabOderHistory(_ sender: Any) {
        btnOrderHistory.setTitleColor(UIColor().mainColor(), for: .normal)
        btnOpenOrder.setTitleColor(.black, for: .normal)
        isShowOpen = false
        self.tableOrder.reloadData()
    }
    
}

extension OrderManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isShowOpen {
            return ordersOpen.count
        }
        else {
            return ordersComplete.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        if isShowOpen {
            let order = ordersOpen[indexPath.row]
            cell.lbName.text = order.name
            cell.lbAddress.text = order.address
            cell.lbDateOrder.text = order.dateOrder
            cell.lbDateSetBooking.text = order.dateBookOrder
            cell.lbDetailTimeBooking.text = "\(order.timeOrderStart) - \(order.timeOrderEnd)"
            cell.viewState.isHidden = true
            cell.btnReview.isHidden = true
        }
        else {
            let order = ordersComplete[indexPath.row]
            cell.lbName.text = order.name
            cell.lbAddress.text = order.address
            cell.lbDateOrder.text = order.dateOrder
            cell.lbDateSetBooking.text = order.dateBookOrder
            cell.lbDetailTimeBooking.text = "\(order.timeOrderStart) - \(order.timeOrderEnd)"
            indexReview = indexPath.row
            cell.viewState.isHidden = false
            cell.btnReview.isHidden = false
            cell.btnReview.addTarget(self, action: #selector(didTabReview), for: .touchUpInside)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    @objc func didTabReview() {
        let vc = Reviewcontroller()
        let cell = tableOrder.cellForRow(at: IndexPath(row: indexReview, section: 0)) as! OrderCell
        vc.nameCoworking = cell.lbName.text!
        navigationController?.pushViewController(vc, animated: true)
    }

}
