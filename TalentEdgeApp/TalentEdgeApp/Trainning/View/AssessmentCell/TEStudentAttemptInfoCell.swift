//
//  ANAssignmentCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TEStudentAttemptInfoCellDelegate {
    
    func profileButtonDidClick(indexPath:IndexPath?) -> Void
}

class TEStudentAttemptInfoCell: BCUITableViewCell {
    
    var delegate:TEStudentAttemptInfoCellDelegate?
    static let reuseIdentifier = "kTEStudentAttemptInfoCell"
    static let nibName = "TEStudentAttemptInfoCell"
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var lblName: BCUILabel!
    
    @IBOutlet weak var lblScore: BCUILabel!
    @IBOutlet weak var lblAnswered: BCUILabel!
    @IBOutlet weak var lblTimeTaken: BCUILabel!
    @IBOutlet weak var progressComplete:   MBCircularProgressBarView!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    @IBAction func profileButtonDidClick() -> Void {
        
        if let delegate = self.delegate{
            
            delegate.profileButtonDidClick(indexPath: self.indexPath)
        }
    }
    
    func setData(model:StudentAttemptInfoModel?){
        
        if let model = model{
         
            self.imgLogo.setImageFromUrl(url: model.pic, placeHolder: nil)
            self.lblName.setText(text: model.name)
            self.lblScore.setText(text: "\(model.marks ?? 0)")
            self.lblAnswered.setText(text: "\(model.attemptedQuestions ?? 0)/\(model.totalQuestions ?? "0")")
            self.lblTimeTaken.setText(text: "\(model.timeTaken ?? 0) Seconds")
            self.progressComplete.value = CGFloat(model.correctQuestions ?? 0)
        }
        
    }
}
