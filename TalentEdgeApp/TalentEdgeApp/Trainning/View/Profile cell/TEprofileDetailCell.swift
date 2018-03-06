//
//  TEprofileDetailCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 01/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEprofileDetailCellDelegate {
 
    func textFieldDidEndEditing(indx : Int ,value : String )
}

class TEprofileDetailCell: BCUITableViewCell,UITextFieldDelegate {

    
    @IBOutlet weak var txtValue: BCTextField!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblValue: BCUILabel!
    static let reuseIdentifier = "KTEprofileDetailCell"
    static let nibName = "TEprofileDetailCell"
    var isEditModeOpen = false
    var delegate : TEprofileDetailCellDelegate?
    var indexVal : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // Initialization code
    }
    
    
    
    func configureCell(title : String,value : String?){
        
        
        if isEditModeOpen == true{
            self.txtValue.isHidden = false
            self.lblValue.isHidden = true
        }else{
            self.txtValue.isHidden = true
            self.lblValue.isHidden = false
        }
        
        self.lblTitle.setText(text: title)
        
        if let valObj = value{
                self.lblValue.setText(text: valObj)
                self.txtValue.setText(text: valObj)
        }
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let delegate = self.delegate{
            delegate.textFieldDidEndEditing(indx: indexVal!, value: textField.text! as String)
        }
    }
    /*func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let delegate = self.delegate{
            delegate.textFieldDidEndEditing(indx: indexVal!, value: textField.text!)
        }
    }*/
}


extension TEprofileDetailCell{
    
    
}
