//
//  TESemeterCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 17/09/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TESemeterCell_Two: UICollectionViewCell {

    static let nibName = "TESemeterCell_Two"
    static let reuseIdentifier = "mTESemeterCell_Two"
    @IBOutlet weak var imgBanner: BCUIImageView!
    @IBOutlet weak var progress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
