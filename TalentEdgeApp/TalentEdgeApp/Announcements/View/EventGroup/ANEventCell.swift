//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANEventCellDelegate {
    
    func eventDidSelectMessage(indexPath:IndexPath?) -> Void
    func eventDidSelectLike(indexPath:IndexPath?) -> Void
    func eventTableReloadDelegate(indexPath:IndexPath?) -> Void
}

class ANEventCell: BCUITableViewCell {
    
    var delegate:ANEventCellDelegate?
    
    static let reuseIdentifier = "kANEventCell"
    static let nibName = "ANEventCell"
    static let nibNameForDetail = "ANEventDetailCell"
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblPostedBy: BCUILabel!
    @IBOutlet weak var btnContentType: BCUIButton!
    @IBOutlet weak var btnPostedTime: BCUIButton!
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    
    @IBOutlet weak var lblTotalLikes: BCUILabel!
    @IBOutlet weak var btnLike: BCUIButton!
    
    @IBOutlet weak var lblTotalComments: BCUILabel!
    @IBOutlet weak var btnComment: BCUIButton!
    
    @IBOutlet weak var lblTotalShares: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    
    @IBOutlet weak var btnInterested: BCUIButton!
    
    var baseURL:String?
    
    var eventDetails:[ANEventDetails]?
    
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
        
        if self.btnInterested != nil{
            
           self.btnInterested.fontSize  = .small
            self.btnInterested.fontType  = .bold
            self.btnInterested.setTextColor = .text_app_button
            self.btnInterested.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
        }
        
        if self.lblTotalLikes != nil {
        
            self.lblTotalLikes.fontSize = .small
            self.lblTotalLikes.fontType = .light
            self.lblTotalLikes.setTextColor = .text_normal
            
            self.lblTotalComments.fontSize = .small
            self.lblTotalComments.fontType = .light
            self.lblTotalComments.setTextColor = .text_normal
            
            self.lblTotalShares.fontSize = .small
            self.lblTotalShares.fontType = .light
            self.lblTotalShares.setTextColor = .text_normal
        }
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK:- Set Data
    
    func setData(model:ANEventModel?,baseURL:String?) -> Void {
        
        if let model = model{
            
            for view in self.stackView.subviews{
                
                view.isHidden = true
                self.stackView.removeArrangedSubview(view)
            }
            
            self.baseURL = baseURL
            
            #if ELSA
                
                if let user = model.byUserPic, let base = baseURL{
                    
                    self.imgLogo.setImageFromUrl(url:"\(base)\(user)", placeHolder: nil)
                }
            
            #else
                
                self.imgLogo.setImage(name: "list_event")
                
                self.btnContentType.setImage(UIImage(named: "content_type_event"), for: .normal)
                
                self.btnContentType.setText(text: "Event")
                
            #endif
            
            self.eventDetails = model.eventDetails
            
            self.lblTitle.setText(text: model.title)
            
            self.lblPostedBy.setText(text: model.byUserName)
            
            self.btnContentType.setText(text: "Event")
            
            
            if let time = model.startDate{
                
                
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.btnPostedTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.btnPostedTime.setText(text: "NA")
                }
                
            }else{
                
                self.btnPostedTime.setText(text: "NA")
            }
            
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
                
            }else{
                
                self.btnLike.isSelected = false
            }
            
            
            if let events = self.eventDetails{
                
                for event in events{
                    
                    let view = Bundle.main.loadNibNamed(TEEventDateView.nibName, owner: self, options: nil)?[0] as! TEEventDateView
                    
                    view.setData(model: event, baseURL: self.baseURL)
                    
                    self.stackView.addArrangedSubview(view)
                    
                    UIView.animate(withDuration: 0.1, animations: {
                        
                        self.stackView.layoutIfNeeded()
                    })
                }
            }
            
        }
    }
    
    func setDataForEventDetail(model:ANEventModel?,baseURL:String?) -> Void {
        
        if let model = model{
            
            self.baseURL = baseURL
            
            #if ELSA
                
                if let user = model.byUserPic, let base = baseURL{
                    
                    self.imgLogo.setImageFromUrl(url:"\(base)\(user)", placeHolder: nil)
                }
                
            #else
                
                self.imgLogo.setImage(name: "list_event")
                
            #endif
            
            self.eventDetails = model.eventDetails
            
            self.lblTitle.setText(text: model.title)
            
            self.lblPostedBy.setText(text: model.byUserName)
            
            self.btnContentType.setText(text: "Event")
            
            if let time = model.startDate{
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.btnPostedTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.btnPostedTime.setText(text: "NA")
                }
                
            }else{
                
                self.btnPostedTime.setText(text: "NA")
            }
            
            if let events = self.eventDetails{
                
                for event in events{
                    
                    let view = Bundle.main.loadNibNamed(TEEventDateView.nibName, owner: self, options: nil)?[0] as! TEEventDateView
                    
                    view.setData(model: event, baseURL: self.baseURL)
                    
                    self.stackView.addArrangedSubview(view)
                    
                    UIView.animate(withDuration: 0.1, animations: {
                        
                        self.stackView.layoutIfNeeded()
                    })
                }
            }
            
        }
    }
    
    //MARK:- Celebration
    
    func setCelebrationData(model:ANCelebrationModel?,baseURL:String?) -> Void {
        
        if let model = model{
            
            for view in self.stackView.subviews{
                
                view.isHidden = true
                self.stackView.removeArrangedSubview(view)
            }
            self.baseURL = baseURL
            
            self.imgLogo.setImage(name: "list_celebrations")
            
            self.btnContentType.setImage(UIImage(named: "content_type_celebrations"), for: .normal)
            
            self.btnContentType.setText(text: "Celebration")
                
            self.eventDetails = model.eventDetails
            
            self.lblTitle.setText(text: model.title)
            
            self.lblPostedBy.setText(text: model.byUserName)
            
            if let time = model.startDate{
                
                
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.btnPostedTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.btnPostedTime.setText(text: "NA")
                }
                
            }else{
                
                self.btnPostedTime.setText(text: "NA")
            }
            
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
                
            }else{
                
                self.btnLike.isSelected = false
            }
            
            
            if let events = self.eventDetails{
                
                for event in events{
                    
                    let view = Bundle.main.loadNibNamed(TEEventDateView.nibName, owner: self, options: nil)?[0] as! TEEventDateView
                    
                    view.setData(model: event, baseURL: self.baseURL)
                    
                    self.stackView.addArrangedSubview(view)
                    
                    UIView.animate(withDuration: 0.1, animations: {
                        
                        self.stackView.layoutIfNeeded()
                    })
                }
            }
            
        }
    }
    
    //MARK:- IBAction
    
    @IBAction func like(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.eventDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.eventDidSelectMessage(indexPath: self.indexPath)
        }
    }
}



