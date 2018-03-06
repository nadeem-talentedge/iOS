//
//  TEMessageCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 26/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEMessageCell: BCUITableViewCell {

    static let nibName = "TEMessageCell"
    static let reuseIdentifier = "kTEMessageCell"
    
    @IBOutlet weak var imgUser: BCUIImageView!
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblDescription: BCUILabel!
    @IBOutlet weak var lblDate: BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setMessageData(model:TopMessage?) -> Void {
        
        if let model = model {
            
            self.imgUser.setImageFromUrl(url: model.fromUserPic ?? model.toUserPic, placeHolder: nil)
            
            self.lblName.setText(text: model.fromName ?? model.toName)
            
            self.lblTitle.setText(text: model.subject)
            
            self.lblDescription.setText(text: model.message)
            
            if let date = model.created{
            
                if  let date = Utility.dateFromStrig(date: date, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.lblDate.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }
            }
            
        }
    }
}
