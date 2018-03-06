//
//  TELecturersCell.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 20/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TELecturersCellDelegate {
    
    func submit_Click(indexPath : IndexPath?) -> Void
}
class TELecturersCell: BCUITableViewCell {

    @IBOutlet weak var contentListType: BCUIButton!
    @IBOutlet weak var lblLecturerName: BCUILabel!
    @IBOutlet weak var lectureCategory1: BCUIButton!
    @IBOutlet weak var lectureCategory2: BCUIButton!
    @IBOutlet weak var dateValue: BCUIButton!
    @IBOutlet weak var lecturerSubHeading: BCUILabel!
    @IBOutlet weak var online: BCUIButton!
    @IBOutlet weak var graded: BCUIButton!
    @IBOutlet weak var marks: BCUIButton!
    @IBOutlet weak var endDate: BCUIButton!
    @IBOutlet weak var rightButton: BCUIButton!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    var delegate : TELecturersCellDelegate?
    
    static let reuseIdentifier = "KTELecturersCell"
    static let nibName = "TELecturersCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func Submit_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate {
            
            delegate.submit_Click(indexPath: self.indexPath)
        }
    }
    
}


//MARK: - Cellconfigure

extension TELecturersCell {
    
    
    //MARK: - Assessment Cellconfigure
    
    func configureCell(objet : ContentListAssessment) -> Void {
    }
    
    
    //MARK: - Video Cellconfigure
    func configureCell(objet : ContentListAssignment) -> Void {
        
        
        self.lectureCategory2.isHidden = true
        
        if let title = objet.title{
            self.lblLecturerName.setText(text: title)
        }
        
        if let startDateValue = objet.startDateValue{
            self.dateValue.setText(text: " " + startDateValue)
        }
        
        if let endDateValue = objet.endDateValue{
            self.endDate.setText(text: "  " + endDateValue)
        }
        
        
        if let description = objet.descriptionValue{
            self.lecturerSubHeading.setText(text: description)
        }
        
        if let action = objet.action{
            self.rightButton.setText(text: "  " + action + "  ")
        }
        
        
        if let value = objet.completionPercentage{
            
            self.progressView.value = CGFloat(Float(value)!)
            
        }else{
            
            self.progressView.value = 0
        }

        
        
        if let totalMarks = objet.totalMarks{
            self.marks.setText(text: "  " + totalMarks)
        }
        
        if let submissionMode = objet.submissionMode{
            self.online.setText(text: "  " + submissionMode)
        }
        
        
        if let isGraded = objet.isGraded{
            
            if isGraded == "Non Graded"{
                
                online.isUserInteractionEnabled = false
            }
            else{
                
                online.isUserInteractionEnabled = true
            }
        }

        /*
         {
         action = View;
         "allow_edit" = 0;
         "allow_view" = 1;
         "completion_percentage" = 0;
         "content_type_id" = 5;
         description = "Assignment on Media Ecosystem";
         "end_date_label" = "End Date";
         "end_date_value" = "Aug 31, 2017";
         id = 13;
         "is_draft" = 0;
         "is_graded" = "Non Graded";
         "likes_count" = 0;
         "module_id" = 1;
         "module_name" = Entertainment;
         "parent_id" = 0;
         "passing_marks" = 0;
         "passing_marks_label" = "Min Marks";
         "start_date_label" = "Published On";
         "start_date_value" = "May 26, 2017";
         "submission_count" = 0;
         "submission_label" = "Not Submitted";
         "submission_mode" = Offline;
         title = "Media Ecosystem";
         "total_marks" = 0;
         "total_marks_label" = "Max Marks";
         "view_count" = 0;
         }
         */
    }
    
    
    
}
