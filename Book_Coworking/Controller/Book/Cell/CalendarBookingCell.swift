//
//  CalendarBookingCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/16/21.
//

import UIKit
import JTAppleCalendar

class CalendarBookingCell: UITableViewCell {
  
    @IBOutlet weak var calendarView: JTACMonthView!
    @IBOutlet weak var lbMonth: UILabel!
    
    let formater = DateFormatter()
    let numberOfRows = 6
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Config Cell
//    func configureCell(cell: JTACDayCell, cellState: CellState, isSelect: Bool) {
//        guard let currentCell = cell as? CalendarCell else { return  }
//        currentCell.lbDay.text = cellState.text
//        
//    }
    
}

extension CalendarBookingCell : JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"

        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate, endDate: endDate)
    }
    
}

extension CalendarBookingCell: JTACMonthViewDelegate {
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CalendarCell
        cell.lbDay.text = cellState.text
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.lbDay.text = cellState.text
        return cell
    }
    
    

    
}
