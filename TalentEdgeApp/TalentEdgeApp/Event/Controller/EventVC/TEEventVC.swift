//
//  TEEventVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import CalendarKit
import DateToolsSwift
import NVActivityIndicatorView

enum SelectedStyle {
 
    case Dark
    case Light
}

class TEEventVC: DayViewController, DatePickerControllerDelegate,NVActivityIndicatorViewable {
    
    
    var currentStyle = SelectedStyle.Light
    var baseViewController:UIViewController?
    var eventModel:[EventEntity]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "CalendarKit Demo"
        
        navigationController?.navigationBar.isTranslucent = false
        
        dayView.autoScrollToFirstEvent = true
        
        reloadData()
        
        changeStyle()
        
        if let date = Calendar.current.date(byAdding: .month, value: -10, to: Date()){
        
            self.callWebserviceForEventList(timeInterval: date.timeIntervalSince1970)
        }
        
    }
    
    func changeStyle() {
        
        //var title: String!
        
        var style: CalendarStyle!
        
        if currentStyle == .Dark {
            
            currentStyle = .Light
            title = "Dark"
            style = StyleGenerator.defaultStyle()
            
        } else {
            
            title = "Light"
            style = StyleGenerator.darkStyle()
            currentStyle = .Dark
        }
        
        updateStyle(style)
    }
    
    func presentDatePicker() {
        
        let picker = DatePickerController()
        //picker.date = dayView.state!.selectedDate
        picker.delegate = self
        let navC = UINavigationController(rootViewController: picker)
        navigationController?.present(navC, animated: true, completion: nil)
    }
    
    func datePicker(controller: DatePickerController, didSelect date: Date?) {
        
        if date != nil {
            
            //dayView.state?.move(to: date)
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: EventDataSource
    
    func event() -> Void {
     
       _ = self.eventsForDate(Date())
        
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        
        var events = [Event]()
        
        if let eventModel = TEDBManager.sharedInstance.getEventEntityForDate(eventStartDate: date as NSDate){
        
            if eventModel.count > 0 {
            
                //print("1--1--1")
                self.eventModel = eventModel
                
                for (index,model) in eventModel.enumerated() {
                    
                    //print("Start------------------>",model.title ?? "NA","\n",model.start_date_complete ?? "NA")
                    
                    //print("Index 1 ---------->",index)
                    
                    if let startDate = model.start_date_complete, let endDate = model.end_date_complete {
                        
                        let event = Event()
                        
                        let datePeriod = TimePeriod(beginning: startDate as Date, end: endDate as Date)
                        
                        event.datePeriod = datePeriod
                        event.userInfo = index
                        
                        if let info = model.title{
                            
                            event.text = info
                        }
                        
                        if let color = model.color_code {
                            
                            event.color = Utility.colorWithHexString(hexa:  color)
                            
                        }else{
                            
                            event.color = Utility.getColorAccordingTheme(theme: .THEME_2)
                        }
                        events.append(event)
                    }
                }
            }
        }
        return events
    }
    
    // MARK: DayViewDelegate
    
    override func dayViewDidSelectEventView(_ eventView: EventView) {
        
        guard let descriptor = eventView.descriptor as? Event else {
            
            return
        }
        
        if let info = descriptor.userInfo{
        
            if info is Int {
                
                let controller = TECalenderEventDetailVC(nibName: "TECalenderEventDetailVC", bundle: nil)
                
                if let model = self.eventModel{
                
                    if model.count > 0{
                        
                        print("Index 2 ---------->",info)
                        
                        controller.eventEntity = model[info as! Int]
                        
                        if let vc = self.baseViewController {
                            
                            vc.presentPopupViewController(controller, animationType:MJPopupViewAnimationSlideBottomBottom)
                            //vc.navigationController?.pushViewController(controller, animated: true)
                        }
                    }
                }
                
            }
        }
    }
    
    override func dayViewDidLongPressEventView(_ eventView: EventView) {
        
        guard let descriptor = eventView.descriptor as? Event else {
            
            return
        }
        
        //print("Event has been longPressed: \(descriptor) \(String(describing: descriptor.userInfo))")
    }
    
    override func dayView(dayView: DayView, willMoveTo date: Date) {
        
        //self.callWebserviceForEventList(timeInterval: date.timeIntervalSince1970)
        //print("DayView = \(dayView) will move to: \(date)")
    }
    
    override func dayView(dayView: DayView, didMoveTo date: Date) {
        
            //print("DayView = \(dayView) did move to: \(date)")
    }
    

}

extension TEEventVC {
    
    func callWebserviceForEventList(timeInterval:TimeInterval) {
        
        self.startAnimating()
    
        let header = NSMutableDictionary();
        
        let body = NSMutableDictionary();
        body.setValue(timeInterval, forKey: "timestamp")
        body.setValue("12", forKey: "content_type_id")
        
        
        NetworkManager.httpPostRequest(.getEventCalendar, dataParam: body, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Event Calender : ------> ",data?.string() ?? "NS");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        if let arr = data.value(forKey: "resultData") as? NSArray{
                        
                            for dict in arr {
                            
                                TEDBManager.sharedInstance.saveEventDetailModel(dict: dict as? NSDictionary)
                            }
                        }
                        
                    }
                }
            }
            self.event()
            self.stopAnimating()
        } )
    }
}
