//
//  TEInputText.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 23/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEInputTextDelegate {
    
    func raiseDoubtDidClick(status:Bool) -> Void
    func textViewDidEndEditing(indexPath:IndexPath?,text:String?) -> Void
    func textFieldDidEndEditing(indexPath:IndexPath?,text:String?) -> Void
}

class TEInputText: BCUITableViewCell {

    static let nibName = "TEInputText"
    static let reuseIdentifier = "kTEInputText"
    
    var delegate:TEInputTextDelegate?
    
    @IBOutlet weak var btnDoubt:BCUIButton!
    @IBOutlet weak var txtSubject:UITextField!
    @IBOutlet weak var txtDescription:BCUITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        txtDescription.text = "Message"
        txtDescription.textColor = UIColor.lightGray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func raiseDoubtDidClick(sender:BCUIButton) -> Void{
        
        if sender.isSelected == true{
           
            sender.isSelected = false
            
        }else{
            
            sender.isSelected = true
        }
        
        if let delegate = self.delegate {
            
            delegate.raiseDoubtDidClick(status: sender.isSelected)
        }
    }
}


extension TEInputText:UITextViewDelegate,UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let delegate = self.delegate{
            
            delegate.textFieldDidEndEditing(indexPath: self.indexPath, text: textField.text)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
    
        if textView.text.isEmpty {
            textView.text = "Message"
            textView.textColor = UIColor.lightGray
        }
        
        if let delegate = self.delegate{
            
            delegate.textViewDidEndEditing(indexPath: self.indexPath, text: textView.text)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
