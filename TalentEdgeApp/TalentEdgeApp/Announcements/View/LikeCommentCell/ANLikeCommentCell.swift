//
//  TELikeCommentCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 13/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol ANLikeCommentCellDelegate {
    
    func likeComment(indexPath:IndexPath?) -> Void
    func gotoComment(indexPath:IndexPath?) -> Void
    
}

class ANLikeCommentCell: BCUITableViewCell {
    
    var delegate:ANLikeCommentCellDelegate?
    
    @IBOutlet weak var lblTotalLikes: BCUILabel!
    @IBOutlet weak var btnLike: BCUIButton!
    
    @IBOutlet weak var lblTotalComments: BCUILabel!
    @IBOutlet weak var btnComment: BCUIButton!
    
    @IBOutlet weak var lblTotalShares: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    
    static let reuseIdentifier = "kANLikeCommentCell"
    static let nibName = "ANLikeCommentCell"
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblTotalShares.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        self.lblTotalComments.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        self.lblTotalShares.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        
        self.btnLike.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        self.btnComment.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        self.btnShare.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(model:ANEventModel?) -> Void {
        
        if let model = model{
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
            }else{
                
                self.btnLike.isSelected = false
            }
        }else{
        
            self.lblTotalLikes.setText(text:"0 Likes")
            self.lblTotalComments.setText(text:"0 Comments")
        }
    }
    
    //MARK:- IBAction
    
    @IBAction func like(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.likeComment(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.gotoComment(indexPath: self.indexPath)
        }
    }
}
