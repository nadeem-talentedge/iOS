//
//  ANLiveClassCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class TETeacherNotesCell: BCUITableViewCell {
    
    static let reuseIdentifier = "kTETeacherNotesCell"
    static let nibName = "TETeacherNotesCell"
    
    @IBOutlet weak var imgProfessor: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    
    @IBOutlet weak var lblDescription: BCUILabel!
    
    @IBOutlet weak var btnTotalDuration: BCUIButton!
    @IBOutlet weak var btnNumberOfPages: BCUIButton!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
    @IBOutlet weak var lblLiveClassStudentAttendence:   BCUILabel!
    @IBOutlet weak var progressLiveClassStudentAttendence:   UIProgressView!
    
    @IBOutlet weak var progressComplete:   MBCircularProgressBarView!
    
    var delegate : TELiveClassCellDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    
    }
    
    func setNotesData(model:TeacherNotesContentModel?){
        
        if let model = model{
            
            self.lblModuleName.setText(text: model.moduleName)
            self.lblProfessorName.setText(text: model.title)
            self.btnStartDate.setText(text: model.startDateValue)
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblDescription.numberOfLines = 3
            self.btnTotalDuration.setText(text: model.contentDurationFormated)
            self.btnNumberOfPages.setText(text: "\(model.notesCount ?? "0") Pages")
            self.btnEndDate.setText(text: model.endDateValue)
        }
        
    }
}
