//
//  TEMySubmitionCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 13/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


protocol TEMySubmitionCellDelegate {
    
    func delegateEditButtonDidClick() -> Void
    func delegateDeleteButtonDidClick() -> Void
}

class TEMySubmitionCell: UITableViewCell {

    
    var delegate : TEMySubmitionCellDelegate?
    static let reuseIdentifier = "kTEMySubmitionCell"
    static let nibName = "TEMySubmitionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
