//
//  TEPdfDetailCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEAssignmentDetailCellDelegate {
    
    func downloadAssigmentDidClick() -> Void
    func uploadAssigmentDidClick() -> Void
}


class TEAssignmentDetailCell: BCUITableViewCell {

    
    var delegate : TEAssignmentDetailCellDelegate?
    static let reuseIdentifier = "kTEAssignmentDetailCell"
    static let nibName = "TEAssignmentDetailCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblDescription: BCUILabel!
    
    @IBOutlet weak var lblTitleType: BCUILabel!
    @IBOutlet weak var lblType: BCUILabel!
    
    @IBOutlet weak var lblTitleMode: BCUILabel!
    @IBOutlet weak var lblMode: BCUILabel!
    
    @IBOutlet weak var lblTitlePublishedOn: BCUILabel!
    @IBOutlet weak var lblPublishedOn: BCUILabel!
    
    @IBOutlet weak var lblTitleDuedate: BCUILabel!
    @IBOutlet weak var lblDuedate: BCUILabel!
    
    @IBOutlet weak var lblTitleMaxMark: BCUILabel!
    @IBOutlet weak var lblMaxMark: BCUILabel!
    
    @IBOutlet weak var lblTitleMinMark: BCUILabel!
    @IBOutlet weak var lblMinMark: BCUILabel!
    
    @IBOutlet weak var lblFileName: BCUILabel!
    @IBOutlet weak var lblNote: BCUILabel!
    
    @IBOutlet weak var lblMarkTitle: BCUILabel!
    @IBOutlet weak var lblMarkGet: BCUILabel!
    
    
    
    @IBOutlet weak var btnUploadDoc: BCUIButton!
    @IBOutlet weak var btnUploadDocWidth: NSLayoutConstraint!
    @IBOutlet weak var btnUploadDocHeight: NSLayoutConstraint!
    
    @IBOutlet weak var imgSuccess: BCUIImageView!
    @IBOutlet weak var imgSuccessWidth: NSLayoutConstraint!
    @IBOutlet weak var imgSuccessHeight: NSLayoutConstraint!
    
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
        
        self.lblTitleMode.fontSize = .small
        self.lblTitleMode.fontType = .bold
        self.lblTitleMode.setTextColor = .text_normal
        
        self.lblMode.fontSize = .small
        self.lblMode.fontType = .light
        self.lblMode.setTextColor = .text_normal
        
        self.lblTitlePublishedOn.fontSize = .small
        self.lblTitlePublishedOn.fontType = .bold
        self.lblTitlePublishedOn.setTextColor = .text_normal
        
        self.lblPublishedOn.fontSize = .small
        self.lblPublishedOn.fontType = .light
        self.lblPublishedOn.setTextColor = .text_normal
        
        self.lblTitleDuedate.fontSize = .small
        self.lblTitleDuedate.fontType = .bold
        self.lblTitleDuedate.setTextColor = .text_normal
        
        self.lblDuedate.fontSize = .small
        self.lblDuedate.fontType = .light
        self.lblDuedate.setTextColor = .text_normal
        
        
        self.lblTitleMaxMark.fontSize = .small
        self.lblTitleMaxMark.fontType = .bold
        self.lblTitleMaxMark.setTextColor = .text_normal
        
        self.lblMaxMark.fontSize = .small
        self.lblMaxMark.fontType = .light
        self.lblMaxMark.setTextColor = .text_normal
        
        self.lblTitleMinMark.fontSize = .small
        self.lblTitleMinMark.fontType = .bold
        self.lblTitleMinMark.setTextColor = .text_normal
        
        self.lblMinMark.fontSize = .small
        self.lblMinMark.fontType = .light
        self.lblMinMark.setTextColor = .text_normal
        
        self.lblFileName.fontSize = .small
        self.lblFileName.fontType = .medium
        self.lblFileName.setTextColor = .text_normal
        
        self.lblNote.fontSize = .small
        self.lblNote.fontType = .medium
        
