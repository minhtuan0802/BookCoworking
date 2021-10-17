//
//  VoucherController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/23/21.
//

import UIKit

class VoucherController: UIViewController {
    
    @IBOutlet weak var tableVoucher: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
    }
    
    func configTable(){
        tableVoucher.delegate = self
        tableVoucher.dataSource = self
        tableVoucher.register(UINib(nibName: "VoucherCell", bundle: nil), forCellReuseIdentifier: "VoucherCell")
    }
    
}

extension VoucherController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoucherCell", for: indexPath) as? VoucherCell
        return cell!
    }
    
    //MARK: - select voucher
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? VoucherCell
        UIPasteboard.general.string = cell?.lbCodePromotion.text! ?? ""
        
        orderBook.promo = cell?.lbCodePromotion.text! ?? ""
        for item in navigationController!.viewControllers {
            if item is PaymentConfirmController {
                let vc = PaymentConfirmController()
                vc.promotionCode = cell?.lbCodePromotion.text! ?? ""
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        let alert = UIAlertController(title: "Notification", message: "copied the promo code", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(copy(_:))
    }
    
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return (tableView.cellForRow(at: indexPath)?.detailTextLabel?.text) != nil
    }
    
}
