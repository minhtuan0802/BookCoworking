//
//  PopupSetDateTime.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/18/21.
//

import UIKit
import JTAppleCalendar

class PopupSetDateTime: UIViewController {
    
    @IBOutlet weak var btnSetDate: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var viewMonth: UIView!
    
    @IBOutlet weak var calendarView: JTACMonthView!
    @IBOutlet weak var lbMonth: UILabel!
    
    var onSelectDate: ((Date) -> Void)?
    var dateSelect: Date = Date()
    var timer = Timer()
    let formatter = DateFormatter()
    let numberOfRows = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        configureCalendarView()
        btnCancel.layer.cornerRadius = 8
        btnSetDate.layer.cornerRadius = 8
    }
    
    //MARK: - Regiter cell
    func configureCalendarView() {
        calendarView.register(UINib(nibName: "CalendarSectionHeaderView", bundle: Bundle.main),
                              forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                              withReuseIdentifier: "CalendarSectionHeaderView")
        calendarView.register(UINib(nibName: "CalendarCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCell")
        
        self.calendarView.scrollToDate(self.dateSelect,animateScroll: false)
        viewMonth.layer.cornerRadius = 8
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnSetDate(_ sender: Any) {
        self.onSelectDate?(self.dateSelect)
        self.dismiss(animated: false, completion: nil)
    }
    
    //MARK: - Config Cell
    func configureCell(cell: JTACDayCell?, date: Date, cellState: CellState) {
        guard let currentCell = cell as? CalendarCell else { return  }
        currentCell.lbDay.text = cellState.text
        currentCell.lbDay.backgroundColor = .clear
        currentCell.viewDay.backgroundColor = .clear
        configTextCollor(cell: cell, cellState: cellState)
        let cellHidden = cellState.dateBelongsTo != .thisMonth
        currentCell.isHidden = cellHidden
    }
    
    func configTextCollor(cell: JTACDayCell?, cellState: CellState) {
        guard let currentCell = cell as? CalendarCell else { return  }
        
        if cellState.isSelected == true {
            currentCell.lbDay.textColor = .white
            currentCell.lbDay.backgroundColor = .clear
            currentCell.viewDay.backgroundColor = UIColor().mainColor()
            currentCell.lbDay.backgroundColor = UIColor().mainColor()
            currentCell.viewDay.layer.cornerRadius = currentCell.viewDay.frame.size.width/2
        }
        else {
            if cellState.date >= Date() {
                currentCell.lbDay.textColor = .black
                currentCell.isUserInteractionEnabled = true
            }
            else {
                currentCell.lbDay.textColor = .gray
                currentCell.isUserInteractionEnabled = false
            }
        }
    }
    
}

//MARK: Extension
extension PopupSetDateTime : JTACMonthViewDataSource {
    
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let dateF = DateFormatter()
        formatter.dateFormat = "dd MM yy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        dateF.dateFormat = "yy"
        dateF.timeZone = Calendar.current.timeZone
        dateF.locale = Calendar.current.locale
        calendar.scrollingMode = .stopAtEachSection
        
        let startDate = Date()
        let dateFInt = Int(dateF.string(from: startDate))
        
        let endDate = formatter.date(from: "31 12 \((dateFInt ?? 30) + 1)")!
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: numberOfRows,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfRow,
                                                 firstDayOfWeek: .monday,
                                                 hasStrictBoundaries: true)
        return parameters
    }
    
}

extension PopupSetDateTime: JTACMonthViewDelegate {
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CalendarCell
        configureCell(cell: cell, date: date, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        configureCell(cell: cell, date: date, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        self.dateSelect = date
        configureCell(cell: cell, date: date, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(cell: cell, date: date, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        let date = range.start
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.lbMonth.text = formatter.string(from: date)
        })
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "CalendarSectionHeaderView", for: indexPath)
        
        
        (header as! CalendarSectionHeaderView).title.text = formatter.string(from: date)
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 0.000001)
    }
    
    
}

