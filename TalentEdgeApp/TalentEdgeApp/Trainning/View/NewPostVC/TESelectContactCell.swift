//
//  TESelectContactCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TESelectContactCell: BCUITableViewCell {

    static let nibName = "TESelectContactCell"
    static let reuseIdentifier = "kTESelectContactCell"
    
    var type = Type.contacts
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var lblPlaceholder:BCUILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(list:Array<TEMultipleSelectionModel>?) -> Void {
        
        if let list = list{
        
            if list.count <= 0{
                
                self.lblPlaceholder.isHidden = false
                
                if self.type == .batch{
                
                    self.lblPlaceholder.setText(text: "Select Batch")
                    
                }else if self.type == .batchUser{
                    
                    self.lblPlaceholder.setText(text: "Select Learners")
                    
                }
                else{
                
                    self.lblPlaceholder.setText(text: "Select Content")
                }
                
            }else{
                
                self.lblPlaceholder.isHidden = true
                self.lblPlaceholder.setText(text: "")
            }
            
            for model in list {
                
                if model.isSelected == true{
                    
                    if model.isAddedd == false {
                        
                        self.tagListView.addTag(model.title ?? "")
                        model.isAddedd = true
                        
                    }
                    
                }else{
                
                    model.isAddedd = false
                    self.tagListView.removeTag(model.title ?? "")
                }
            }
        }
      
    }
}
