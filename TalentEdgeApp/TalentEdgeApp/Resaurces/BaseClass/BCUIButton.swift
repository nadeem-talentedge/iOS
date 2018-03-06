//
//  BCUIButton.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


class BCUIButton: UIButton {

    override func awakeFromNib() {
        
        //self.titleLabel?.font = UIFont.init(name: Utility.APP_FONT_NAME, size: (self.titleLabel?.font.pointSize)!)
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
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        
        didSet{
            
            self.layer.shadowColor = self.shadowColor.cgColor
        }
        
        willSet{
            
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        
        didSet{
            
            self.layer.shadowOpacity = self.shadowOpacity
        }
        
        willSet{
            
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        
        didSet{
            
            self.layer.shadowOffset = self.shadowOffset
        }
        
        willSet{
            
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        
        didSet{
            
            self.layer.shadowRadius = self.shadowRadius
        }
        
        willSet{
            
            self.layer.shadowRadius = self.shadowRadius
        }
    }
    
    
    var fontSize:AppFontSize = AppFontSize.small
    
    var fontType:AppFontType = AppFontType.regular {
        
        didSet{
            
            self.titleLabel?.font = ThemeManager.setThemeFont(fontType: fontType, fontSize: self.fontSize)
        }
    }
    
    var setTextColor:AppColor = AppColor.clear{
        
        didSet{
            
            self.setTitleColor(ThemeManager.setThemeColor(appColor: setTextColor), for: .normal)
        }
    }
    
    var isThemeButton = false {
        
        didSet{
            
            if isThemeButton == true{
                
                self.backgroundColor = ThemeManager.setThemeColor(appColor: .app_button)
                self.borderWidth = 2.0
                self.borderColor = ThemeManager.setThemeColor(appColor: .app_button_border_color)
                self.setTextColor = .text_app_button
            }
        }
    }
    
    //MARK:- Method for Setting text
    func setText(text:String?) -> Void {
        
        self.setTitle(Utility.checkForNull(value: text), for: .normal)
    }
    
}
