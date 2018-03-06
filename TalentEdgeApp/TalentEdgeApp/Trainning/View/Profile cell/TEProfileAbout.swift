//
//  TEProfileAbout.swift
//  TalentEdgeApp
//
//  Created by Temp  on 01/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEProfileAboutCellDelegate {
    
    func aboutEditing(value : String )
}

class TEProfileAbout: BCUITableViewCell,UITextViewDelegate {

    @IBOutlet weak var aboutUser: BCUILabel!
    @IBOutlet weak var txtAbout: UITextView!
    var isEditModeOpen = false
    static let reuseIdentifier = "KTEProfileAbout"
    static let nibName = "TEProfileAbout"
    var delegate : TEProfileAboutCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(){
        
        
        if isEditModeOpen == true{
            self.txtAbout.isHidden = false
            self.aboutUser.isHidden = true
        }else{
            
            self.aboutUser.isHidden = false
            self.txtAbout.isHidden = true
        }
        
       
        self.aboutUser.setText(text: txtAbout.text)
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if let delegate = self.delegate{
            delegate.aboutEditing(value: textView.text)
        }
    }
}
