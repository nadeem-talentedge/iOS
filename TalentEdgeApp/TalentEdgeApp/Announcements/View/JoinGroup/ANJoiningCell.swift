//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANJoiningCellDelegate {
    
    func joinningDidSelectMessage(indexPath:IndexPath?) -> Void
    func joinningDidSelectLike(indexPath:IndexPath?) -> Void
}

class ANJoiningCell: BCUITableViewCell {

    var delegate:ANJoiningCellDelegate?
    
    static let reuseIdentifier = "kANJoiningCell"
    static let nibName = "ANJoiningCell"
    
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
        
        self.lblTitle.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        
        self.lblPostedBy.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        
        self.btnContentType.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_3), for: .normal)
        
        self.btnPostedTime.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_3), for: .normal)
        
        self.lblAboutTitle.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        
        self.lblTotalLikes.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        
        self.lblTotalComments.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        
        self.lblTotalShares.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        
        
        self.btnLike.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        
        self.btnLike.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        
        self.btnLike.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Set Data
    
    func setData(model:ANJoinningModel?,baseURL:String?) -> Void {
    
        if let model = model{
        
            if let baseURL = baseURL {
                
                self.imgLogo.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
                self.imgProfile.setImageFromUrl(url: baseURL+(model.toUserPic ?? ""), placeHolder: nil);
            }
            
            self.lblTitle.setText(text: model.title)
            self.lblPostedBy.setText(text: model.byUserName)
            self.btnContentType.setText(text: "Joinning")
            self.btnPostedTime.setText(text: model.startDate)
            
            self.lblAboutTitle.numberOfLines = 3
            self.lblAboutTitle.setText(text: model.descriptionValue)
            
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
            
            delegate.joinningDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.joinningDidSelectMessage(indexPath: self.indexPath)
        }
    }
}
