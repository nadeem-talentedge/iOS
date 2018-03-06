//
//  TEProfileSocialCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 01/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEProfileSocialCellDelegate {
    
    func profileShare_click()
    func profileCall_click()
    func profileMsg_click()
    
}

class TEProfileSocialCell: UITableViewCell {

    
    var delegate : TEProfileSocialCellDelegate?
    static let reuseIdentifier = "KTEProfileSocialCell"
    static let nibName = "TEProfileSocialCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func share_click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.profileShare_click()
        }
    }
    
    @IBAction func call_click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.profileCall_click()
        }
    }
    
    @IBAction func msg_click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.profileMsg_click()
        }
    }

}
