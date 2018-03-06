//
//  TELeftMenuItem.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 26/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TELeftMenuItemDelegate {
    
    func selectSection(sectionNumber:Int) -> Void
}

class TELeftMenuItem: UIView {

    static let nibName = "TELeftMenuItem"
    
    @IBOutlet weak var imageIcon: BCUIImageView!
    
    @IBOutlet weak var lblTitle: BCUILabel!
    
    @IBOutlet weak var btnDownArrow: BCUIButton!
    
    @IBOutlet weak var btnSelectHeader: BCUIButton!
    
    var sectionNumber = 0
    var delegate:TELeftMenuItemDelegate?
    
    func configurecell(imageName : String, titleValue : String){
        
        imageIcon.setImage(name: imageName)
        lblTitle.setText(text: titleValue)
    }
    
    @IBAction func selectSection(sender:BCUIButton) -> Void{
    
        if let delegate = self.delegate{
        
            delegate.selectSection(sectionNumber: self.sectionNumber)
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
