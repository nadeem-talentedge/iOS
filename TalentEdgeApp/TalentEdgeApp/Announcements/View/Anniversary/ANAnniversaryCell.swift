//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANAnniversaryCellDelegate {
    
    func anniversaryDidSelectMessage(indexPath:IndexPath?) -> Void
    func anniversaryDidSelectLike(indexPath:IndexPath?) -> Void
}

class ANAnniversaryCell: BCUITableViewCell {

    var delegate:ANAnniversaryCellDelegate?
    
    static let nibName = "ANAnniversaryCell"
    static let reuseIdentifier = "kANAnniversaryCell"
    
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Set Data
    
    func setData(model:ANAnniversaryModel?,baseURL:String?) -> Void {
    
        if let model = model{
        
            self.lblTitle.setText(text: model.title)
            self.lblPostedBy.setText(text: model.byUserName)
            self.btnContentType.setText(text: "Anniversary")
            self.btnPostedTime.setText(text: model.startDate)
            
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
        
            delegate.anniversaryDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.anniversaryDidSelectMessage(indexPath: self.indexPath)
        }
    }
}
