//
//  TEJobPostHeaderCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEJobPostHeaderCell: BCUICollectionViewCell {

    static let reuseIdentifier = "kTEJobPostHeaderCell"
    static let nibName = "TEJobPostHeaderCell"
    
    @IBOutlet weak var title:BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
