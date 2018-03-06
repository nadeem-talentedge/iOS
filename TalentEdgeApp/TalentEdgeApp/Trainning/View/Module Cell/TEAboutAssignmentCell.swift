//
//  TEAboutAssignmentCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 23/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEAboutAssignmentCellDelegate {
    func startQuiz_Click()
}

class TEAboutAssignmentCell: BCUITableViewCell {

    @IBOutlet weak var title: BCUILabel!
    @IBOutlet weak var subTitle: BCUILabel!
    @IBOutlet weak var date: BCUILabel!
    @IBOutlet weak var submissionType: BCUILabel!
    @IBOutlet weak var minMarks: BCUILabel!
    @IBOutlet weak var marks: BCUILabel!
    @IBOutlet weak var modeValue: BCUILabel!
    @IBOutlet weak var typeValue: BCUILabel!
    var delegate : TEAboutAssignmentCellDelegate?
    
    static let reuseIdentifier = "KTEAboutAssignmentCell"
    static let nibName = "TEAboutAssignmentCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func startQuiz_Click(_ sender: UIButton) {
        
        if let delegate = self.delegate{
            delegate.startQuiz_Click()
        }
        
    }

}
