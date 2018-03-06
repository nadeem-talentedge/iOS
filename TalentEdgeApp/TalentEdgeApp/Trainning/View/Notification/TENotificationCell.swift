//
//  TEMessageCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 26/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TENotificationCell: BCUITableViewCell {

    static let nibName = "TENotificationCell"
    static let reuseIdentifier = "kTENotificationCell"
    
    @IBOutlet weak var imgUser:BCUIImageView!
    @IBOutlet weak var lblTitle:BCUILabel!
    @IBOutlet weak var btnPostedDate:BCUIButton!
    @IBOutlet weak var btnEventDate:BCUIButton!
    @IBOutlet weak var btnEventDateHeight:NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setData(model:Notifications?) -> Void {
        
        if let model = model{
        
            //print("111",model.dateCreated)
            
            self.lblTitle.setText(text: model.webMessage)
            
            if let status = model.isRead{
            
                if status.lowercased() == "0".lowercased(){
                
                    self.lblTitle.textColor = UIColor.black
                    self.btnPostedDate.setTitleColor(UIColor.black, for: .normal)
                    
                }else{
                
                    self.lblTitle.textColor = UIColor.lightGray
                    self.btnPostedDate.setTitleColor(UIColor.lightGray, for: .normal)
                }
            }
            
            
            if let time = model.dateCreated{
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_MMM_DD_YYYY_h_mm_a){
                    
                    self.btnPostedDate.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.btnPostedDate.setText(text: "NA")
                }
                
            }else{
                
                self.btnPostedDate.setText(text: "NA")
            }
            
            self.btnEventDate.isHidden = true
            self.btnEventDateHeight.constant = 0
        }
    }
}
