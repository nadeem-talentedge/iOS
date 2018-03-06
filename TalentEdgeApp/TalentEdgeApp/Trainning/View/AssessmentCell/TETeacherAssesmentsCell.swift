//
//  ANAssessmentCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class TETeacherAssesmentsCell: BCUITableViewCell {

    static let reuseIdentifier = "kTETeacherAssesmentsCell"
    static let nibName = "TETeacherAssesmentsCell"
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    
    @IBOutlet weak var lblDescription: BCUILabel!
    @IBOutlet weak var btnTotalQuestions:   BCUIButton!
    @IBOutlet weak var btnTotalDuration:   BCUIButton!
    @IBOutlet weak var btnTotalMarks:   BCUIButton!
    @IBOutlet weak var btnMode:   BCUIButton!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
    @IBOutlet weak var lblTitleUpload: BCUILabel!
    @IBOutlet weak var lblUpload: BCUILabel!
    
    @IBOutlet weak var lblTitleNotUpload: BCUILabel!
    @IBOutlet weak var lblNotUpload: BCUILabel!
    
    @IBOutlet weak var lblTitleAverage: BCUILabel!
    @IBOutlet weak var progressComplete:   MBCircularProgressBarView!
    
    var delegate : TEAssesmentsCellDelegate?
    
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
        
        self.btnTotalQuestions.fontSize  = .small
        self.btnTotalQuestions.fontType  = .light
        self.btnTotalQuestions.setTextColor = .text_normal
        
        self.btnTotalDuration.fontSize  = .small
        self.btnTotalDuration.fontType  = .light
        self.btnTotalDuration.setTextColor = .text_normal
        
        self.btnTotalMarks.fontSize  = .small
        self.btnTotalMarks.fontType  = .light
        self.btnTotalMarks.setTextColor = .text_normal
        
        self.btnMode.fontSize  = .small
        self.btnMode.fontType  = .light
        self.btnMode.setTextColor = .text_normal
        
        self.btnEndDate.fontSize  = .small
        self.btnEndDate.fontType  = .light
        self.btnEndDate.setTextColor = .text_normal
        
        self.lblTitleUpload.fontSize  = .tiny
        self.lblTitleUpload.fontType  = .regular
        self.lblTitleUpload.setTextColor = .text_normal
        
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
    
    func setTecherAssessmentData(model:TeacherAssessmentModel?) -> Void {
        
        if let model = model{
            
            self.imgLogo.setImage(name: "list_assessment")
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: model.moduleName)
            
            self.btnContentType.setText(text: "Assessment")
            
            self.btnStartDate.setText(text: model.startDateFormatted)
            
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnMode.setText(text: model.testType)
            
            self.btnEndDate.setText(text: model.endDateFormatted)
            
            self.btnTotalQuestions.setText(text: model.totalQuestions)
            
            self.btnTotalMarks.setText(text: model.totalMarks)
            
            self.btnTotalDuration.setText(text: model.totalDurationFormatted)
            
            self.lblUpload.setText(text: model.cntAttempted)
            
            self.lblNotUpload.setText(text: model.cntNotAttempted)
            
            let total = Float(model.avgCompletionPercentage ?? "0")!
            self.progressComplete.value = CGFloat(total)
        }
    }
    
    func setTecherAssessmentContentData(model:TeacherAssessmentContentModel?) -> Void {
        
        if let model = model{
            
            self.imgLogo.setImage(name: "list_assessment")
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: model.moduleName)
            
            self.btnContentType.setText(text: "Assessment")
            
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnMode.setText(text: "\(model.testType ?? 0)")
            
            self.btnEndDate.setText(text: model.endDateValue)
            
            self.btnTotalQuestions.setText(text: model.totalQuestions)
            
            self.btnTotalMarks.setText(text: model.totalMarks)
            
            self.btnTotalDuration.setText(text: model.totalDuration)
            
            self.lblUpload.setText(text: model.cntAttempted)
            
            self.lblNotUpload.setText(text: model.cntNotAttempted)
            
            let total = Float(model.avgCompletionPercentage ?? "0")!
            self.progressComplete.value = CGFloat(total)
        }
    }
}
