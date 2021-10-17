//
//  BookViewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/3/21.
//

import UIKit

class BookViewController: UIViewController {
    
    // MARK: - Variable
    @IBOutlet weak var tableView: UITableView!
    var dateBook: Date = Date()
    var timeBook: Date = Date()
    let currentDate = Date()
    let formater = DateFormatter()
    let formatterCurrent = DateFormatter()
    let button = UIButton().button(text: "Pay")
    let listcell: [String] = ["RoomTypeCell", "SelectTimeCell", "EnterInforBookingCell", "AddressCell"]
    var index = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Booking"
        navigationController?.navigationBar.tintColor = UIColor().mainColor()
        view.addSubview(button)
        initTableView()
        setUpLayout()
    }
    
    func initTableView() {
        tableView.separatorColor = UIColor.clear
        for item in listcell {
            tableView.register(UINib(nibName: item, bundle: nil), forCellReuseIdentifier: item)
        }
        tableView.delegate = self
        tableView.dataSource = self
        button.addTarget(self, action: #selector(didTapPayButton), for: .touchUpInside)
    }
    
    func setUpLayout(){
        button.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    // MARK: - Process Button
    @objc func didTapPayButton() {
        let vc = PaymentConfirmController()
        
        let cellInfor = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? EnterInforBookingCell
        let cellTime = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? SelectTimeCell
        let cellType = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? RoomTypeCell
        let cellAddress = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? AddressCell
        
        guard let numberString = cellInfor?.txtNumber.text, let phoneString = cellInfor?.txtPhone.text, let dateOrder = cellTime?.tfSetDate.text, let timeStart = cellTime?.timeStart.date, let timeEnd = cellTime?.timeEnd.date , let type = cellType?.textFieldType.text, let address = cellAddress?.lbAddress.text else { return  }
        guard let number = Int(numberString), let phone = Int(phoneString) else { return  }

        formater.dateFormat = "h:mm a"
        formatterCurrent.dateFormat = "yyyy/MM/dd HH:mm"
        orderBook = Order(UUID().uuidString,coworkingsList[index].name,type,formatterCurrent.string(from: currentDate), dateOrder, formater.string(from: timeStart) , formater.string(from: timeEnd) , number, phone, "", address, false)

        if timeStart > timeEnd {
            print("Du lieu dat khong dung")
            cellTime?.lbError.text = "Please check time again"
        }
        else {
            let numberHourTimeBook = Int(round((timeEnd.timeIntervalSince1970 - timeStart.timeIntervalSince1970)/3600))
            vc.numberHourBook = numberHourTimeBook
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

// MARK: - Extension
extension BookViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listcell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath) as? RoomTypeCell
            return cell!
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTimeCell", for: indexPath) as? SelectTimeCell
            cell?.binData(timeDate: dateBook, timeHour: timeBook)
            cell?.btnsetDate.addTarget(self, action: #selector(onSelectDate), for: .touchUpInside)
            
            return cell!
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EnterInforBookingCell", for: indexPath) as? EnterInforBookingCell
        
            return cell!
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as? AddressCell
            cell?.lbAddress.text = coworkingsList[index].address
            return cell!
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        }
        else if indexPath.row == 1 {
            return 97
        }
        else if indexPath.row == 2 {
            return 150
        }
        else {
            return 40
        }
    }
    
    @objc func onSelectDate(_ isStart: Bool) {
        let vc = PopupSetDateTime()
        vc.onSelectDate = { date in
            self.dateBook = date
            self.tableView.reloadData()
        }
        self.present(vc, animated: false, completion: nil)
    }

    

    

    
    
}

