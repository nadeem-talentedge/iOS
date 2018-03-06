//
//  TESearchCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 14/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TESearchCell: UITableViewCell {

    @IBOutlet weak var imgDoc: BCUIImageView!
    @IBOutlet weak var lblDate: BCUILabel!
    @IBOutlet weak var lblDocType: BCUILabel!
    @IBOutlet weak var lblDocSize: BCUILabel!
    @IBOutlet weak var lblPageCount: BCUILabel!
    @IBOutlet weak var lblDocName: BCUILabel!
    
    
    static let reuseIdentifier = "KTESearchCell"
    static let nibName = "TESearchCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
