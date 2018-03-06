//
//  ANAssignmentCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEAssignmentsCellDelegate {
    
    func selectAssignment(indexPath : IndexPath?) -> Void
}

class TEAssignmentsCell: BCUITableViewCell {
    
    static let reuseIdentifier = "kTEAssignmentsCell"
    static let nibName = "TEAssignmentsCell"
    
    @IBOutlet weak var imgProfessor: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    @IBOutlet weak var lblDescription: BCUILabel!
    @IBOutlet weak var btnSubmit:   BCUIButton!
    @IBOutlet weak var btnMode:   BCUIButton!
    @IBOutlet weak var btnTotalMarks:   BCUIButton!
    @IBOutlet weak var btnGrade:   BCUIButton!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
    var delegate : TEAssignmentsCellDelegate?
    
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
        
        self.btnTotalMarks.fontSize  = .small
        self.btnTotalMarks.fontType  = .light
        self.btnTotalMarks.setTextColor = .text_normal
        
        self.btnMode.fontSize  = .small
        self.btnMode.fontType  = .light
        self.btnMode.setTextColor = .text_normal
        
        self.btnGrade.fontSize  = .small
        self.btnGrade.fontType  = .light
        self.btnGrade.setTextColor = .text_normal
        
        self.btnEndDate.fontSize  = .small
        self.btnEndDate.fontType  = .light
        self.btnEndDate.setTextColor = .text_normal
        
        self.btnSubmit.fontSize  = .small
        self.btnSubmit.fontType  = .bold
        self.btnSubmit.setTextColor = .text_app_button
        self.btnSubmit.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func rightbtn_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.selectAssignment(indexPath: self.indexPath)
        }
    }
 
    //MARK:- Set Data
    
    func setDataAnnouncment(model:ANAssignmentModel?,baseURL:String?) -> Void {
        
        if let model = model{
            
            if let baseURL = baseURL {
                
                self.imgProfessor.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
            }
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: model.moduleName)
            
            self.btnContentType.setText(text: "Assignment")
            
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.numberOfLines = 3
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnSubmit.setText(text: model.action)
            
            self.btnMode.setText(text: model.submissionMode)
            
            self.btnTotalMarks.setText(text: model.totalMarks)
            
            self.btnGrade.setText(text: model.isGraded)
            
            self.btnEndDate.setText(text: model.endDateValue)
            
        }
    }
    
    
    func setDataTraining(model:AssignmentListBase?) -> Void {
        
        if let model = model{
            
            self.imgProfessor.setImage(name: "list_assignment")
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: model.moduleName)
            
            self.btnContentType.setText(text: "Assignment")
            
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.numberOfLines = 3
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnSubmit.setText(text: model.action)
            
            self.btnMode.setText(text: model.submissionMode)
            
            self.btnTotalMarks.setText(text: model.totalMarks)
            
            self.btnGrade.setText(text: model.isGraded)
            
            self.btnEndDate.setText(text: model.endDateValue)
            
        }
    }
    
    func setDataContentList(model:ContentListAssignment?) -> Void {
        
        if let model = model{
            
            self.imgProfessor.setImage(name: "list_assignment")
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: model.moduleName)
            
            self.btnContentType.setText(text: "Assignment")
            
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.numberOfLines = 3
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnSubmit.setText(text: model.action)
            
            self.btnMode.setText(text: model.submissionMode)
            
            self.btnTotalMarks.setText(text: model.totalMarks)
            
            self.btnGrade.setText(text: model.isGraded)
            
            self.btnEndDate.setText(text: model.endDateValue)
            
        }
    }
}
