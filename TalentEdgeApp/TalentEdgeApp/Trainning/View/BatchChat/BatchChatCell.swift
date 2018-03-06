//
//  BatchChatCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 17/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class BatchChatCell: BCUITableViewCell {

    static let reuseIdentifier = "kBatchChatCell"
    static let nibName = "BatchChatCell"
    
    @IBOutlet weak var imgCource: BCUIImageView!
    @IBOutlet weak var lblCourceName: BCUILabel!
    @IBOutlet weak var lblDuration: BCUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
