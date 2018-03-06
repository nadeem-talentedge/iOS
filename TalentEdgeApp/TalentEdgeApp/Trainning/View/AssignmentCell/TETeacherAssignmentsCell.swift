//
//  ANAssignmentCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class TETeacherAssignmentsCell: BCUITableViewCell {
    
    static let reuseIdentifier = "kTETeacherAssignmentsCell"
    static let nibName = "TETeacherAssignmentsCell"
    
    @IBOutlet weak var imgProfessor: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    @IBOutlet weak var lblDescription: BCUILabel!
    @IBOutlet weak var lblMultiSubmition: BCUILabel!
    @IBOutlet weak var btnMode:   BCUIButton!
    @IBOutlet weak var btnMaxMarks:   BCUIButton!
    @IBOutlet weak var btnPassingMarks:   BCUIButton!
    @IBOutlet weak var btnGrade:   BCUIButton!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
    @IBOutlet weak var lblTitleUpload: BCUILabel!
    @IBOutlet weak var lblUpload: BCUILabel!
    
    @IBOutlet weak var lblTitleNotUpload: BCUILabel!
    @IBOutlet weak var lblNotUpload: BCUILabel!
    
    @IBOutlet weak var lblTitleAverage: BCUILabel!
    @IBOutlet weak var progressComplete:   MBCircularProgressBarView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblModuleName.fontSize = .large
        self.lblModuleName.fontType = .bold
        self.lblModuleName.setTextColor = .text_heading
        
        self.lblProfessorName.fontSize  = .medium
        self.lblProfessorName.fontType  = .regular
        self.lblProfessorName.setTextColor = .text_subheading
        
        self.btnContentType.fontSize  = .small
        self.btnContentType.fontType  = .light
        self.btnContentType.setTextColor = .text_normal
        
        self.btnStartDate.fontSize  = .small
        self.btnStartDate.fontType  = .light
        self.btnStartDate.setTextColor = .text_normal
        
        self.lblDescription.fontSize  = .small
        self.lblDescription.fontType  = .light
        self.lblDescription.setTextColor = .text_normal
        
        self.btnMode.fontSize  = .small
        self.btnMode.fontType  = .light
        self.btnMode.setTextColor = .text_normal
        
        self.btnGrade.fontSize  = .small
        self.btnGrade.fontType  = .light
        self.btnGrade.setTextColor = .text_normal
        
        self.btnEndDate.fontSize  = .small
        self.btnEndDate.fontType  = .light
        self.btnEndDate.setTextColor = .text_normal
        
        self.lblUpload.fontSize  = .tiny
        self.lblUpload.fontType  = .regular
        self.lblUpload.setTextColor = .text_normal
        
        self.lblTitleNotUpload.fontSize  = .tiny
        self.lblTitleNotUpload.fontType  = .regular
        self.lblTitleNotUpload.setTextColor = .text_normal
        
        self.lblNotUpload.fontSize  = .tiny
        self.lblNotUpload.fontType  = .regular
        self.lblNotUpload.setTextColor = .text_normal
        
        self.lblTitleAverage.fontSize  = .tiny
        self.lblTitleAverage.fontType  = .regular
        self.lblTitleAverage.setTextColor = .text_normal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTeacherAssignmentData(model:TeacherAssignmentModel?) -> Void {
        
            if let model = model{
                
                self.imgProfessor.setImage(name: "list_assignment")
                
                self.lblModuleName.setText(text: model.title)
                
                self.lblProfessorName.setText(text: model.moduleName)
                
                self.btnContentType.setText(text: "Assignment")
                
                self.btnStartDate.setText(text: model.startDateFormatted)
                
                self.lblDescription.setText(text: model.descriptionValue)
                
                self.btnMode.setText(text: model.submissionMode)
                
                self.btnMaxMarks.setText(text: model.totalMarks)
                
                self.btnPassingMarks.setText(text: model.passingMarks)
                
                self.lblMultiSubmition.setText(text: model.allowedMultiple)
                
                self.btnGrade.setText(text: model.isGraded)
                
                self.lblUpload.setText(text: model.cntSubmitted)
                
                self.lblNotUpload.setText(text: model.cntNotSubmitted)
                
                self.btnEndDate.setText(text: model.endDateFormatted)
                
                let total = Float(model.avgCompletionPercentage ?? "0")!
                self.progressComplete.value = CGFloat(total)
        }
    }
    
    func setTeacherAssignmenContentData(model:TeacherAssignmentContentModel?) -> Void {
        
        if let model = model{
            
            self.imgProfessor.setImage(name: "list_assignment")
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: model.moduleName)
            
            self.btnContentType.setText(text: "Assignment")
            
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnMode.setText(text: model.submissionMode)
            
            self.btnMaxMarks.setText(text: model.totalMarks)
            
            self.btnPassingMarks.setText(text: model.passingMarks)
            
            self.lblMultiSubmition.setText(text: model.allowedMultiple)
            
            self.btnGrade.setText(text: model.isGraded)
            
            self.lblUpload.setText(text: model.cntSubmitted)
            
            self.lblNotUpload.setText(text: model.cntNotSubmitted)
            
            self.btnEndDate.setText(text: model.endDateValue)
            
            let total = Float(model.avgCompletionPercentage ?? "0")!
            self.progressComplete.value = CGFloat(total)
        }
    }
}
