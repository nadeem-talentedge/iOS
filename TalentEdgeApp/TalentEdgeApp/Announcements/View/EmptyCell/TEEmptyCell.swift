//
//  TEEmptyCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 08/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEEmptyCell: UITableViewCell {

    static let reuseIdentifier = "kTEEmptyCell"
    static let nibName = "TEEmptyCell"
    
    //@IBOutlet weak var indicator:UIActivityIndicatorView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        //self.indicator.tintColor = Utility.getColorAccordingTheme(theme: .THEME_1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
