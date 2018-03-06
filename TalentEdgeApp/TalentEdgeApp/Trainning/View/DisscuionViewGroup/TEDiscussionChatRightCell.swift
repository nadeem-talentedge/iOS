//
//  TEDiscussionChatRightCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 11/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEDiscussionChatRightCell: BCUITableViewCell {

    
    @IBOutlet weak var heightConstraint_AttachView: NSLayoutConstraint!
    static let reuseIdentifier = "KTEDiscussionChatRightCell"
    static let nibName = "TEDiscussionChatRightCell"
    
    @IBOutlet weak var lblTime: BCUILabel!
    @IBOutlet weak var lblUsername: BCUILabel!
    @IBOutlet weak var lblChat: BCUILabel!
    @IBOutlet weak var imgDoc: BCUIImageView!
    @IBOutlet weak var btnDownload: BCUIButton!
    @IBOutlet weak var imgUser: BCUIImageView!
    @IBOutlet weak var lblDocName: BCUILabel!
    
    @IBOutlet weak var viewDoc: BCView!
    
    @IBAction func download_Click(_ sender: BCUIButton) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTime.fontSize = .small
        self.lblTime.fontType = .light
        self.lblTime.setTextColor = .text_normal
        
        self.lblUsername.fontSize = .small
        self.lblUsername.fontType = .bold
        self.lblUsername.setTextColor = .app_button
        
        self.lblChat.fontSize = .small
        self.lblChat.fontType = .light
        self.lblChat.setTextColor = .text_normal
        
        heightConstraint_AttachView.constant = 0.0
        viewDoc.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellConfiguration(object : CommentsChat){
        
        lblTime.setText(text: object.created)
        lblUsername.setText(text: object.createdByName)
        lblChat.setText(text: object.comment)
        imgUser.setImageFromUrl(url: object.pic,placeHolder: Utility.PLACEHOLDER_PROFILE)
    
    }

}
