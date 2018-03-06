//
//  TEAwardUserCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 03/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit



class ANEventChildCell: BCUITableViewCell {

    @IBOutlet weak var lblWeekDay: BCUILabel!
    @IBOutlet weak var lblDate: BCUILabel!
    @IBOutlet weak var lblMonth: BCUILabel!
    
    @IBOutlet weak var lblTime: BCUILabel!
    @IBOutlet weak var lblVenue: BCUILabel!
    
    let arrOfWeek = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    let arrOfMonth = ["January","February","March","April","April","June","July","August","September","October","November","December"]
    
    static let reuseIdentifier = "kANEventChildCell"
    static let nibName = "ANEventChildCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.white
    }

    //MARK:- Set Data
    
    func setData(model:ANEventDetails?,baseURL:String?) -> Void {
        
        if let model = model{
    
            let dateFormat = self.dateStringFormat(dateAsString: model.fromDateTime)
            
            self.lblVenue.setText(text: model.venue)
            
            self.lblTime.setText(text: self.dateStringFormat2(from: model.fromDateTime, to: model.toDateTime))
            
            self.lblMonth.setText(text: self.arrOfMonth[dateFormat.month])
            
            self.lblWeekDay.setText(text: self.arrOfWeek[dateFormat.weekDay])
            
            self.lblDate.setText(text:"\(dateFormat.date)")
        }
    }
    
    func dateStringFormat2(from:String?,to:String?) -> String? {
        
        var str = ""
        if let from = from,let to = to{
            
            let dateFromFormatter = DateFormatter()
            dateFromFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
             let dateFrom = dateFromFormatter.date(from: from)
            
            let dateFromFormatter1 = DateFormatter()
            dateFromFormatter1.dateFormat = "HH:mm:ss"
            
            if let dateFrom = dateFrom{
            
                str = dateFromFormatter1.string(from: dateFrom)
            }
            
            let dateToFormatter = DateFormatter()
            dateToFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let dateTo = dateToFormatter.date(from: to)
            
            let dateToFormatter1 = DateFormatter()
            dateToFormatter1.dateFormat = "HH:mm:ss"
            
            if let dateTo = dateTo{
                
                str.append("-"+dateToFormatter1.string(from: dateTo))
                
            }
        }
        return str
    }
    
    func dateStringFormat(dateAsString:String?) -> (month:Int,weekDay:Int,date:Int) {
        
        if let dateString = dateAsString{
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let date = dateFormatter.date(from: dateString)
            
            if let date = date{
            
                let calendar = Calendar.current
                //let year = calendar.component(.year, from: date)
                let month = calendar.component(.month, from: date)
                let weekday = calendar.component(.weekday, from: date)
                let day = calendar.component(.day, from: date)
                
                
                
                return (month,weekday,day)
                
                /*let dateFormatYear = DateFormatter()
                dateFormatYear.dateFormat = "yyy"
                let dateFormatMonth = DateFormatter()
                dateFormatMonth.dateFormat = "yyy"
                print("2---------->",dateFormatYear.string(from: date),month,weekday,day)*/
            }
        }
        return (0,0,0)
    }
}
