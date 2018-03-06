//
//  TEAwardUserCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 03/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class ANAwardUserCell: BCUICollectionViewCell {

    static let reuseIdentifier = "kANAwardUserCell"
    static let nibName = "ANAwardUserCell"
    
    @IBOutlet weak var imgProfile: BCUIImageView!
    @IBOutlet weak var name: BCUILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.name.textColor = Utility.getColorAccordingTheme(theme: .THEME_2)
        // Initialization code
    }

    //MARK:- Set Data
    
    func setData(model:ANAwardToUser?,baseURL:String?) -> Void {
        
        if let model = model{
        
            if let baseURL = baseURL {
                
                self.imgProfile.setImageFromUrl(url: baseURL+(model.pic ?? ""), placeHolder: nil);
            }
            
            self.name.setText(text: "\((model.fname ?? "")) \((model.lname ?? "")) \((model.designation ?? "")) \((model.department ?? ""))")
            //self.name.setText(text: (model.fname ?? "")+" "+(model.lname ?? "")+" "+(model.designation ?? "")+" "+(model.department ?? ""))
        }
    }
}
