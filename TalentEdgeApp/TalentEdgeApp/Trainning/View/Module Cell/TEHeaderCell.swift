//
//  TEHeaderCell.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEHeaderCell: BCUITableViewCell {

    
    static let reuseIdentifier = "KTEHeaderCell"
    static let nibName = "TEHeaderCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var btnType: BCUIButton!
    @IBOutlet weak var btnStartDate: BCUIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .large
        self.lblTitle.fontType = .bold
        self.lblTitle.setTextColor = .text_heading
        
        self.btnType.fontSize = .small
        self.btnType.fontType = .light
        self.btnType.setTextColor = .text_normal
        
        self.btnStartDate.fontSize = .small
        self.btnStartDate.fontType = .light
        self.btnStartDate.setTextColor = .text_normal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
