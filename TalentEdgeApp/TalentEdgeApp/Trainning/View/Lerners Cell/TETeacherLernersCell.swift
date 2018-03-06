//
//  TELernersCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 30/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TETeacherLernersCellDelegate  {
 
    func teacherLearnerChatButtonDidClick(indexPath:IndexPath?)
    func teacherLearnerProfileButtonDidClick(indexPath:IndexPath?)
}

class TETeacherLernersCell: BCUITableViewCell {

    static let reuseIdentifier = "mTETeacherLernersCell"
    static let nibName = "TETeacherLernersCell"
    
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var lblAddress: BCUILabel!
    @IBOutlet weak var lblActivityTime: BCUILabel!
    @IBOutlet weak var imgUser: BCUIImageView!
    @IBOutlet weak var btnChat: BCUIButton!
    var delegate : TETeacherLernersCellDelegate?
    
    @IBOutlet weak var lblAssignment: BCUILabel!
    @IBOutlet weak var progressAssignment: UIProgressView!
    
    @IBOutlet weak var lblAssessment: BCUILabel!
    @IBOutlet weak var progressAssessment: UIProgressView!
    
    @IBOutlet weak var lblAttendence: BCUILabel!
    @IBOutlet weak var progressAttendence: UIProgressView!
    
    @IBOutlet weak var progressComplete:   MBCircularProgressBarView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellConfiguration(model : TeacherLearner?){
        
        if let model = model {
    
            print("Pahunch Gaye----------------------------")
            
            self.imgUser.setImageFromUrl(url: model.image, placeHolder: nil)
            
            self.lblName.setText(text: model.name)
            
            self.lblAddress.setText(text:"")
            
            self.lblActivityTime.setText(text:"Last Activity: \((model.lastActive ?? ""))")
            
            self.lblAssignment.setText(text: "\(model.learnerdetailassignment?.completed ?? 0)/\(model.learnerdetailassignment?.total ?? 0)")
            
            self.progressAssignment.progress = Float(((model.learnerdetailassignment?.completed ?? 0)/100 ) )
            
            self.lblAssessment.setText(text: "\(model.learnerdetaiassessment?.completed ?? 0)/\(model.learnerdetaiassessment?.total ?? 0)")
            
            self.progressAssessment.progress = Float(((model.learnerdetaiassessment?.completed ?? 0)/100 ) )
            
            self.lblAttendence.setText(text: "\((model.attendance ?? "0"))%")
            
            self.progressAttendence.progress = Float("\(model.attendance ?? "0")" )!
            
            self.progressComplete.value = CGFloat(Float("\(model.moduleCompleted ?? "0")" )!)
            
            
            self.btnChat.isHidden = false
        }
    }
    
    
    @IBAction func btnChat_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate {
            
                delegate.teacherLearnerChatButtonDidClick(indexPath: self.indexPath)
        }
    }
    
    @IBAction func btnProfileClick(_ sender: BCUIButton) {
        
        if let delegate = self.delegate {
            
            delegate.teacherLearnerProfileButtonDidClick(indexPath: self.indexPath)
        }
    }
    
    
}



