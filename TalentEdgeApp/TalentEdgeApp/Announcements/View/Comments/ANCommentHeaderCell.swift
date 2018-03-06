//
//  ANCommentHeaderCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 07/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class ANCommentHeaderCell: UIView {

    @IBOutlet weak var lblTotalLike:BCUILabel!
    @IBOutlet weak var btnLoadMore:BCUIButton!
    @IBOutlet weak var btnTotalMessage:BCUIButton!
    static let nibName = "ANCommentHeaderCell"
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblTotalLike.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        self.btnLoadMore.setTitleColor(Utility.getColorAccordingTheme(theme: .THEME_2), for: .normal)
        self.btnLoadMore.setTitleColor(Utility.getColorAccordingTheme(theme: .THEME_2), for: .normal)
    }
}
