//
//  TEContactListCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 21/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEContactListCellDelegate {
    
    func mobileNumberClick(indexPath: IndexPath?)
    func messageClick(indexPath: IndexPath?)
    func shareClick(indexPath: IndexPath?)
}

class TEContactListCell: BCUITableViewCell {

    var delegate:TEContactListCellDelegate?
    
    static let nibName = "TEContactListCell"
    static let reuseIdentifier = "kTEContactListCell"
    
    @IBOutlet weak var imgUser: BCUIImageView!
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblEmail: BCUILabel!
    @IBOutlet weak var lblMobileNumber: BCUILabel!
    
    @IBOutlet weak var btnMobile: BCUIButton!
    @IBOutlet weak var btnMessage: BCUIButton!
    @IBOutlet weak var btnShare: BCUIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func mobileNumberClick(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.mobileNumberClick(indexPath: self.indexPath)
            
        }
        
    }
    
    @IBAction func messageClick(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.messageClick(indexPath: self.indexPath)
            
        }
    }
    
    @IBAction func shareClick(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.shareClick(indexPath: self.indexPath)
            
        }
    }
    
    func setData(model:Contact?) -> Void {
        
        if let model = model {
            
            self.lblName.setText(text: "\(model.firstName ?? "") \(model.lastName ?? "")")
            self.lblTitle.setText(text: model.designation)
            self.lblEmail.setText(text: model.email)
            self.lblMobileNumber.setText(text: model.mobileNo)
            self.imgUser.setImageFromUrl(url: model.pic, placeHolder: nil)
        }
    }
    
}
