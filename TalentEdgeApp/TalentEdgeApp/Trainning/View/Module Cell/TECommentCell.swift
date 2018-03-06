//
//  TECommentCell.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
protocol TECommentCellDelegate {
    func rightMenu_Click() -> Void
    func likeComment_Click() -> Void
    func replyComment_Click() -> Void
    func shareComment_Click() -> Void
    
}


class TECommentCell: BCUITableViewCell {

    @IBOutlet weak var userImage: BCUIImageView!
    @IBOutlet weak var commect: BCUILabel!
    var delegate : TECommentCellDelegate?
    
   
   
    
    static let reuseIdentifier = "KTECommentCell"
    static let nibName = "TECommentCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func rightMenu_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.rightMenu_Click()
        }
    }
    
    
    @IBAction func like_Click(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.likeComment_Click()
        }
    }
    
    @IBAction func reply_Click(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.replyComment_Click()
        }
    }
    
    
    @IBAction func share_Click(_ sender: UIButton) {
        
        if let delegate = self.delegate{
            delegate.shareComment_Click()
        }
    }
    
}