        self.btnUploadDoc.fontSize  = .small
        self.btnUploadDoc.fontType  = .bold
        self.btnUploadDoc.setTextColor = .text_app_button
        self.btnUploadDoc.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func downloadAssigmentDidClick(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.downloadAssigmentDidClick()
        }
    }
    
    @IBAction func uploadAssigmentDidClick(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.uploadAssigmentDidClick()
        }
    }
    
    func setData(model:AssigmentDetailModel?) -> Void {
    
        if let model = model {
        
            //self.lblTitle.setText(text: model.content?.title)
            self.lblDescription.setText(text: model.content?.descriptionValue)
            self.lblType.setText(text: model.assignment?.isGraded)
            self.lblMode.setText(text: model.assignment?.submissionMode)
            self.lblPublishedOn.setText(text: model.content?.startDate)
            self.lblDuedate.setText(text: model.content?.endDate)
            self.lblNote.setText(text: model.assignment?.instructions)
            
            self.lblMarkTitle.setText(text: model.content?.obtainedMarksLabel)
            self.lblMarkGet.setText(text: model.content?.obtainedMarks)
            
            self.lblMinMark.setText(text: model.assignment?.passingMarks)
            self.lblMaxMark.setText(text: model.assignment?.totalMarks)
            
            
            if let path = model.content?.contentPath as NSString? {
            
                self.lblFileName.setText(text: path.lastPathComponent)
            }
            
            
            //MARK:- Logic for upload button
            // Check Wheater online or Offline
            if let submissionMode = model.assignment?.submissionMode{
                
                if submissionMode.lowercased() == "online".lowercased(){
                    
                    //Now Check for multiple Submission
                    if let multiple = model.assignment?.allowedMultiple{
                        
                        if multiple.lowercased() == "Yes".lowercased(){
                          
                            self.manageUploadButton(isHidden: false, width: 150, height: 28)
                            
                        }else{
                            
                            // If Multiple Submission false
                            
                            if let isAlreadySubmit = model.isAlreadyAttempt{
                                
                                if isAlreadySubmit == 1 {
                                    
                                    self.manageUploadButton(isHidden: true, width: 0, height: 0)
                                    
                                }else{
                                    
                                    self.manageUploadButton(isHidden: false, width: 150, height: 28)
                                }
                                
                            }else{
                                
                                self.manageUploadButton(isHidden: false, width: 150, height: 28)
                            }
                        }
                        
                    }else{
                    
                        // If Multiple Submission false
                        if let isAlreadySubmit = model.isAlreadyAttempt{
                            
                            if isAlreadySubmit == 1 {
                             
                                self.manageUploadButton(isHidden: true, width: 0, height: 0)
                                
                            }else{
                                
                                self.manageUploadButton(isHidden: false, width: 150, height: 28)
                            }
                            
                        }else{
                            
                            self.manageUploadButton(isHidden: false, width: 150, height: 28)
                        }
                    }
                    
                    
                }else{
                    
                    //If Online Mode False
                    self.manageUploadButton(isHidden: true, width: 0, height: 0)
                }
                
            }else{
                
                // If SubmissiomMode not find "nil" value from server. Default show upload button
                self.manageUploadButton(isHidden: false, width: 150, height: 28)
            }
            
            
            //Check for sucess image
            if let isAlreadySubmit = model.isAlreadyAttempt{
                
                if isAlreadySubmit == 1 {
                    
                    self.manageSuccessImage(isHidden: false, width: 30, height: 30)
                    
                }else{
                    
                    self.manageSuccessImage(isHidden: true, width: 0, height: 0)
                }
                
            }else{
                
                self.manageSuccessImage(isHidden: true, width: 0, height: 0)
            }
        
        
        }else{
    
            //self.lblTitle.setText(text: "NA")
            self.lblDescription.setText(text: "NA")
            self.lblType.setText(text: "NA")
            self.lblPublishedOn.setText(text: "NA")
            self.lblDuedate.setText(text: "NA")
            self.lblFileName.setText(text: "NA")
        }
        
    }
    
    func manageUploadButton(isHidden:Bool,width:CGFloat,height:CGFloat){
    
        self.btnUploadDoc.isHidden = isHidden
        self.btnUploadDocWidth.constant = width
        self.btnUploadDocHeight.constant = height
    }
    
    func manageSuccessImage(isHidden:Bool,width:CGFloat,height:CGFloat){
        
        self.imgSuccess.isHidden = isHidden
        self.imgSuccessWidth.constant = width
        self.imgSuccessHeight.constant = height
    }
}
