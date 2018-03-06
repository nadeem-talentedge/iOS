//
//  ThemeManager.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 06/09/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

enum AppColor {
    
    case clear
    case navigation
    case loader
    case app_button
    case app_button_border_color
    case text_app_button
    case text_heading
    case text_subheading
    case text_normal
    case text_error_message
    case top_container_background
    case text_card_heading
    case text_card_subheading
    case text_card_normal
    case text_left_menu
    case background_left_menu
    
    
}

enum AppFontSize {
    
    case very_tiny
    case tiny
    case small
    case medium
    case large
    case extra_large
    case very_large
}

enum AppFontType {
    
    case light
    case regular
    case italic
    case medium
    case bold
}

enum HomePageMenuColor{
    
    case background
    case indicator
    case hairline
    case selectedText
    case normalText
}

class ThemeManager: NSObject {
    
    static func setThemeColor(appColor:AppColor?) -> UIColor{
        
        var instanceColor = UIColor.clear
        
        if let appColor = appColor{
            
            switch appColor {
             
            case .clear:
                instanceColor = UIColor.clear
            
            case .loader:
                instanceColor = UIColor(hexString: "#ffcb07")
                
            case .top_container_background:
                instanceColor = UIColor(hexString: "#234795")
                
            case .navigation:
                instanceColor = UIColor(hexString: "#234795")
            
            case .app_button:
                instanceColor = UIColor(hexString: "#008ebf")
                
            case .text_app_button:
                instanceColor = UIColor.white
                
            case .text_normal:
                instanceColor = UIColor(hexString: "#333333")
                
            case .text_subheading:
                instanceColor = UIColor(hexString: "#333333")
                
            case .text_heading:
                instanceColor = UIColor(hexString: "#333333")
                
            case .app_button_border_color:
                instanceColor = UIColor(hexString: "#ffcb07")
                
                
            case .text_error_message:
                instanceColor = UIColor(red: 244.0/255.0, green: 128.0/255.0, blue: 56.0/255.0, alpha: 1)
                
            case .text_card_heading:
                instanceColor = UIColor.white
                
            case .text_card_subheading:
                instanceColor = UIColor(hexString: "#cccccc")
                
            case .text_card_normal:
                instanceColor = UIColor(hexString: "#999999")
                
            case .text_left_menu:
                instanceColor = UIColor(hexString: "#ffcb07")
                
            case .background_left_menu:
                instanceColor = UIColor(hexString: "#303030")
            }
        }
        return instanceColor
    }
    
    static func setThemeFont(fontType:AppFontType?,fontSize:AppFontSize?) -> UIFont{
        
        var instanceFont = UIFont.systemFont(ofSize: 14)
        
        if let fontType = fontType, let fontSize = fontSize {
            
            instanceFont = UIFont(name: ThemeManager.getFontType(fontType: fontType), size: ThemeManager.getFontSize(fontSize: fontSize))!
        }
        return instanceFont
    }
    
    static func getFontType(fontType:AppFontType) -> String{
        
        /*
 
 
         ------------------------------
         Font Family Name = [Helvetica Neue]
         Font Names = [["HelveticaNeue-UltraLightItalic", "HelveticaNeue-Medium", "HelveticaNeue-MediumItalic", "HelveticaNeue-UltraLight", "HelveticaNeue-Italic", "HelveticaNeue-Light", "HelveticaNeue-ThinItalic", "HelveticaNeue-LightItalic", "HelveticaNeue-Bold", "HelveticaNeue-Thin", "HelveticaNeue-CondensedBlack", "HelveticaNeue", "HelveticaNeue-CondensedBold", "HelveticaNeue-BoldItalic"]]
         ------------------------------
 
        */
        
        
        switch fontType {
            
            case .italic:
                return  "HelveticaNeue-LightItalic"
            
            case .light:
                return  "HelveticaNeue-Light"
            
            case .regular:
                return  "Helvetica Neue"
            
            case .medium:
                return  "HelveticaNeue-Medium"
            
            case .bold:
                return  "HelveticaNeue-Bold"
        }
    }
    
    static func getFontSize(fontSize:AppFontSize) -> CGFloat{
        
        switch fontSize {
            
            case .very_tiny:
                    return  9.0
            
            case .tiny:
                return  11.0
            
            case .small:
                return  13.0
            
            case .medium:
                return  14.0
            
            case .large:
                return  16.0
            
            case .extra_large:
                return  24.0
            
           case .very_large:
                return  28.0
        }
    }
    
    static func getHomePageMenuColor(colorTheme:HomePageMenuColor) -> UIColor{
        
        var instanceColor = UIColor.clear
        
        switch colorTheme {
            
            case .background:
                instanceColor = UIColor(hexString: "#f1f1f1")
            
            case .hairline:
                instanceColor = UIColor.lightGray
            
            case .indicator:
                instanceColor = UIColor(hexString: "#008ebf")
            
            case .selectedText:
                instanceColor = UIColor(hexString: "#008ebf")
            
            case .normalText:
                instanceColor = UIColor(hexString: "#333333")
            
        }
        
        return instanceColor
    }
}
