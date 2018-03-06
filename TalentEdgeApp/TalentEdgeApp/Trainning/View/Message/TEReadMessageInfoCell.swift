//
//  TEReadMessageInfoCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 24/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEReadMessageInfoCell: BCUITableViewCell {

    static let nibName = "TEReadMessageInfoCell"
    static let reuseIdentifier = "kTEReadMessageInfoCell"
    
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var lblToMe: BCUILabel!
    @IBOutlet weak var lblDate: BCUILabel!
    @IBOutlet weak var imgICon: BCUIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
