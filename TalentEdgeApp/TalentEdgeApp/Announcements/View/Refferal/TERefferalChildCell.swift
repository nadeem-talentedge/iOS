//
//  TERefferalChildCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 16/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TERefferalChildCellDelegate {
    
    func loadMoreAndLess(indexPath:IndexPath?) -> Void
}

class TERefferalChildCell: BCUITableViewCell {

    
    static let reuseIdentifier = "kTERefferalChildCell"
    static let nibName = "TERefferalChildCell"
    
    @IBOutlet weak var lblStatus: BCUILabel!
    @IBOutlet weak var lblCreatedDate: BCUILabel!
    @IBOutlet weak var lblModifyDate: BCUILabel!
    @IBOutlet weak var lblFileName: BCUILabel!
    
    var delegate:TERefferalChildCellDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

//MARK:- User Define

extension TERefferalChildCell {

    func setData(model:RFReferral?) -> Void {
        
        if let model = model{
        
            if let status = model.status{
            
                switch status {
                case "0":
                    self.lblStatus.setText(text: "Not Viewed")
                case "1":
                    self.lblStatus.setText(text: "Viewed")
                case "2":
                    self.lblStatus.setText(text: "Not Relevant")
                case "3":
                    self.lblStatus.setText(text: "Rejected")
                case "4":
                    self.lblStatus.setText(text: "Shortlisted")
                case "5":
                    self.lblStatus.setText(text: "Selected")
                default:
                    self.lblStatus.setText(text: "NA")
                }
            }
            
            self.lblCreatedDate.setText(text: "Refferal Sent : "+Utility.dateStringToDefaultFormatDate(dateAsString: model.created))
            
            self.lblModifyDate.setText(text: "On "+Utility.dateStringTo12HourFormat(dateAsString: model.modified))
            
            if let path = model.uploadPath as NSString? {
                
                self.lblFileName.setText(text: path.lastPathComponent)
            }
            
            
        }else{
        
            print("Model Empty")
        }
    }
    
    @IBAction func loadMore(sender:BCUIButton){
    
        if let delegate = self.delegate {
        
            delegate.loadMoreAndLess(indexPath: self.indexPath)
        }
        
    }
}
