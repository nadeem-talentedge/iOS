//
//  TELernersCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 30/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TELernersCellDelegate  {
 
    func learnerChatButtonDidClick(indexPath:IndexPath?)
}

class TELernersCell: BCUITableViewCell {

    static let reuseIdentifier = "mTELernersCell"
    static let nibName = "TELernersCell"
    
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var lblAddress: BCUILabel!
    @IBOutlet weak var lblActivityTime: BCUILabel!
    @IBOutlet weak var imgUser: BCUIImageView!
    @IBOutlet weak var btnChat: BCUIButton!
    
    var delegate : TELernersCellDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblName.fontSize = .large
        self.lblName.fontType = .bold
        self.lblName.setTextColor = .text_heading
        
        self.lblAddress.fontSize = .medium
        self.lblAddress.fontType = .light
        self.lblAddress.setTextColor = .text_normal
        
        self.lblActivityTime.fontSize = .medium
        self.lblActivityTime.fontType = .light
        self.lblActivityTime.setTextColor = .text_normal
        
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellConfiguration(model : Any?){
        
        if let model = model {
    
            if model is SelfBatchStudentModel{
            
                let selfBatchStudent = model as! SelfBatchStudentModel
                
                self.imgUser.setImageFromUrl(url: selfBatchStudent.image, placeHolder: nil)
                
                self.lblName.setText(text: selfBatchStudent.name)
                
                self.lblAddress.setText(text: "Yourself")
                
                self.lblActivityTime.setText(text:"Last Activity: \((selfBatchStudent.lastActive ?? ""))")
                
                self.btnChat.isHidden = true
                
                
            }else{
            
                let batchStudent = model as! BatchStudentModel
                
                self.imgUser.setImageFromUrl(url: batchStudent.image, placeHolder: nil)
                
                self.lblName.setText(text: batchStudent.name)
                
                self.lblAddress.setText(text:"\((batchStudent.city ?? "")) , \((batchStudent.country ?? ""))")
                
                self.lblActivityTime.setText(text:"Last Activity: \((batchStudent.lastActive ?? ""))")
                
                self.btnChat.isHidden = false
            }
        }
    }
    
    
    @IBAction func btnChat_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate {
            
                delegate.learnerChatButtonDidClick(indexPath: self.indexPath)
        }
    }
    
    
}



