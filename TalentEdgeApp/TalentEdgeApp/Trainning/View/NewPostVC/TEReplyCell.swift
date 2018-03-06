//
//  TEReplyCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 24/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEReplyCell: BCUITableViewCell {

    static let nibName = "TEReplyCell"
    static let reuseIdentifier = "kTEReplyCell"
    
    @IBOutlet weak var lblDetail:BCUILabel!
    @IBOutlet weak var lblMessage:BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
