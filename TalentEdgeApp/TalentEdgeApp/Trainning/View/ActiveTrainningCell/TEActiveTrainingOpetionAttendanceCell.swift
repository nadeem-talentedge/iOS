//
//  TEActiveTrainingOpetionCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 10/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class TEActiveTrainingOpetionAttendanceCell: BCUICollectionViewCell {

    static let reuseIdentifier = "mTEActiveTrainingOpetionAttendanceCell"
    static let nibName = "TEActiveTrainingOpetionAttendanceCell"
    
    @IBOutlet weak var imgIcon: BCUIImageView!
    @IBOutlet weak var lblLiveClassStatus: BCUILabel!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var viewBG: BCView!
    @IBOutlet weak var viewAttadence: MBCircularProgressBarView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .tiny
        self.lblTitle.fontType = .light
        self.lblTitle.setTextColor = .text_normal
        
        self.lblTitle.preferredMaxLayoutWidth = 100
    }

}
