//
//  TEValidation.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 20/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEValidation: NSObject {
    
    static func isValidEmail(_ testStr:String, userType: String) -> String {
        // println("validate calendar: \(testStr)")
        if testStr.characters.count == 0
        {
            return userType + " email is required."
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: testStr) == false
        {
            return userType + " email invalid"
        }
        return ""
    }
    
    static func isValidatedName(_ testStr:String) -> String {
        // println("validate calendar: \(testStr)")
        if testStr.characters.count == 0
        {
            return "Customer name is required."
        }
        else if testStr.characters.count < 3
        {
            return "Customer name invalid."
        }
        
        /*let charcter  = CharacterSet(charactersIn: "0123456789").inverted
        let filtered:NSString!
        let inputString  = testStr.components(separatedBy: charcter)
        
        filtered = inputString.joined(separator:"") as NSString!
        if filtered.length > 0
        {
            return "Name should be characters only."
        }*/
        
        return ""
    }
    
    static func phoneNumberValidation(_ value: String) -> String
    {
        if value.characters.count == 0
        {
            return "Customer mobile-number is required."
        }
        
        if value.characters.count == 10{}
            
        else { return "Customer mobile invalid." }
        
        if value.hasPrefix("9") || value.hasPrefix("8") || value.hasPrefix("7"){}
        else { return "Customer mobile invalid." }
        
        let charcter  = CharacterSet(charactersIn: "0123456789").inverted
        let filtered:String!
        let inputString:[String] = value.components(separatedBy: charcter)//value.components(separatedBy: charcter)
        filtered = (inputString.joined(separator:"") as NSString!) as String!
        
        
        //componentsJoined(by: "") as NSString!
        if value == filtered
        {
            return ""
        }
        else
        {
            return "Customer mobile invalid."
        }
    }
    
    static func OTPValidation(_ value: String) -> String
    {
        if value.characters.count == 0
        {
            return "Please enter your OTP"
        }
        let charcter  = CharacterSet(charactersIn: "0123456789").inverted
        let filtered:String!
        
        let inputString:[String] = value.components(separatedBy: charcter)//value.components(separatedBy: charcter)
        filtered = (inputString.joined(separator:"") as NSString!) as String!
        
        //  let inputString:NSArray = value.components(separatedBy: charcter)
        // filtered = inputString.componentsJoined(by: "") as NSString!
        if value == filtered
        {
            return ""
        }
        else
        {
            return "OTP is invalid."
        }
    }
    
    
    static func getTrimString(str:String) -> String{
        
        let trimmedString = str.trimmingCharacters(in: .whitespaces)
        return trimmedString
    }
    
}
