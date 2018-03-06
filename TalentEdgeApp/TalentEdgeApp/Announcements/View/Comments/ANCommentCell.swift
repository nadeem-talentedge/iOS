//
//  ANCommentCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 07/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANCommentCellDelegate {
    
    func likeClick(indexPath:IndexPath?) -> Void
    func replyClick(indexPath:IndexPath?) -> Void
}

class ANCommentCell: BCUITableViewCell {

    static let reuseIdentifier = "kANCommentCell"
    static let nibName = "ANCommentCell"
    var delegate:ANCommentCellDelegate?
    
    @IBOutlet weak var lblName:BCUILabel!
    @IBOutlet weak var lblMessage:BCUILabel!
    @IBOutlet weak var lblTime:BCUILabel!
    
    @IBOutlet weak var btnLike:BCUIButton!
    @IBOutlet weak var btnComment:BCUIButton!
    
    @IBOutlet weak var imgICon:BCUIImageView!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblName.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        self.lblMessage.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        self.lblTime.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        
        self.btnLike.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1), for: .normal)
        self.btnComment.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1), for: .normal)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setData(model:CommentResultData?,baseUrl:String?) -> Void {
        
        //print("COmment Created date :-",model?.created)
        
        if let model = model,let baseUrl = baseUrl{
        
            self.lblName.setText(text: model.userName)
            self.lblMessage.setText(text: model.comment)
            self.imgICon.setImageFromUrl(url: baseUrl+model.userPic!, placeHolder: nil)
            
            if let time = model.created{
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.lblTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.lblTime.setText(text: "NA")
                }
                
            }else{
                
                self.lblTime.setText(text: "NA")
            }
            
        }else{
        
            self.lblName.setText(text: "NA")
            
            self.lblMessage.setText(text: "NA")
            
            self.lblTime.setText(text: "NA")
        }
        
    }
    
    func setReplyData(model:Reply?,baseUrl:String?) -> Void {
        
        self.btnComment.isHidden = true
        
        if let model = model,let baseUrl = baseUrl{
            
            self.lblName.setText(text: model.userName)
            self.lblMessage.setText(text: model.comment)
            self.imgICon.setImageFromUrl(url: baseUrl+model.userPic!, placeHolder: nil)
            
            if let time = model.created{
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.lblTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.lblTime.setText(text: "NA")
                }
                
            }else{
                
                self.lblTime.setText(text: "NA")
            }
            
        }else{
            
            self.lblName.setText(text: "NA")
            
            self.lblMessage.setText(text: "NA")
            
            self.lblTime.setText(text: "NA")
        }
        
    }
    
    @IBAction func likeClick(sender:BCUIButton) -> Void{
    
        if let delegate = self.delegate{
        
            delegate.likeClick(indexPath: self.indexPath)
        }
    }
    
    @IBAction func replyClick(sender:BCUIButton) -> Void{
    
        if let delegate = self.delegate{
          
            delegate.replyClick(indexPath: indexPath)
        }
    }
}
