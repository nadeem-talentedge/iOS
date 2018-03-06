//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TENewsLetterCellDelegate {
    
    func newsletterDidSelectMessage(indexPath:IndexPath?) -> Void
    func newsletterDidSelectLike(indexPath:IndexPath?) -> Void
    func newsSelectNoteAndVideo(indexPath : IndexPath?) -> Void

}

class TENewsLetterCell: BCUITableViewCell {

    
    var delegate:TENewsLetterCellDelegate?
    
    static let reuseIdentifier = "kTENewsLetterCell"
    static let nibName = "TENewsLetterCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var btnContentType:   BCUIButton!
    @IBOutlet weak var btnPostedTime: BCUIButton!
    @IBOutlet weak var imgNewLetter: BCUIImageView!
    @IBOutlet weak var imgLogo: BCUIImageView!
    
    @IBOutlet weak var lblHeading1: BCUILabel!
    
    @IBOutlet weak var lblTotalLikes: BCUILabel!
    @IBOutlet weak var btnLike: BCUIButton!
    
    @IBOutlet weak var lblTotalComments: BCUILabel!
    @IBOutlet weak var btnComment: BCUIButton!
    
    @IBOutlet weak var lblTotalShares: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    
    @IBOutlet weak var btnView: BCUIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        
        self.btnPostedTime.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_3), for: .normal)
        self.btnContentType.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_3), for: .normal)
        
        self.lblHeading1.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        
        self.lblTotalLikes.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        self.lblTotalComments.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        self.lblTotalShares.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_2)
        
        self.btnLike.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        self.btnLike.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        self.btnLike.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        
        self.btnView.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_4), for: .normal)
        self.btnView.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_2)
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Set Data
    
    func setData(model:TENewLetterModel?,baseURL:String?) -> Void {
    
        
        
        if let model = model{
            
            #if ELSA
                
                if let user = model.byUserPic, let base = baseURL{
                    
                    self.imgLogo.setImageFromUrl(url: base+user, placeHolder: nil)
                }
                //self.imgLogo.setImage(name: "ic_newsletter")
                
            #else
                
                self.imgLogo.setImage(name: "ic_newsletter")
                
            #endif
            
            
            self.imgNewLetter.setImageFromUrlAndUpdateTable(url: model.previewImage, placeHolder: nil, tableView: self.superCalssRef, indexPath: self.indexPath)
            
            //self.imgNewLetter.setImageFromUrl(url:model.previewImage, placeHolder: nil);
            
            self.lblTitle.setText(text: model.title)
            
            self.btnContentType.setText(text: "News Letter")
            
            if let time = model.created{
            
                //print("New Letter ---------------->",time)
                
                if  let date = Utility.dateFromStrig(date: time, currentDateFormat: Utility.DATE_FORMAT_yyyy_mm_dd_HH_mm_ss){
                
                    self.btnPostedTime.setText(text: Utility.timeAgoSinceDate(date: date as NSDate, numericDates: true))
                    
                }else{
                
                    self.btnPostedTime.setText(text: "NA")
                }
                
            }else{
            
                self.btnPostedTime.setText(text: "NA")
            }
            
            self.lblHeading1.numberOfLines = 3
            self.lblHeading1.setText(text: model.descriptionValue)
            
            self.lblTotalLikes.setText(text: "\((model.likesCount ?? "0"))  Likes")
            
            self.lblTotalComments.setText(text: "\((model.commentCount ?? "0"))  Comments")
            
            if model.selfLiked == 1{
                
                self.btnLike.isSelected = true
            }else{
                
                self.btnLike.isSelected = false
            }
        }
    }

    //MARK:- IBAction
    
    @IBAction func like(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.newsletterDidSelectLike(indexPath: self.indexPath)
        }
    }
    
    @IBAction func message(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
            
            delegate.newsletterDidSelectMessage(indexPath: self.indexPath)
        }
    }
    
    @IBAction func readbtn_Click(_ sender: UIButton) {
        
        if let delegate = self.delegate {
            
            delegate.newsSelectNoteAndVideo(indexPath: self.indexPath)
        }
    }
}
