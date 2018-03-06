//
//  BCUILabel.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class BCUILabel: UILabel {
    
    override func awakeFromNib() {
        
    }
    
    override func drawText(in rect: CGRect) {
        
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    var fontSize:AppFontSize = AppFontSize.small
    
    var fontType:AppFontType = AppFontType.regular {
        
        didSet{
            
            self.font = ThemeManager.setThemeFont(fontType: fontType, fontSize: self.fontSize)
        }
    }
    
    var setTextColor:AppColor = AppColor.clear{
        
        didSet{
            
            self.textColor = ThemeManager.setThemeColor(appColor: setTextColor)
        }
    }
    
    @IBInspectable var topInset: CGFloat = 0.0
    
    @IBInspectable var bottomInset: CGFloat = 0.0
    
    @IBInspectable var leftInset: CGFloat = 0.0
    
    @IBInspectable var rightInset: CGFloat = 0.0
    
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
    
    @IBInspectable var shadowsColor: UIColor = UIColor.clear {
        
        didSet{
            
            self.layer.shadowColor = self.shadowsColor.cgColor
        }
        
        willSet{
            
            self.layer.shadowColor = self.shadowsColor.cgColor
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
    
    @IBInspectable var shadowPosition: CGSize = CGSize(width: 0.0, height: 0.0) {
        
        didSet{
            
            self.layer.shadowOffset = self.shadowPosition
        }
        
        willSet{
            
            self.layer.shadowOffset = self.shadowPosition
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
}

extension BCUILabel {
    
    //MARK:- Method for setting text
    func setTextFont(fontName:String?,fontSize:CGFloat?) -> Void {
        
        if let fontName = fontName, let fontSize = fontSize{
            
            self.font = UIFont(name: fontName, size: fontSize)
            
        }
    }
    
    func setText(text:String?) -> Void {
        
        self.text = Utility.checkForNull(value: text)
    }
    
}
