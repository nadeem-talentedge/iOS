//
//  ANDescriptionCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 11/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class ANDescriptionCell: BCUITableViewCell {

    static let reuseIdentifier = "kANDescriptionCell"
    static let nibName = "ANDescriptionCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblDesc: BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        self.lblDesc.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
