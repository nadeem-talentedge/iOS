//
//  TEMyCertificateCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 30/12/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEMyCertificateCell: BCUITableViewCell {

    static let reuseIdentifier = "kTEMyCertificateCell"
    static let nibName = "TEMyCertificateCell"
    @IBOutlet weak var container: BCView!
    
    @IBOutlet weak var lblTitle: BCUILabel!
    
    @IBOutlet weak var lblTitleTraining: BCUILabel!
    @IBOutlet weak var lblValueTraining: BCUILabel!
    
    @IBOutlet weak var lblTitleIssuedOn: BCUILabel!
    @IBOutlet weak var lblValueIssedOn: BCUILabel!
    
    @IBOutlet weak var lblTitleAwardedBy: BCUILabel!
    @IBOutlet weak var lblValueAwardedBy: BCUILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .extra_large
        self.lblTitle.fontType = .bold
        self.lblTitle.setTextColor = .text_card_heading
        
        self.lblTitleTraining.fontSize = .tiny
        self.lblTitleTraining.fontType = .medium
        self.lblTitleTraining.setTextColor = .text_card_heading
        
        self.lblTitleIssuedOn.fontSize = .tiny
        self.lblTitleIssuedOn.fontType = .medium
        self.lblTitleIssuedOn.setTextColor = .text_card_heading
        
        self.lblTitleAwardedBy.fontSize = .tiny
        self.lblTitleAwardedBy.fontType = .medium
        self.lblTitleAwardedBy.setTextColor = .text_card_heading
        
        self.lblValueTraining.fontSize = .large
        self.lblValueTraining.fontType = .medium
        self.lblValueTraining.setTextColor = .text_card_heading
        
        self.lblValueIssedOn.fontSize = .large
        self.lblValueIssedOn.fontType = .medium
        self.lblValueIssedOn.setTextColor = .text_card_heading
        
        self.lblValueAwardedBy.fontSize = .large
        self.lblValueAwardedBy.fontType = .medium
        self.lblValueAwardedBy.setTextColor = .text_card_heading
        
        
        self.container.backgroundColor = ThemeManager.setThemeColor(appColor: .navigation)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
