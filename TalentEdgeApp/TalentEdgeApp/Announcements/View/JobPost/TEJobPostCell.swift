//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEJobPostCellDelegate {
    
    func jobPostDidSelectRefer(indexPath:IndexPath?) -> Void
    func jobPostDidSelectMessage(indexPath:IndexPath?) -> Void
    func jobPostDidSelectLike(indexPath:IndexPath?) -> Void
    func jobPostDidSelectDownloadFile(indexPath:IndexPath?) -> Void
}

class TEJobPostCell: BCUITableViewCell {

    
    var delegate:TEJobPostCellDelegate?
    
    static let reuseIdentifier = "kTEJobPostCell"
    static let nibName = "TEJobPostCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblPostedBy: BCUILabel!
    @IBOutlet weak var btnContentType: BCUIButton!
    @IBOutlet weak var btnPostedTime: BCUIButton!
    @IBOutlet weak var lblRewardValue: BCUILabel!
    
    @IBOutlet weak var lblJobID: BCUILabel!
    @IBOutlet weak var lblJobLocation: BCUILabel!
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var imgProfile: BCUIImageView!
    
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
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK:- IBAction
    
    @IBAction func like(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.jobPostDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.jobPostDidSelectMessage(indexPath: self.indexPath)
        }
    }
    
    @IBAction func downloadFile(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.jobPostDidSelectDownloadFile(indexPath: self.indexPath)
        }
    }
    
    @IBAction func refer(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.jobPostDidSelectRefer(indexPath: self.indexPath)
        }
    }
    
    func setData(model:ANRecruitmentModel?) -> Void {
        
        if let model = model {
            
            self.lblTitle.setText(text: model.title)
            self.lblPostedBy.setText(text: model.byUserName)
            self.btnContentType.setText(text: "Recruitment")
            self.imgLogo.setImage(name: "list_recruitment")
            self.lblRewardValue.setText(text: model.rewardAmount)
            
            self.lblRewardValue.setText(text: model.rewardAmount)
            
            self.lblJobID.setText(text: model.byUserDepartment)
            self.lblJobLocation.setText(text: model.byUserDesignation)
            
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
            
            self.lblHeading1.setText(text: model.descriptionValue)
            self.lblHeading2.setText(text: "")
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
                
            }else{
                
                self.btnLike.isSelected = false
            }
            
            
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
        }
        
    }
}
