//
//  TEInputCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 24/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEInputCell: BCUITableViewCell {

    static let reuseIdentifier = "kTEInputCell"
    static let nibName = "TEInputCell"
    
    @IBOutlet weak var lblPlaceHolder: BCUILabel!
    @IBOutlet weak var txtInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
