//
//  TELeftMenuHeader.swift
//  TalentEdgeApp
//
//  Created by Temp  on 09/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TELeftMenuHeaderDelegate {
    
    func editProfile_Click()
}
class TELeftMenuHeader: UIView {

    
    @IBOutlet weak var profileBG: BCUIImageView!
    @IBOutlet weak var imgUser: BCUIImageView!
    @IBOutlet weak var lbluserName: BCUILabel!
    @IBOutlet weak var lblEmail: BCUILabel!
    @IBOutlet weak var expandButton: BCUIButton!
    
    static let reuseIdentifier = "KTELeftMenuHeader"
    static let nibName = "TELeftMenuHeader"
    var delegate : TELeftMenuHeaderDelegate?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        
    }

    func viewConfigure(){
      
        if let image = Utility.getLoginUserDetail()?.resultData?.user?.avtarUrl {
            
            self.imgUser?.setImageFromUrl(url: image,placeHolder: Utility.PLACEHOLDER_PROFILE)
        }
        
        let fullName = (Utility.getLoginUserDetail()?.resultData?.user?.fName)! + " " + (Utility.getLoginUserDetail()?.resultData?.user?.lName)!
        
        lbluserName.setText(text:fullName)
        
        lblEmail.setText(text: Utility.getLoginUserDetail()?.resultData?.user?.email)
        
        #if ELSA
            self.profileBG.setImage(name: "profile_bg")
            self.profileBG.backgroundColor = UIColor.clear
            
        #elseif PVR
            self.profileBG.backgroundColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_5)
            
        #else
            self.profileBG.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_2)
            
        #endif
        
    }

    @IBAction func editProfile_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.editProfile_Click()
        }
    }
}
