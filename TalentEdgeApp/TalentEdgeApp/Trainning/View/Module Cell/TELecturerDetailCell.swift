//
//  TELecturerDetailCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import Cosmos

class TELecturerDetailCell: BCUITableViewCell {

    @IBOutlet weak var imgUser: BCUIImageView!
    @IBOutlet weak var lblTotalRating: BCUILabel!
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblDescription: BCUILabel!
    @IBOutlet weak var viewAverageRating: CosmosView!
    
    
    
    static let reuseIdentifier = "KTELecturerDetailCell"
    static let nibName = "TELecturerDetailCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
