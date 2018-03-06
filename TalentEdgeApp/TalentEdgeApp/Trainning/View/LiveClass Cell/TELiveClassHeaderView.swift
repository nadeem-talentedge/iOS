//
//  TELiveClassHeaderView.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TELiveClassHeaderViewDelegate {
    func filter_Click()
}

class TELiveClassHeaderView: UIView {

    @IBOutlet weak var heading: BCUILabel!
    static let reuseIdentifier = "KTELiveClassHeaderView"
    static let nibName = "TELiveClassHeaderView"
    var delegate : TELiveClassHeaderViewDelegate?
    
    
    
    
    override func awakeFromNib() {
        
    }
    
    
    @IBAction func filter_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.filter_Click()
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
