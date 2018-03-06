//
//  TEPdfDetailCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
protocol TEAssessmentDetailCellDelegate {
    
    func delegateStartQuizButtonDidSelect() -> Void
    func delegateReattemptButtonDidSelect() -> Void
}


class TEAssessmentDetailCell: BCUITableViewCell {

    static let reuseIdentifier = "kTEAssessmentDetailCell"
    static let nibName = "TEAssessmentDetailCell"
    
    var delegate : TEAssessmentDetailCellDelegate?
    
    @IBOutlet weak var lblTitle: BCUILabel!
    
    @IBOutlet weak var lblDescription: BCUILabel!
    
    @IBOutlet weak var lblTitleType: BCUILabel!
    @IBOutlet weak var lblType: BCUILabel!
    
    @IBOutlet weak var lblTitleTotalQuestion: BCUILabel!
    @IBOutlet weak var lblTotalQuestion: BCUILabel!
    
    @IBOutlet weak var lblTitleTotalMarks: BCUILabel!
    @IBOutlet weak var lblTotalMarks: BCUILabel!
    
    @IBOutlet weak var lblTitleMinMarks: BCUILabel!
    @IBOutlet weak var lblMinMarks: BCUILabel!
    
    @IBOutlet weak var lblTitleNegativeMarks: BCUILabel!
    @IBOutlet weak var lblNegativeMarks: BCUILabel!
    
    @IBOutlet weak var lblTitleTime: BCUILabel!
    @IBOutlet weak var lblTime: BCUILabel!
    
    @IBOutlet weak var btnStartQuiz: BCUIButton!
    
    @IBOutlet weak var btnStartQuizHeight: NSLayoutConstraint!
    
    @IBOutlet weak var btnReattempt: BCUIButton!
    
    @IBOutlet weak var btnReattemptHeight: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .large
        self.lblTitle.fontType = .bold
        self.lblTitle.setTextColor = .text_heading
        
        self.lblDescription.fontSize = .medium
        self.lblDescription.fontType = .regular
        self.lblDescription.setTextColor = .text_subheading
        
        self.lblTitleType.fontSize = .small
        self.lblTitleType.fontType = .bold
        self.lblTitleType.setTextColor = .text_normal
        
        self.lblType.fontSize = .small
        self.lblType.fontType = .light
        self.lblType.setTextColor = .text_normal
        
        self.lblTitleTotalQuestion.fontSize = .small
        self.lblTitleTotalQuestion.fontType = .bold
        self.lblTitleTotalQuestion.setTextColor = .text_normal
        
        self.lblTotalQuestion.fontSize = .small
        self.lblTotalQuestion.fontType = .light
        self.lblTotalQuestion.setTextColor = .text_normal
        
        self.lblTitleTotalMarks.fontSize = .small
        self.lblTitleTotalMarks.fontType = .bold
        self.lblTitleTotalMarks.setTextColor = .text_normal
        
        self.lblTotalMarks.fontSize = .small
        self.lblTotalMarks.fontType = .light
        self.lblTotalMarks.setTextColor = .text_normal
        
        self.lblTitleMinMarks.fontSize = .small
        self.lblTitleMinMarks.fontType = .bold
        self.lblTitleMinMarks.setTextColor = .text_normal
        
        self.lblMinMarks.fontSize = .small
        self.lblMinMarks.fontType = .light
        self.lblMinMarks.setTextColor = .text_normal
        
        
        self.lblTitleNegativeMarks.fontSize = .small
        self.lblTitleNegativeMarks.fontType = .bold
        self.lblTitleNegativeMarks.setTextColor = .text_normal
        
        self.lblNegativeMarks.fontSize = .small
        self.lblNegativeMarks.fontType = .light
        self.lblNegativeMarks.setTextColor = .text_normal
        
        self.lblTitleTime.fontSize = .small
        self.lblTitleTime.fontType = .bold
        self.lblTitleTime.setTextColor = .text_normal
        
        self.lblTime.fontSize = .small
        self.lblTime.fontType = .light
        self.lblTime.setTextColor = .text_normal
        
