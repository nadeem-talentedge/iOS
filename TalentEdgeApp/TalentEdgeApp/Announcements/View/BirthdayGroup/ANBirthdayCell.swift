//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANBirthdayCellDelegate {
    
    func birthdayDidSelectMessage(indexPath:IndexPath?) -> Void
    func birthdayDidSelectLike(indexPath:IndexPath?) -> Void
}

class ANBirthdayCell: BCUITableViewCell {

    var delegate:ANBirthdayCellDelegate?
    
    static let reuseIdentifier = "kANBirthdayCell"
    static let nibName = "ANBirthdayCell"
    
    @IBOutlet weak var lblTopContainer: BCView!
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblPostedBy: BCUILabel!
    @IBOutlet weak var btnContentType: BCUIButton!
    @IBOutlet weak var btnPostedTime: BCUIButton!
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var imgProfile: BCUIImageView!
    
    @IBOutlet weak var lblAboutTitle: BCUILabel!
    //@IBOutlet weak var lblAboutDetail: BCUILabel!
    
    @IBOutlet weak var lblTotalLikes: BCUILabel!
    @IBOutlet weak var btnLike: BCUIButton!
    
    @IBOutlet weak var lblTotalComments: BCUILabel!
    @IBOutlet weak var btnComment: BCUIButton!
    
    @IBOutlet weak var lblTotalShares: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .large
        self.lblTitle.fontType = .bold
        self.lblTitle.setTextColor = .text_heading
        
        self.lblPostedBy.fontSize = .medium
        self.lblPostedBy.fontType = .regular
        self.lblPostedBy.setTextColor = .text_subheading
        
        self.btnContentType.fontSize = .small
        self.btnContentType.fontType = .light
        self.btnContentType.setTextColor = .text_normal
        
        self.btnPostedTime.fontSize = .small
        self.btnPostedTime.fontType = .light
        self.btnPostedTime.setTextColor = .text_normal
        
        self.lblAboutTitle.fontSize = .small
        self.lblAboutTitle.fontType = .light
        self.lblAboutTitle.setTextColor = .text_normal
        
        self.lblTotalLikes.fontSize = .small
        self.lblTotalLikes.fontType = .light
        self.lblTotalLikes.setTextColor = .text_normal
        
        self.lblTotalComments.fontSize = .small
        self.lblTotalComments.fontType = .light
        self.lblTotalComments.setTextColor = .text_normal
        
        self.lblTotalShares.fontSize = .small
        self.lblTotalShares.fontType = .light
        self.lblTotalShares.setTextColor = .text_normal
        
        //lblTopContainer.backgroundColor = ThemeManager.setThemeColor(appColor:.top_container_background)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Set Data
    
    func setData(model:ANBirthdayModel?,baseURL:String?) -> Void {
    
        print("Birthday")
        if let model = model{
        
            if let baseURL = baseURL {
                
                //self.imgLogo.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
                self.imgProfile.setImageFromUrl(url: baseURL+(model.toUserPic ?? ""), placeHolder: nil);
            }
            
            self.lblTitle.setText(text: model.title)
            self.lblPostedBy.setText(text: model.byUserName)
            self.btnContentType.setText(text: "Birthday")
            
            if let time = model.startDate{
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.btnPostedTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.btnPostedTime.setText(text: "NA")
                }
                
            }else{
                
                self.btnPostedTime.setText(text: "NA")
            }
            //self.btnPostedTime.setText(text: model.startDate)
            
            self.lblAboutTitle.numberOfLines = 3
            self.lblAboutTitle.attributedText = model.descriptionValue?.htmlToNormal(fontSize: 14)
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
            }else{
                
                self.btnLike.isSelected = false
            }
        }
    }

    
    //MARK:- IBAction
    
    @IBAction func like(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.birthdayDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.birthdayDidSelectMessage(indexPath: self.indexPath)
        }
    }
}
