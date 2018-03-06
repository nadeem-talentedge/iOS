//
//  ANLiveClassCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TELiveClassCellDelegate {
    
    func selectLiveClass(indexPath:IndexPath?) -> Void
}

class TELiveClassCell: BCUITableViewCell {
    
    static let reuseIdentifier = "kTELiveClassCell"
    static let nibName = "TELiveClassCell"
    
    @IBOutlet weak var imgProfessor: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    
    @IBOutlet weak var btnJoin:   BCUIButton!
    @IBOutlet weak var lblDescription: BCUILabel!
    
    @IBOutlet weak var btnTotalDuration: BCUIButton!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
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
        
        self.btnJoin.fontSize  = .small
        self.btnJoin.fontType  = .bold
        self.btnJoin.setTextColor = .text_app_button
        self.btnJoin.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func rightButton_Click(_ sender: BCUIButton) {
        if let delegate = self.delegate {
            delegate.selectLiveClass(indexPath: self.indexPath)
        }
    }
    
    //MARK:- Set Data Announcment
    
    func setDataAnnouncment(model:ANLiveClassModel?,baseURL:String?) -> Void {
    
        if let model = model {
                
                if let baseURL = baseURL {
                    
                    self.imgProfessor.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
                }
            
                self.lblModuleName.setText(text: model.title)
                self.lblProfessorName.setText(text: model.publishedByValue)
                self.btnContentType.setText(text: "Live Class")
                self.btnStartDate.setText(text: model.startDate)
                self.lblDescription.setText(text: model.descriptionValue)
                self.lblDescription.numberOfLines = 3
                self.btnTotalDuration.setText(text: model.contentDurationFormated)
                self.btnEndDate.setText(text: model.endDate)
            
                if let action = model.action{
                    
                    self.btnJoin.setText(text:action.uppercased())
                    
                    if action.lowercased() == "Concluded".lowercased(){
                        
                        self.btnJoin.isUserInteractionEnabled = false
                        self.btnJoin.backgroundColor = UIColor.clear
                        self.btnJoin.shadowColor = UIColor.clear
                        self.btnJoin.borderColor = UIColor.clear
                        self.btnJoin.setTitleColor(UIColor.darkGray, for: .normal)
                    }
                    else{
                        
                        // 29 142 191
                        self.btnJoin.isUserInteractionEnabled = true
                        
                        self.btnJoin.backgroundColor = UIColor(red: 29.0/255.0, green: 142.0/255.0, blue: 191.0/255.0, alpha: 1.0)
                        
                        self.btnJoin.borderColor = UIColor(red: 29.0/255.0, green: 142.0/255.0, blue: 191.0/255.0, alpha: 1.0)
                        
                        self.btnJoin.shadowColor = UIColor.lightGray
                        
                        self.btnJoin.setTitleColor(UIColor.white, for: .normal)
                    }
                }
        }
    }
    
    //MARK:- Set Data Attendence
    
    func setDataAttendence(model:LiveSessionAttendance?) -> Void {
        
        if let model = model {
            
            self.imgProfessor.setImage(name: "list_liveclass")
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: model.publishedBy)
            self.btnContentType.setText(text: "Live Class")
            self.btnStartDate.setText(text: model.startDate)
            self.lblDescription.setText(text: model.descriptionValue)
            self.btnTotalDuration.setText(text: model.contentDurationFomated)
            self.btnEndDate.setText(text: model.endDate)
            self.btnJoin.setText(text: "")
            self.btnJoin.isHidden = true
        }
    }
    
    //MARK:- Set Data Training
    
    func setDataTraining(model:LiveClassListBase?) -> Void {
        
        if let model = model {
            
            self.imgProfessor.setImage(name: "list_liveclass")
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: model.publishedByValue)
            self.btnContentType.setText(text: "Live Class")
            self.btnStartDate.setText(text: model.startDate)
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblDescription.numberOfLines = 3
            self.btnTotalDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: model.endDate)
            self.btnJoin.setText(text: model.action)
            
            if let action = model.action{
                
                self.btnJoin.setText(text:action.uppercased())
                
                if action.lowercased() == "Concluded".lowercased(){
                    
                    self.btnJoin.isUserInteractionEnabled = false
                    self.btnJoin.backgroundColor = UIColor.clear
                    self.btnJoin.shadowColor = UIColor.clear
                    self.btnJoin.borderColor = UIColor.clear
                    self.btnJoin.setTitleColor(UIColor.darkGray, for: .normal)
                }
                else{
                    
                    // 29 142 191
                    self.btnJoin.isUserInteractionEnabled = true
                    
                    self.btnJoin.backgroundColor = UIColor(red: 29.0/255.0, green: 142.0/255.0, blue: 191.0/255.0, alpha: 1.0)
                    
                    self.btnJoin.borderColor = UIColor(red: 29.0/255.0, green: 142.0/255.0, blue: 191.0/255.0, alpha: 1.0)
                    
                    self.btnJoin.shadowColor = UIColor.lightGray
                    
                    self.btnJoin.setTitleColor(UIColor.white, for: .normal)
                }
            }
        }
    }
    
    //MARK:- Set Data Content List
    
    func setDataContentList(model:ContentListLiveClass?) -> Void {
        
        if let model = model {
            
            self.imgProfessor.setImage(name: "list_liveclass")
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: model.publishedByValue)
            self.btnContentType.setText(text: "Live Class")
            self.btnStartDate.setText(text: model.startDate)
            
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblDescription.numberOfLines = 3
            
            self.btnTotalDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: model.endDate)
            self.btnJoin.setText(text: model.action)
            
            if let action = model.action{
                
                self.btnJoin.setText(text:action.uppercased())
                
                if action.lowercased() == "Concluded".lowercased(){
                    
                    self.btnJoin.isUserInteractionEnabled = false
                    self.btnJoin.backgroundColor = UIColor.clear
                    self.btnJoin.shadowColor = UIColor.clear
                    self.btnJoin.borderColor = UIColor.clear
                    self.btnJoin.setTitleColor(UIColor.darkGray, for: .normal)
                }
                else{
                    
                    // 29 142 191
                    self.btnJoin.isUserInteractionEnabled = true
                    
                    self.btnJoin.backgroundColor = UIColor(red: 29.0/255.0, green: 142.0/255.0, blue: 191.0/255.0, alpha: 1.0)
                    
                    self.btnJoin.borderColor = UIColor(red: 29.0/255.0, green: 142.0/255.0, blue: 191.0/255.0, alpha: 1.0)
                    
                    self.btnJoin.shadowColor = UIColor.lightGray
                    
                    self.btnJoin.setTitleColor(UIColor.white, for: .normal)
                }
            }
        }
    }
}
