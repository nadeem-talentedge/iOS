//
//  TEQuizChildCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 11/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEQuizChildCell: BCUITableViewCell {
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var btnSelection: BCUIButton!
    static let reuseIdentifier = "mTEQuizChildCell"
    static let nibName = "TEQuizChildCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setDataNew(model:STQuestionOption?) -> Void {
        
        if let model = model{
            
            self.lblTitle.setText(text: model.optionStatement)
            
            self.btnSelection.isSelected = model.isSelected!
            
        }else{
            
            self.lblTitle.setText(text: "NA")
        }
    }
    
    func setDataReview(model:RWQuestionOption?,arrOfSelectedOpetion:[String]?) -> Void {
        
        if let model = model{
            
            self.lblTitle.setText(text: model.optionStatement)
            
            if let arrOfSelectedOpetion = arrOfSelectedOpetion{
                
                if arrOfSelectedOpetion.count > 0{
                    
                    for selectedQuestionID in arrOfSelectedOpetion {
                        
                        
                        if let questionID = model.id {
                            
                            //print("--------------------> ",questionID,selectedQuestionID)
                            
                            if questionID == selectedQuestionID{
                                
                                self.btnSelection.isSelected = true
                                
                            }else{
                                
                                self.btnSelection.isSelected = false
                            }
                            
                        }else{
                            
                            self.btnSelection.isSelected = false
                        }
                        
                    }
                    
                }else{
                    
                    self.btnSelection.isSelected = false
                }
                
                
            }else{
                
               self.btnSelection.isSelected = false
            }
            
        }else{
            
            self.lblTitle.setText(text: "NA")
        }
    }
}
