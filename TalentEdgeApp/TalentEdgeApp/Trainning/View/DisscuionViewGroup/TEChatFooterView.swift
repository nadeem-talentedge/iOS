//
//  TEChatFooterView.swift
//  TalentEdgeApp
//
//  Created by Temp  on 11/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


protocol TEChatFooterViewDelegate {
    
    func send_Click(chatText : String)
}


class TEChatFooterView: BCView {

    @IBOutlet weak var btnSend: BCUIButton!
    @IBOutlet weak var txtVWChat: UITextView!
    @IBOutlet weak var imgUser: BCUIImageView!
    var delegate :TEChatFooterViewDelegate?
    
    static let reuseIdentifier = "KTEChatFooterView"
    static let nibName = "TEChatFooterView"
    
    @IBAction func send_Click(_ sender: BCUIButton) {
        
//        if txtVWChat.text.characters
        if let delegate = self.delegate{
                delegate.send_Click(chatText: txtVWChat.text)
        }
        
    }
    
    
    func configureView(){
        
        imgUser.setImageFromUrl(url: Utility.getLoginUserDetail()?.resultData?.user?.avtarUrl,placeHolder: Utility.PLACEHOLDER_PROFILE)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
