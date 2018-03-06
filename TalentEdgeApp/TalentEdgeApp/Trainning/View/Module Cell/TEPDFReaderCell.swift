//
//  TEPDFReaderCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 23/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEPDFReaderCell: BCUICollectionViewCell {
    
    @IBOutlet weak var PDFImage: BCUIImageView!
    
    static let reuseIdentifier = "KTEPDFReaderCell"
    static let nibName = "TEPDFReaderCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(model:Note?, baseUrl:String?) -> Void {
     
        if let url = model?.contentPath, let baseUrl = baseUrl{
        
            self.PDFImage.setImageFromUrl(url: baseUrl+url,placeHolder: Utility.PLACEHOLDER_PROFILE)
        }
    }
    
}
