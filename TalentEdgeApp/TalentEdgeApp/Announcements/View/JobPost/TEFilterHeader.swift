//
//  TEJobPostHeader.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEFilterHeaderDelegate {
    
    func didSelectFilter() -> Void
}

class TEFilterHeader: UIView {

    var delegate:TEFilterHeaderDelegate?
    
    static let nibName = "TEFilterHeader"
    
    override func awakeFromNib() {
        
        self.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
    }

    @IBAction func didSelectFilter() -> Void{
    
        if let delegate = self.delegate{
        
            delegate.didSelectFilter()
        }
    }
}


