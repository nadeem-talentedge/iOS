//
//  TETestimonialHeader.swift
//  TalentEdgeApp
//
//  Created by Temp  on 28/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TETestimonialHeader: UIView {


    @IBOutlet weak var imageArrow: BCUIImageView!
    @IBOutlet weak var userName: BCUILabel!
    @IBOutlet weak var userImage: BCUIImageView!
    @IBOutlet weak var timeOfPost: BCUILabel!
    @IBOutlet weak var expandButton: BCUIButton!
    
    static let reuseIdentifier = "KTETestimonialHeader"
    static let nibName = "TETestimonialHeader"
    
    
    @IBAction func expandButton_Click(_ sender: BCUIButton) {
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
