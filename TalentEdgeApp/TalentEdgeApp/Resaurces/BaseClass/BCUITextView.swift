//
//  BCUITextView.swift
//  TalentEdgeApp
//
//  Created by Temp  on 08/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class BCUITextView: UITextView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        
        self.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    @IBInspectable var corner: CGFloat = 0.0 {
        
        didSet{
            
            self.layer.cornerRadius = self.corner
        }
        
        willSet{
            
            self.layer.cornerRadius = self.corner
        }
    }
    
    @IBInspectable var clip: Bool = false {
        
        didSet{
            
            self.clipsToBounds = self.clip
        }
        
        willSet{
            
            self.clipsToBounds = self.clip
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet{
            
            self.layer.borderColor = self.borderColor.cgColor
        }
        
        willSet{
            
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        
        didSet{
            
            self.layer.borderWidth = self.borderWidth
        }
        
        willSet{
            
            self.layer.borderWidth = self.borderWidth
        }
    }
    
}
