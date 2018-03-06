//
//  TELeftMenuCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 09/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TELeftMenuCell: BCUITableViewCell {

    @IBOutlet weak var imageIcon: BCUIImageView!
    @IBOutlet weak var lblTitle: BCUILabel!
    
    static let reuseIdentifier = "KTELeftMenuCell"
    static let nibName = "TELeftMenuCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        self.contentView.backgroundColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurecell(imageName : String, titleValue : String){
        
        imageIcon.setImage(name: imageName)
        lblTitle.setText(text: titleValue)
    }

}
