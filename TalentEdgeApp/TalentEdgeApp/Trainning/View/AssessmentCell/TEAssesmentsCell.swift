//
//  ANAssessmentCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


protocol TEAssesmentsCellDelegate {
    
    func selectAssessment(indexPath : IndexPath?) -> Void
}


class TEAssesmentsCell: BCUITableViewCell {

    static let reuseIdentifier = "kTEAssesmentsCell"
    static let nibName = "TEAssesmentsCell"
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    
    @IBOutlet weak var lblDescription: BCUILabel!
    @IBOutlet weak var btnAttempt:   BCUIButton!
    @IBOutlet weak var btnTotalQuestions:   BCUIButton!
    @IBOutlet weak var btnTotalDuration:   BCUIButton!
    @IBOutlet weak var btnTotalMarks:   BCUIButton!
    @IBOutlet weak var btnMode:   BCUIButton!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
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
        
        self.btnAttempt.fontSize  = .small
        self.btnAttempt.fontType  = .bold
        self.btnAttempt.setTextColor = .text_app_button
        self.btnAttempt.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func rightbtnClick(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.selectAssessment(indexPath: self.indexPath)
        }
    }
    
    //MARK:- Set Data Announcment
    
    func setDataAnnouncment(model:ANAssessmentModel?,baseURL:String?) -> Void {
    
        if let model = model{
        
            if let baseURL = baseURL {
                
                self.imgLogo.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
            }
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: model.byUserName)
            
            self.btnContentType.setText(text: "Assessment")
            
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.numberOfLines = 3
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnAttempt.setText(text: model.action)
            
            self.btnTotalQuestions.setText(text: model.totalQuestions)
            
            self.btnTotalDuration.setText(text: model.totalDuration)
            
            self.btnTotalMarks.setText(text: model.totalMarks)
            
            self.btnEndDate.setText(text: model.endDateValue)
            
            self.btnMode.setText(text: "Online")
        }
    }
    
    //MARK:- Set Data ContentList
    
    func setDataContentList(model:ContentListAssessment?) -> Void {
        
        if let model = model{
            
            self.imgLogo.setImage(name: "list_assessment")
            
            self.lblModuleName.setText(text: model.title)
            
            self.lblProfessorName.setText(text: "")
            
            self.btnContentType.setText(text: "Assessment")
            
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.setText(text: model.descriptionValue)
            
            self.btnAttempt.setText(text: model.action)
            
            self.btnTotalQuestions.setText(text: model.totalQuestions)
            
            self.btnTotalDuration.setText(text: model.totalDuration)
            
            self.btnTotalMarks.setText(text: model.totalMarks)
            
            self.btnEndDate.setText(text: model.endDateValue)
            
            self.btnMode.setText(text: "Online")
        }
    }
    
    //MARK:- Set Data For Training
    
    func setDataTraining(model:AssessmentListBase?,batchName:String?) -> Void {
        
        if let model = model{
            
            self.imgLogo.setImage(name: "list_assessment")
            
            if let isReal = model.test?.testType{
                
                if isReal.lowercased() == "real".lowercased(){
                    
                    if model.isAlreadyAttempt == 0{
                    
                        self.btnAttempt.setText(text: "ATTEMPT")
                        
                    }else{
                        
                        self.btnAttempt.setText(text: "REVIEW")
                    }
                    
                    
                    
                }else{
                    
                    if model.isAlreadyAttempt == 0{
                        
                        self.btnAttempt.setText(text: "ATTEMPT")
                        
                    }else{
                        
                        self.btnAttempt.setText(text: "RE-ATTEMPT")
                    }
                }
                
            }else{
            
                if model.isAlreadyAttempt == 0{
                    
                    self.btnAttempt.setText(text: "ATTEMPT")
                    
                }else{
                    
                    self.btnAttempt.setText(text: "RE-ATTEMPT")
                }
            }
            
            
            self.lblModuleName.setText(text: model.content?.title)
            
            self.lblProfessorName.setText(text: batchName)
            
            self.btnContentType.setText(text: "Assessment")
            
            self.btnStartDate.setText(text: model.content?.startDate)
            
            self.lblDescription.setText(text: model.content?.descriptionValue)
            
            self.btnTotalQuestions.setText(text: model.test?.totalQuestions)
            
            self.btnTotalDuration.setText(text: model.test?.totalDuration)
            
            self.btnTotalMarks.setText(text: model.test?.totalMarks)
            
            self.btnEndDate.setText(text: model.content?.endDate)
            
            self.btnMode.setText(text: "Online")
        }
    }
}
