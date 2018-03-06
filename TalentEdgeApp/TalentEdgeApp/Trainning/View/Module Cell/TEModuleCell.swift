//
//  TEModuleCell.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 20/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class TEModuleCell: BCUITableViewCell {

    @IBOutlet weak var imgIcon: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblTitleComplete: BCUILabel!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    static let reuseIdentifier = "KTEModuleCell"
    static let nibName = "TEModuleCell"
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblModuleName.fontSize = .large
        self.lblModuleName.fontType = .bold
        self.lblModuleName.setTextColor = .text_heading
        
        self.lblTitleComplete.setTextColor = .text_normal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(moduleData : ModuleBase) -> Void{
        
        if let name = moduleData.name{
                self.lblModuleName.setText(text: name)
        }
        
        
        
        if let value = moduleData.completionPercentage{
        
            if value.isEmpty == false {
            
                self.progressView.value = CGFloat(Float(value)!)
                
                
            }else{
                
               self.progressView.value = 0
            }
        
        }else{
        
            self.progressView.value = 0
        }
    }

}
