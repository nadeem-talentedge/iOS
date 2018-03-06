//
//  ANLiveClassCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class TETeacherLiveClassCell: BCUITableViewCell {
    
    static let reuseIdentifier = "kTETeacherLiveClassCell"
    static let nibName = "TETeacherLiveClassCell"
    
    @IBOutlet weak var imgProfessor: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    
    @IBOutlet weak var btnJoin:   BCUIButton!
    @IBOutlet weak var lblDescription: BCUILabel!
    
    @IBOutlet weak var btnTotalDuration: BCUIButton!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
    @IBOutlet weak var lblTitleLiveClassStudentAttendence:   BCUILabel!
    @IBOutlet weak var lblLiveClassStudentAttendence:   BCUILabel!
    @IBOutlet weak var progressLiveClassStudentAttendence:   UIProgressView!
    
    @IBOutlet weak var lblTitleRecordedClassStudentAttendence:   BCUILabel!
    @IBOutlet weak var lblRecordedClassStudentAttendence:   BCUILabel!
    @IBOutlet weak var progressRecordClassStudentAttendence:   UIProgressView!
    
    @IBOutlet weak var lblTitleComplete:   BCUILabel!
    @IBOutlet weak var progressComplete:   MBCircularProgressBarView!
    
    var delegate : TELiveClassCellDelegate?
    
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
        
        self.btnEndDate.fontSize  = .small
        self.btnEndDate.fontType  = .light
        self.btnEndDate.setTextColor = .text_normal
        
        self.btnTotalDuration.fontSize  = .small
        self.btnTotalDuration.fontType  = .light
        self.btnTotalDuration.setTextColor = .text_normal
        
        self.lblTitleLiveClassStudentAttendence.fontSize  = .tiny
        self.lblTitleLiveClassStudentAttendence.fontType  = .regular
        self.lblTitleLiveClassStudentAttendence.setTextColor = .text_normal
        
        self.lblLiveClassStudentAttendence.fontSize  = .tiny
        self.lblLiveClassStudentAttendence.fontType  = .regular
        self.lblLiveClassStudentAttendence.setTextColor = .text_normal
        
        self.lblTitleRecordedClassStudentAttendence.fontSize  = .tiny
        self.lblTitleRecordedClassStudentAttendence.fontType  = .regular
        self.lblTitleRecordedClassStudentAttendence.setTextColor = .text_normal
        
        self.lblRecordedClassStudentAttendence.fontSize  = .tiny
        self.lblRecordedClassStudentAttendence.fontType  = .regular
        self.lblRecordedClassStudentAttendence.setTextColor = .text_normal
        
        self.lblTitleComplete.fontSize  = .tiny
        self.lblTitleComplete.fontType  = .regular
        self.lblTitleComplete.setTextColor = .text_normal
        
    }
    
    func setTeacherLiveClassData(model:TeacherLiveClassModel?) -> Void {
        
        if let model = model{
            
            
            self.lblModuleName.setText(text: model.moduleName)
            self.lblProfessorName.setText(text: model.title)
            self.btnStartDate.setText(text: model.startDateFormatted)
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblDescription.numberOfLines = 0
            self.btnTotalDuration.setText(text: model.contentDurationFormatted)
            self.btnEndDate.setText(text: model.endDateFormatted)
            
            self.lblLiveClassStudentAttendence.setText(text: "\(model.totalInviteesInLiveClass ?? "0") Students")
            
            self.lblRecordedClassStudentAttendence.setText(text: "\(model.totalInviteesAttendedInRecordedClass ?? "0") Students")
            
            let progressLive = Float(model.participationPercentageInLiveClass ?? "0")!/100
            self.progressLiveClassStudentAttendence.setProgress(progressLive, animated: true)
       
            let progressRecorded = Float(model.participationPercentageInRecordedClass ?? "0")!/100
            self.progressRecordClassStudentAttendence.setProgress(progressRecorded, animated: true)
            
            //print("Live Class attendenc -----------",model.avgTimeLiveClassAttended ?? "NA")
            
            if let avg = model.participationPercentageInLiveClass{
                
                if avg.isEmpty  == false{
            
                    let total = Float(avg)!
                    self.progressComplete.value = CGFloat(total)
                    
                }else{
                    
                    self.progressComplete.value = 0
                }
            }else{
                
                self.progressComplete.value = 0
            }
        }
    }
    
    func setTeacherLiveClassContentData(model:TeacherLiveClassContentModel?) -> Void {
        
        if let model = model{
            
            self.lblModuleName.setText(text: model.moduleName)
            //self.lblProfessorName.setText(text: model.title)
            self.btnStartDate.setText(text: model.startDateFormatted)
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblDescription.numberOfLines = 0
            self.btnTotalDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: model.endDateFormatted)
            
            self.lblLiveClassStudentAttendence.setText(text: "\(model.totalInviteesInLiveClass ?? "0") Students")
            
            self.lblRecordedClassStudentAttendence.setText(text: "\(model.totalInviteesAttendedInRecordedClass ?? "0") Students")
            
            let progressLive = Float(model.participationPercentageInLiveClass ?? "0")!/100
            self.progressLiveClassStudentAttendence.setProgress(progressLive, animated: true)
            
            let progressRecorded = Float(model.participationPercentageInRecordedClass ?? "0")!/100
            self.progressRecordClassStudentAttendence.setProgress(progressRecorded, animated: true)
            
            if let avg = model.participationPercentageInLiveClass{
                
                if avg.isEmpty  == false{
                    
                    let total = Float(avg)!
                    self.progressComplete.value = CGFloat(total)
                    
                }else{
                    
                    self.progressComplete.value = 0
                }
            }else{
                
                self.progressComplete.value = 0
            }
            
        }
    }
    
    func setTeacherLAttendanceData(model:TeacherAttendenceModel?) -> Void {
        
        if let model = model{
            
            self.lblModuleName.setText(text: model.moduleName)
            //self.lblProfessorName.setText(text: model.title)
            self.btnStartDate.setText(text: model.startDateFormated)
            self.lblDescription.setText(text: "")
            self.lblDescription.numberOfLines = 0
            self.btnTotalDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: model.startDateFormated)
            
            self.lblLiveClassStudentAttendence.setText(text: "\(model.totalInviteesInLiveClass ?? "0") Students")
            
            self.lblRecordedClassStudentAttendence.setText(text: "\(model.totalInviteesAttendedInRecordedClass ?? "0") Students")
            
            let progressLive = Float(model.participationPercentageInLiveClass ?? "0")!/100
            self.progressLiveClassStudentAttendence.setProgress(progressLive, animated: true)
            
            let progressRecorded = Float(model.participationPercentageInRecordedClass ?? "0")!/100
            self.progressRecordClassStudentAttendence.setProgress(progressRecorded, animated: true)
            
            if let avg = model.participationPercentageInLiveClass{
                
                if avg.isEmpty  == false{
                    
                    let total = Float(avg)!
                    self.progressComplete.value = CGFloat(total)
                    
                }else{
                    
                    self.progressComplete.value = 0
                }
            }else{
                
                self.progressComplete.value = 0
            }
        }
    }
    
}
