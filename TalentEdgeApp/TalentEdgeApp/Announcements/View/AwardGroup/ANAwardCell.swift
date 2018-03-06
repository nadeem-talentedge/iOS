//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANAwardCellDelegate {
    
    func awardDidSelectMessage(indexPath:IndexPath?) -> Void
    func awardDidSelectLike(indexPath:IndexPath?) -> Void
}

class ANAwardCell: BCUITableViewCell {

    var delegate:ANAwardCellDelegate?
    
    static let reuseIdentifier = "kANAwardCell"
    static let nibName = "ANAwardCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblPostedBy: BCUILabel!
    @IBOutlet weak var btnContentType: BCUIButton!
    @IBOutlet weak var btnPostedTime: BCUIButton!
    
    @IBOutlet weak var imgProfile: BCUIImageView!
    
    @IBOutlet weak var lblHeading1: BCUILabel!
    
    @IBOutlet weak var lblTotalLikes: BCUILabel!
    @IBOutlet weak var btnLike: BCUIButton!
    
    @IBOutlet weak var lblTotalComments: BCUILabel!
    @IBOutlet weak var btnComment: BCUIButton!
    
    @IBOutlet weak var lblTotalShares: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    
    @IBOutlet weak var collectionView: BCUICollectionView!
    
    @IBOutlet weak var btnReferFriend: BCUIButton!
    
    var baseURL:String?
    
    var awardUsers:[ANAwardToUser]? {
    
        didSet{
        
            self.collectionView.reloadData()
        }
    }
    
    
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
        
        self.lblTotalLikes.fontSize = .small
        self.lblTotalLikes.fontType = .light
        self.lblTotalLikes.setTextColor = .text_normal
        
        self.lblTotalComments.fontSize = .small
        self.lblTotalComments.fontType = .light
        self.lblTotalComments.setTextColor = .text_normal
        
        self.lblTotalShares.fontSize = .small
        self.lblTotalShares.fontType = .light
        self.lblTotalShares.setTextColor = .text_normal
        
        self.collectionView.registerCellWithCollection(nibName: ANAwardUserCell.nibName, reuseIdentifier: ANAwardUserCell.reuseIdentifier)
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Set Data
    
    func setData(model:ANAwardModel?,baseURL:String?) -> Void {
    
        if let model = model{
        
            self.baseURL = baseURL
            self.awardUsers = model.awardToUser
            
            /*if let baseURL = baseURL {
                
                //self.imgProfile.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
                //self.imgLogo.setImageFromUrl(url: baseURL+(model.birthdayLogo ?? ""), placeHolder: nil);
            }*/
            
            self.lblTitle.setText(text: model.title)
            
            self.lblPostedBy.setText(text: model.byUserName)
            
            self.btnContentType.setText(text: "Awards")
            
            if let time = model.startDate{
                
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
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
            }else{
                
                self.btnLike.isSelected = false
            }
        }
    }

}

extension ANAwardCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let data = self.awardUsers{
            
            if data.count > 0{
                
                return data.count
            }
            
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ANAwardUserCell.reuseIdentifier, for: indexPath) as! ANAwardUserCell;
        cell.setData(model: self.awardUsers?[indexPath.row], baseURL: self.baseURL)
        return cell
    }
    
    //MARK:- IBAction
    
    @IBAction func like(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.awardDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.awardDidSelectMessage(indexPath: self.indexPath)
        }
    }
}
