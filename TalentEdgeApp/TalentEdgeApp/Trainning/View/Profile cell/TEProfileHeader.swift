//
//  TEProfileHeader.swift
//  TalentEdgeApp
//
//  Created by Temp  on 01/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


protocol TEProfileHeaderDelegate {
    
    func selectImage() -> Void
}

class TEProfileHeader: UIView {

    static let nibName = "TEProfileHeader"
    static let reuseIdentifier = "KTEProfileHeader"
    
    var delegate : TEProfileHeaderDelegate?
    @IBOutlet weak var userImg: BCUIImageView!
    @IBOutlet weak var btnImg: BCUIButton!
    @IBOutlet weak var lblName: BCUILabel!
    
    override func awakeFromNib() {
       
        self.lblName.setText(text: "\(Utility.getLoginUserDetail()?.resultData?.user?.fName ?? "") \(Utility.getLoginUserDetail()?.resultData?.user?.lName ?? "")")
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        
        if let delegate = self.delegate{
            
            delegate.selectImage()
        }
    }
}
