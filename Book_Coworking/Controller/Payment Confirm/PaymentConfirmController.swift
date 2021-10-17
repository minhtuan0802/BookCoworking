//
//  PaymentConfirmController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/20/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class PaymentConfirmController: UIViewController {
    
    @IBOutlet weak var tableViewInfor: UITableView!
    let button = UIButton().button(text: "Confirm Payment")
    let titleInfor = ["Type", "Date", "Time", "Number", "Phone"]
    
    let listCell = ["InforCell", "ServiceCell", "PolicyCell", "TotalMoney","PromotionCell","PaymentMethodCell"]
//    var number = 1
    var numberHourBook = 1
    var promotionCode = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
        setUpLayout()
        setUpTableView()
        button.addTarget(self, action: #selector(didTabPaymentConfirm), for: .touchUpInside)
    }

    func setUpTableView() {
        tableViewInfor.delegate = self
        tableViewInfor.dataSource = self
        for item in listCell {
            tableViewInfor.register(UINib(nibName: item, bundle: nil), forCellReuseIdentifier: item)
        }
    }
    
    func setUpLayout(){
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func didTabPaymentConfirm() {
        let vc = PaymentSuccess()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        saveOrder(newOrder: orderBook)
    }
    
    //MARK: - save order to firebase
    
    func saveOrder(newOrder: Order) {
    
        let orderCollection = createDocument().collection("Order")
        let orderDocument = orderCollection.document(newOrder.id)
        orderDocument.setData(["Id" : newOrder.id,"Name" : newOrder.name, "Type" : newOrder.type, "Date booking order" : newOrder.dateBookOrder, "Date order" : newOrder.dateOrder, "Time start" : newOrder.timeOrderStart, "Time end": newOrder.timeOrderEnd, "Number": newOrder.number, "Phone": newOrder.phone, "Promotion": newOrder.promo, "Address": newOrder.address, "Is End" : newOrder.isEnd])
    }
 
}


extension PaymentConfirmController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InforCell", for: indexPath) as? InforCell
            cell?.lbTitleInfor.text = titleInfor[indexPath.row]
            
            if indexPath.row == 0 {
                cell?.lbContent.text = "\(orderBook.type)"
            
            }
            else if indexPath.row == 1 {
                cell?.lbContent.text = "\(orderBook.dateOrder)"
            
            }
            else if indexPath.row == 2 {
                cell?.lbContent.text = "\(orderBook.timeOrderStart)  to  \(orderBook.timeOrderEnd)"
            
            }
            else if indexPath.row == 3 {
                cell?.lbContent.text = "\(orderBook.number)"
            
            }
            else {
                cell?.lbContent.text = "\(orderBook.phone)"
            }
            
            return cell!
        }
        else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as? ServiceCell
            return cell!
        }
        else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PolicyCell", for: indexPath) as? PolicyCell
            return cell!
        }
        else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalMoney", for: indexPath) as? TotalMoney
            cell?.lbTotalMoney.text = "VND \(numberHourBook*50).000"
            return cell!
        }
        else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCell", for: indexPath) as? PaymentMethodCell
            return cell!
        }
        else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionCell", for: indexPath) as? PromotionCell
            cell?.btnPromotion.addTarget(self, action: #selector(tapEnterPromotion), for: .touchUpInside)
            cell?.tfPromotion.text = orderBook.promo
            print("Promo code: \(orderBook.promo)")
            return cell!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 170
        }
        else if indexPath.row == 6 {
            return 100
        }
        else if indexPath.row == 7 {
            return 80
        }
        else if indexPath.row == 8 {
            return 100
        }
        else if indexPath.row == 9 {
            return 80
        }
        else {
            return 48
            
        }
    }
    
    @objc func tapEnterPromotion() {
        let vc = VoucherController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
