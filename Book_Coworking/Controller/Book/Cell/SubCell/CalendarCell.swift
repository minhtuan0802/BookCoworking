//
//  CalendarCell.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/18/21.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTACDayCell {

    @IBOutlet weak var viewDay: UIView!
    @IBOutlet weak var lbDay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
