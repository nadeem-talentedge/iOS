//
//  TEProfileMenuNavigationCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 18/10/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEProfileMenuNavigationCell: BCUITableViewCell {

    static let nibName = "TEProfileMenuNavigationCell"
    static let reuseIdentifier = "kTEProfileMenuNavigationCell"
    
    @IBOutlet weak var imgIcon: BCUIImageView!
    @IBOutlet weak var lblTitle: BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
