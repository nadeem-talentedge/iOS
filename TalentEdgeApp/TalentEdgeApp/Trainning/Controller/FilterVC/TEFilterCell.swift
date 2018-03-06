//
//  TEFilterCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEFilterCell: BCUITableViewCell {

    static let nibName = "TEFilterCell"
    static let reuseIdentifier = "kTEFilterCell"
    
    @IBOutlet weak var lblTitle:BCUILabel!
    @IBOutlet weak var btnSelection:BCUIButton!
    
    let imageNormal = Utility.setImageWithTintColor(image: UIImage(named: "unselect")!, tintColor: Utility.getColorAccordingTheme(theme: .THEME_2))
    
    let imageSelected = Utility.setImageWithTintColor(image: UIImage(named: "select")!, tintColor: Utility.getColorAccordingTheme(theme: .THEME_2))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.btnSelection.setImage(imageNormal, for: .normal)
        self.btnSelection.setImage(imageSelected, for: .selected)
        
        self.lblTitle.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


