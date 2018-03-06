//
//  TEJobPostHeaderCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TERefferalHeaderCell: BCUICollectionViewCell {

    static let reuseIdentifier = "kTERefferalHeaderCell"
    static let nibName = "TERefferalHeaderCell"
    
    @IBOutlet weak var lblCount:BCUILabel!
    @IBOutlet weak var lblTitle:BCUILabel!
    
    //@IBOutlet weak var title:BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
