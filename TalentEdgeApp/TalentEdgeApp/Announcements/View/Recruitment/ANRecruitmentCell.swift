//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANRecruitmentCellDelegate {
    
    func recruitmentDidSelectRefer(indexPath:IndexPath?) -> Void
    func recruitmentDidSelectMessage(indexPath:IndexPath?) -> Void
    func recruitmentDidSelectLike(indexPath:IndexPath?) -> Void
    func recruitmentDidSelectDownloadFile(indexPath:IndexPath?) -> Void
}

class ANRecruitmentCell: BCUITableViewCell {

    
    var delegate:ANRecruitmentCellDelegate?
    
    static let reuseIdentifier = "kANRecruitmentCell"
    static let nibName = "ANRecruitmentCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblPostedBy: BCUILabel!
    @IBOutlet weak var btnContentType: BCUIButton!
    @IBOutlet weak var btnPostedTime: BCUIButton!
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    
    @IBOutlet weak var lblHeading1: BCUILabel!
    @IBOutlet weak var lblHeading2: BCUILabel!
    
    @IBOutlet weak var lblresourcesName: BCUILabel!
    @IBOutlet weak var viewResources: BCView!
    @IBOutlet weak var viewResourcesHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblTotalLikes: BCUILabel!
    @IBOutlet weak var btnLike: BCUIButton!
    
    @IBOutlet weak var lblTotalComments: BCUILabel!
    @IBOutlet weak var btnComment: BCUIButton!
    
    @IBOutlet weak var lblTotalShares: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    
    @IBOutlet weak var btnReffer: BCUIButton!
    
    @IBOutlet weak var viewJobStatus: BCView!
    @IBOutlet weak var lblJobStatus: BCUILabel!
    
    
    
    
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
        
        self.lblHeading1.fontSize = .small
        self.lblHeading1.fontType = .light
        self.lblHeading1.setTextColor = .text_normal
        
        self.lblresourcesName.fontSize = .small
        self.lblresourcesName.fontType = .light
        self.lblresourcesName.setTextColor = .text_normal
        
        self.lblTotalLikes.fontSize = .small
        self.lblTotalLikes.fontType = .light
        self.lblTotalLikes.setTextColor = .text_normal
        
        self.lblTotalComments.fontSize = .small
        self.lblTotalComments.fontType = .light
        self.lblTotalComments.setTextColor = .text_normal
        
        self.lblTotalShares.fontSize = .small
        self.lblTotalShares.fontType = .light
        self.lblTotalShares.setTextColor = .text_normal
        
        self.btnReffer.fontSize  = .small
        self.btnReffer.fontType  = .bold
        self.btnReffer.setTextColor = .text_app_button
        self.btnReffer.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Set Data
    
    func setData(model:ANRecruitmentModel?,baseURL:String?) -> Void {
        
        //print(":---------->",model?.byUserPic,baseURL)
        
        if let model = model{
        
            self.lblTitle.setText(text: model.title)
            
            self.lblPostedBy.setText(text: model.byUserName)
            
            self.btnContentType.setText(text: "Recruitment")
            
            #if ELSA
                
                if let user = model.byUserPic, let base = baseURL{
                    
                    self.imgLogo.setImageFromUrl(url: base+user, placeHolder: nil)
               }
                //self.imgLogo.setImage(name: "ic_jobboard")
                
            #else
                
                self.imgLogo.setImage(name: "list_recruitment")
                
            #endif
            
            if let time = model.startDate{
                
                //print("Recriutment time : -----------> ",time)
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                    
                    self.btnPostedTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                    
                    self.btnPostedTime.setText(text: "NA")
                }
                
            }else{
                
                self.btnPostedTime.setText(text: "NA")
            }
            
            
            self.lblHeading1.numberOfLines = 3
            self.lblHeading1.setText(text: model.descriptionValue)
            
            self.lblHeading2.setText(text: "")
            
            if let path = model.contentPath as NSString? {
                
                if path.isEqual(to: "") || path.length <= 0 {
                
                    self.viewResources.isHidden = true
                    self.viewResourcesHeight.constant = 0.0
                    
                }else{
                
                    self.lblresourcesName.setText(text: path.lastPathComponent)
                    self.viewResources.isHidden = false
                    self.viewResourcesHeight.constant = 40.0
                }
                
            }else{
            
                self.viewResources.isHidden = true
                self.viewResourcesHeight.constant = 0.0
            }
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
            }else{
                
                self.btnLike.isSelected = false
            }
            
            if let status = model.recruitmentStatus{
            
                if status == "0"{
                
                    
                    self.lblJobStatus.textColor = UIColor(colorLiteralRed: 78.0/255.0, green: 170.0/255.0, blue: 25.0/255.0, alpha: 1.0)
                    self.lblJobStatus.setText(text: "Open")
                    
                }else if status == "1"{
                
                    //78, 170, 25
                    self.lblJobStatus.textColor = UIColor.red
                    self.lblJobStatus.setText(text: "On Hold")
                    
                }else{
                
                    self.lblJobStatus.textColor = UIColor.red
                    self.lblJobStatus.setText(text: "Closed")
                }
            }
        }
    }

    //MARK:- IBAction
    
    @IBAction func refer(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.recruitmentDidSelectRefer(indexPath: self.indexPath)
        }
    }
    
    @IBAction func like(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.recruitmentDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.recruitmentDidSelectMessage(indexPath: self.indexPath)
        }
    }
    
    @IBAction func downloadFile(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.recruitmentDidSelectDownloadFile(indexPath: self.indexPath)
        }
    }
}
