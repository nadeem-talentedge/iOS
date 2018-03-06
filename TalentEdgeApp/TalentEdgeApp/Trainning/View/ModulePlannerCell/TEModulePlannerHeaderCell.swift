//
//  TEModulePlannerHeaderCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 14/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEModulePlannerHeaderCell: BCUITableViewCell {

    static let reuseIdentifier = "kTEModulePlannerHeaderCell"
    static let nibName = "TEModulePlannerHeaderCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblSubTitle: BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
