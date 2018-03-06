//
//  ANReferenceNotesCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEReferenceNotesCellDelegate {
    
    func selectNoteAndVideo(indexPath : IndexPath?) -> Void
}

class TEReferenceNotesCell: BCUITableViewCell {
    
    static let nibName = "TEReferenceNotesCell"
    static let reuseIdentifier = "kTEReferenceNotesCell"
    
    @IBOutlet weak var imgProfessor: BCUIImageView!
    @IBOutlet weak var lblModuleName: BCUILabel!
    @IBOutlet weak var lblProfessorName: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnStartDate:   BCUIButton!
    
    @IBOutlet weak var imgNoteORVideo: BCUIImageView!
    @IBOutlet weak var lblDescription: BCUILabel!
    @IBOutlet weak var lblTotalPageORDuration: BCUILabel!
    @IBOutlet weak var btnEndDate:   BCUIButton!
    
    @IBOutlet weak var btnRead:   BCUIButton!
    
    
    var delegate : TEReferenceNotesCellDelegate?
    
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
        
        self.lblTotalPageORDuration.fontSize  = .small
        self.lblTotalPageORDuration.fontType  = .light
        self.lblTotalPageORDuration.setTextColor = .text_normal
        
        self.btnEndDate.fontSize  = .small
        self.btnEndDate.fontType  = .light
        self.btnEndDate.setTextColor = .text_normal
        
        self.btnRead.fontSize  = .small
        self.btnRead.fontType  = .bold
        self.btnRead.setTextColor = .text_app_button
        self.btnRead.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func readbtn_Click(_ sender: UIButton) {
        
        if let delegate = self.delegate {
            
            delegate.selectNoteAndVideo(indexPath: self.indexPath)
        }
    }
    
    
}

//MARK: - Cellconfigure

extension TEReferenceNotesCell {
    
    //MARK:- Cell Configure Methods
    
    func setNotes(model:ANNotesModel?,baseURL:String?) -> Void {
        
        //print("A gaya")
        if let model = model {
            
            if let baseURL = baseURL {
                
                self.imgProfessor.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
            }
            
            self.imgNoteORVideo.setImageFromUrl(url: model.previewImage, placeHolder: nil)
            
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: model.byUserName)
            self.btnContentType.setText(text: model.refType)
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.numberOfLines = 3
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblTotalPageORDuration.setText(text: model.notesCount)
            self.btnEndDate.setText(text: model.endDateValue)
            
            self.btnRead.setText(text: model.action)
        }
        
    }
    
    func setVideo(model:ANVideoModel?,baseURL:String?) -> Void {
        
        if let model = model {
            
            if let baseURL = baseURL {
                
                self.imgProfessor.setImageFromUrl(url: baseURL+(model.byUserPic ?? ""), placeHolder: nil);
            }
            
            self.imgNoteORVideo.setImageFromUrl(url: model.previewImage, placeHolder: nil)
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: model.byUserName)
            self.btnContentType.setText(text: model.refType)
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.numberOfLines = 3
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblTotalPageORDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: model.endDateValue)
            
            self.btnRead.setText(text: model.action)
        }
    }
    
    //MARK: - Notes Cellconfigure
    
    func configureCell(model : ContentListNotes?,baseURL:String?) -> Void {
        
        if let model = model {
            
            self.imgNoteORVideo.setImageFromUrl(url: model.previewImage, placeHolder: nil)
            self.imgProfessor.setImage(name: "list_notes");
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: "")
            self.btnContentType.setText(text: model.refType)
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblTotalPageORDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: model.endDateValue)
            
            self.btnRead.setText(text: model.action)
        }
    }
    
    
    //MARK: - Video Cellconfigure
    
    func configureCell(model : ContentListVideos?,baseURL:String?) -> Void {
        
        if let model = model {
            
            self.imgNoteORVideo.setImageFromUrl(url: model.previewImage, placeHolder: nil)
            self.imgProfessor.setImage(name: "list_video");
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: "by \(model.publishedByValue ?? "")")
            self.btnContentType.setText(text: model.refType)
            self.btnStartDate.setText(text: model.startDateValue)
            
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblTotalPageORDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: model.endDateValue)
            
            if let action = model.action{
                
                if action.count <= 0{
                    
                    self.btnRead.isHidden = true
                    
                }else{
                
                    self.btnRead.isHidden = false
                    self.btnRead.setText(text: action)
                }
                
                
            }else{
                
                self.btnRead.isHidden = true
            }
        }
    }
    
    //MARK: - Video Cellconfigure
    
    func configureCellForInteractiveVideo(model : ContentListVideoInteractive?,baseURL:String?) -> Void {
        
        if let model = model {
            
            self.imgNoteORVideo.setImageFromUrl(url: model.previewImage, placeHolder: nil)
            self.imgProfessor.setImage(name: "list_video");
            self.lblModuleName.setText(text: model.title)
            self.lblProfessorName.setText(text: "by \(model.publishedByValue ?? "")")
            self.btnContentType.setText(text: model.refType)
            self.btnStartDate.setText(text: model.startDateValue)
            self.lblDescription.setText(text: model.descriptionValue)
            self.lblTotalPageORDuration.setText(text: model.contentDurationFormated)
            self.btnEndDate.setText(text: "")
            
            if let action = model.action{
            
                if action.count <= 0{
                    
                    self.btnRead.isHidden = true
                    
                }else{
                    
                    self.btnRead.isHidden = false
                    self.btnRead.setText(text: action)
                }
                
            }else{
                
                self.btnRead.isHidden = true
            }
            
        }
    }
}