        self.btnStartQuiz.fontSize  = .small
        self.btnStartQuiz.fontType  = .bold
        self.btnStartQuiz.setTextColor = .text_app_button
        self.btnStartQuiz.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
        
        self.btnReattempt.fontSize  = .small
        self.btnReattempt.fontType  = .bold
        self.btnReattempt.setTextColor = .text_app_button
        self.btnReattempt.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(model:ViewNotesModel?) -> Void {
    
    }
    
    @IBAction func startQuizButtonDidSelect(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.delegateStartQuizButtonDidSelect()
        }
    }
    
    @IBAction func reattemptButtonDidSelect(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.delegateReattemptButtonDidSelect()
        }
    }
    
    func setData(model:AssessmentDetailModel?) -> Void {
        
        if let model = model{
            
            self.lblTitle.setText(text: "")
            self.lblDescription.setText(text: model.content?.descriptionValue)
            self.lblType.setText(text: model.test?.testType)
            self.lblTotalQuestion.setText(text: model.test?.totalQuestions)
            self.lblTotalMarks.setText(text: model.test?.totalMarks)
            self.lblMinMarks.setText(text: model.test?.passingMarks)
            self.lblNegativeMarks.setText(text: model.test?.isNegativeMarking)
            self.lblTime.setText(text: model.test?.totalDurationFormated)
            
            self.btnReattempt.setText(text: "review".uppercased())
            
            if let isReal = model.test?.testType{
                
                if isReal.lowercased() == "real".lowercased(){
                    
                    if model.isAlreadyAttempt == 1 {
                        
                        self.btnReattempt.setText(text: "REVIEW".uppercased())
                        self.btnStartQuizHeight.constant = 0
                        self.btnReattemptHeight.constant = 28
                        
                    }else{
                        
                        self.btnStartQuiz.setText(text: "attempt".uppercased())
                        
                        if model.canAttempt == 1{
                            
                            self.btnStartQuizHeight.constant = 28
                            
                        }else{
                            
                            self.btnStartQuizHeight.constant = 0
                        }
                        self.btnReattemptHeight.constant = 0
                    }
                   
                }else{
                
                    if model.isAlreadyAttempt == 1 {
                        
                        self.btnStartQuiz.setText(text: "re-attempt".uppercased())
                        
                        if model.canAttempt == 1{
                            
                            self.btnReattemptHeight.constant = 28
                            
                        }else{
                            
                            self.btnReattemptHeight.constant = 0
                        }
                        
                    }else{
                        
                        self.btnStartQuiz.setText(text: "attempt".uppercased())
                        
                        if model.canAttempt == 1{
                            
                            self.btnStartQuizHeight.constant = 28
                            
                        }else{
                            
                            self.btnStartQuizHeight.constant = 0
                        }
                        self.btnReattemptHeight.constant = 0
                    }
                }
                
            }else{
              
                if model.isAlreadyAttempt == 1 {
                    
                    self.btnStartQuiz.setText(text: "re-attempt".uppercased())
                    
                    if model.canAttempt == 1{
                        
                        self.btnReattemptHeight.constant = 28
                        
                    }else{
                        
                        self.btnReattemptHeight.constant = 0
                    }
                    
                }else{
                    
                    self.btnStartQuiz.setText(text: "attempt".uppercased())
                    
                    if model.canAttempt == 1{
                        
                        self.btnStartQuizHeight.constant = 28
                        
                    }else{
                        
                        self.btnStartQuizHeight.constant = 0
                    }
                    self.btnReattemptHeight.constant = 0
                }
            }
            
        }else{
            
            self.lblTitle.setText(text: "NA")
            self.lblDescription.setText(text: "NA")
            self.lblType.setText(text: "NA")
            self.lblTotalMarks.setText(text: "NA")
            self.lblMinMarks.setText(text: "NA")
            self.lblNegativeMarks.setText(text: "NA")
            self.lblTime.setText(text: "NA")
        }
    }
}
