//
//  TEPdfDetailCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
protocol TEPdfDetailCellDelegate {
    
    func download_Click() -> Void
    func readNow_Click() -> Void
}


class TEPdfDetailCell: BCUITableViewCell {

    @IBOutlet weak var imgPDF: BCUIImageView!
    @IBOutlet weak var lblPDFTitle: BCUILabel!
    @IBOutlet weak var lblPDFDescription: BCUILabel!
    @IBOutlet weak var lblNumberOfPage: BCUILabel!
    @IBOutlet weak var lblCommentType: BCUILabel!
    @IBOutlet weak var lblAuthorName: BCUILabel!
    @IBOutlet weak var lblPDFMode: BCUILabel!
    @IBOutlet weak var lblDownloadStatus: BCUILabel!
    @IBOutlet weak var pointsValue: BCUILabel!
    @IBOutlet weak var btnView: BCUIButton!
    var delegate : TEPdfDetailCellDelegate?
    
    static let reuseIdentifier = "KTEPdfDetailCell"
    static let nibName = "TEPdfDetailCell"
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.btnView.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_4), for: .normal)
        self.btnView.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_2)
        
        #if ELSA
            self.btnView.setText(text: "View")
            
        #else
            self.btnView.setText(text: "Read Now")
            
        #endif
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func readNow_Click(_ sender: UIButton) {
        
        if let delegate = self.delegate{
            delegate.readNow_Click()
        }

    }
    
    @IBAction func download_Click(_ sender: UIButton) {
        
        if let delegate = self.delegate{
            delegate.download_Click()
        }
    }

    func setData(model:ViewNotesModel?) -> Void {
        
        if let model = model {
        
            self.lblPDFTitle.setText(text: model.title)
            self.lblPDFDescription.setText(text: model.descriptionValue)
            self.lblNumberOfPage.setText(text:"\(model.note!.count) Pages")
            
            self.lblCommentType.setText(text: "PDF")
            self.lblAuthorName.setText(text: model.createdBy)
            
            self.lblPDFMode.setText(text: "Online")
            self.lblDownloadStatus.setText(text: (model.allowDownload)! ? "Yes":"No")
            self.pointsValue.setText(text: "0")
            
            if let imageBaseUrl = model.basePath{
            
                if let notes = model.note{
                
                    if notes.count > 0 {
                    
                        let note = notes[0]
                        
                        if let imageUrl = note.contentPath{
                            
                            self.imgPDF.setImageFromUrl(url: imageBaseUrl+imageUrl,placeHolder: Utility.PLACEHOLDER_PROFILE)
                            
                        }
                    }
                }
            }
            
        }
        else{
        
            self.lblPDFTitle.setText(text: "NA")
            self.lblPDFDescription.setText(text: "NA")
             self.lblNumberOfPage.setText(text: "0 Page")
        }
        
    }
}
