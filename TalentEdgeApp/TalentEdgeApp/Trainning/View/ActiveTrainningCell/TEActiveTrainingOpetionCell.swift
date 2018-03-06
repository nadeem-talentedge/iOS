//
//  TEActiveTrainingOpetionCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 10/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEActiveTrainingOpetionCell: BCUICollectionViewCell {

    static let reuseIdentifier = "mTEActiveTrainingOpetionCell"
    static let nibName = "TEActiveTrainingOpetionCell"
    
    @IBOutlet weak var imgIcon: BCUIImageView!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblCount: BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .tiny
        self.lblTitle.fontType = .light
        self.lblTitle.setTextColor = .text_normal
        
        self.lblCount.fontSize = .tiny
        self.lblCount.fontType = .light
        self.lblCount.setTextColor = .text_normal
        
        self.lblTitle.preferredMaxLayoutWidth = 100
        
    }

}
