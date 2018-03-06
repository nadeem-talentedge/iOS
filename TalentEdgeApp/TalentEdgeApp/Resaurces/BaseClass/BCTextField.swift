//
//  BCTextField.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


class BCTextField: UITextField {

    //MARK:- Method for setting text
    func setText(text:String?) -> Void {
        
        self.text = Utility.checkForNull(value: text)
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

}
