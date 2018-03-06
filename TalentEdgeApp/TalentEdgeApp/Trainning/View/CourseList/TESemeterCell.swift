//
//  TESemeterCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 17/09/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


class TESemeterCell: UICollectionViewCell {

    static let nibName = "TESemeterCell"
    static let reuseIdentifier = "mTESemeterCell"
    
    @IBOutlet weak var lblSemesterName: BCUILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
