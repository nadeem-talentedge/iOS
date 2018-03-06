//
//  Utility.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class Utility: NSObject {
    
    // com.app.testapns
    
    //MARK:- Storyboard Ids

    static let ID_HomeVC = "ID_HomeVC"
    static let ID_AppHome = "ID_TEAppHomeVC"
    static let ID_ModuleVC = "ID_TEModuleVC"
    static let ID_TEContentVC = "ID_TEContentVC"
    static let ID_TEQuizVC = "ID_TEQuizVC"
    static let ID_TELecturerDetailVC = "ID_TELecturerDetailVC"
    static let ID_TELiveClassVC = "ID_TELiveClassVC"
    static let ID_TEUserProfileVC = "ID_TEUserProfileVC"
    static let ID_TEDiscussionListVC = "ID_TEDiscussionListVC"
    static let ID_TEQuizChildVC = "ID_TEQuizChildVC"
    static let ID_TEAttendanceVC = "ID_TEAttendanceVC"
    static let ID_TEModulePlannerVC = "ID_TEModulePlannerVC"
    static let ID_TEMessageVC = "ID_TEMessageVC"
    static let ID_TENotificationVC = "ID_TENotificationVC"
    static let ID_TESearchVC = "ID_TESearchVC"
    static let ID_TEAnnouncementListVC = "ID_TEAnnouncementListVC"
    static let ID_TETourVC = "ID_TETourVC"
    static let ID_TETourChildVC = "ID_TETourChildVC"
    static let ID_TETemplatesVC = "ID_TETemplatesVC"
    static let ID_ANDetailVC = "ID_ANDetailVC"
    static let ID_ANEventDetailVC = "ID_ANEventDetailVC"
    static let ID_TEJobPostVC = "ID_TEJobPostVC"
    static let ID_TERefferalVC = "ID_TERefferalVC"
    static let ID_TERefferalHome = "ID_TERefferalHome"
    static let ID_TENewPostVC = "ID_TENewPostVC"
    static let ID_ANReplyOnCommentVC = "ID_ANReplyOnCommentVC"
    static let ID_TERefferalHomeELSA = "ID_TERefferalHomeELSA"
    
    static let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters.map({ String($0) })
    
    static let APP_FONT_NAME = "HelveticaNeue"
    
    //MARK:- Symbol
    static let RUPEE_SYMBOL = "₹ "
    
    static let lightGrayColor : UIColor = (UIColor(red: 121.0/255.0, green: 121.0/255.0, blue: 121.0/255.0, alpha: 1.0))
    
    static let yelloColorCustom = UIColor(colorLiteralRed: 235.0/255.0, green: 155.0/255.0, blue: 56.0/255.0, alpha: 1.0)
    
    static let greenColorCustom = UIColor(colorLiteralRed: 69.0/255.0, green: 169.0/255.0, blue: 59.0/255.0, alpha: 1.0)
    
    static let grayColorCustom = UIColor(colorLiteralRed: 202.0/255.0, green: 205.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
    //MARK:- END Colors Code
    
    
    //MARK:- Storyboard Name
    
    static let STORYBOARD_TRAINING = "Main"
    static let STORYBOARD_Announcement = "Announcement.storyboard"
    
    //MARK:- Place Holder Images Name
    static let PLACEHOLDER_PROFILE = "man-user"
    
    
    
    
    
    //MARK:- Static Function
    
    class func checkForNull(value:Any?) -> String{
        
        if let value = value{
            
            if let string = value as? String {
            
                if string.isEmpty == true{
                    
                    return ""
                    
                }else{
                
                    return string
                }
                
            }
            else{
                
                return ""
            }
            
        }else{
            
            return ""
        }
        
    }
    
    //MARK:- Saving Login User Detail
    
    static func saveUserDetail(loginUser:LoginBase?) -> Void{
    
        let userDefault  = UserDefaults.standard
        
        if let _ = userDefault.value(forKey:"loginUser") {
        
            userDefault.removeObject(forKey: "loginUser")
        }
        
        if let loginUser = loginUser{
        
            userDefault.set(NSKeyedArchiver.archivedData(withRootObject: loginUser), forKey: "loginUser");
        }
        
        userDefault.synchronize()
        
    }
    
    static func getLoginUserDetail() -> LoginBase?{
    
        let userDefault  = UserDefaults.standard
        
        if let data = userDefault.value(forKey:"loginUser") as? Data {
        
            if let loginUser = NSKeyedUnarchiver.unarchiveObject(with: data) as? LoginBase {
           
                return  loginUser;
            }else{
            
                return nil
            }
        }
        
        return nil
    }
    
    static func deleteLoginUser() -> Void{
        
        let userDefault  = UserDefaults.standard
        
        if let _ = userDefault.value(forKey:"loginUser") {
            
            userDefault.removeObject(forKey: "loginUser")
        }
        userDefault.synchronize()
    }
    
    //MARK:- Alert Controller
    
    static func showAlert(message: String?, title: String?, actions: [UIAlertAction]?, controller: UIViewController!) {
        
        DispatchQueue.main.async( execute: {
            
            var displayMessage: String? = message
            var displayTitle: String? = title
            
            if message == nil{
                
                displayMessage = "Test Message"
            }
            
            if title == nil{
                
                displayTitle = ""
            }
            let alertController = UIAlertController(title: displayTitle, message: displayMessage, preferredStyle: .alert)
            
            
            if (actions != nil){
                
                for action in actions!{
                    
                    alertController.addAction(action)
                    
                }
                
            }else{
                
                
                let defaultAction =  UIAlertAction(title: "OK", style: .destructive) { (UIAlertAction) in
                    
                }
                alertController.addAction(defaultAction)
            }
            controller.present(alertController, animated: true, completion: nil)
        })
    }
    
    
    //MARK:- Value convertor
    
    class func AnyVaueToInt(value:AnyObject?) -> AnyObject? {
        
        if let value = value {
        
            if value is String {
            
                if let value = value as? String{
                
                    return Int(value) as AnyObject
                    
                }else{
                
                    return value
                }
                
                
            }else {
            
                return value
            }
        
        }else {
        
            return nil
        }
    }
    
    
    //MARK:- NoDataFound View
    
    class func nodataFoundView() -> TENoDataFound{
        
        let view =  Bundle.main.loadNibNamed(TENoDataFound.nibName, owner: self, options: nil)?[0] as! TENoDataFound;
        
        return view
    }
    
    class func nodataFoundView(title:String) -> TENoDataFound{
        
        let view =  Bundle.main.loadNibNamed(TENoDataFound.nibName, owner: self, options: nil)?[0] as! TENoDataFound;
        
        view.lblTitle.setText(text: title)
        
        return view
    }
    
    //MARK:- UIColor From Hexa
    
    class func colorWithHexString (hexa:String?) -> UIColor {
        
        if let hex = hexa{
            
            var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
            
            if (cString.hasPrefix("#")) {
                cString = (cString as NSString).substring(from: 1)
            }
            
            if (cString.characters.count != 6) {
                return UIColor.gray
            }
            
            let rString = (cString as NSString).substring(to: 2)
            let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
            let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
            
            var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
            Scanner(string: rString).scanHexInt32(&r)
            Scanner(string: gString).scanHexInt32(&g)
            Scanner(string: bString).scanHexInt32(&b)
            
            return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        }else{
            
            return UIColor.darkGray
        }
    }
    
    //MARK:- Array TO STRING
   
    class func arrayToString(array:NSMutableArray?) -> String? {
        
        if let array = array{
            
            let data1 = try! JSONSerialization.data(withJSONObject: array, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
                return String(data: data1, encoding: String.Encoding.utf8)
        }
        return nil
    }
    
    class func jsonToString(json:NSDictionary?) -> String? {
        
        if let json = json{
        
            let data1 = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            
            let convertedString = String(data: data1, encoding: String.Encoding.utf8)
            
            return convertedString
        }
        return nil
    }
    
    //MARK:- Image With Color
    
    class func setImageWithTintColor(image:UIImage, tintColor:UIColor) -> UIImage {
        
        
        
        var imageTemp:UIImage = (image.withRenderingMode(.alwaysTemplate))
        
        UIGraphicsBeginImageContextWithOptions(image.size,false, image.scale)
        
        tintColor.set()
        
        imageTemp.draw(in: CGRect(x: 0, y: 0, width:
            imageTemp.size.width, height: imageTemp.size.height))
        
        imageTemp = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return imageTemp
        
    }
    
}

extension NSDictionary {

    func string() -> String? {
        
        let data1 = try! JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
        
        let convertedString = String(data: data1, encoding: String.Encoding.utf8)
        
        return convertedString
    }
}

//MARK:- App Color

enum ColorTheme{

    case defaultColor  //0
    case clearColor    //1
    case THEME_1       //2
    case THEME_2       //3
    case THEME_3       //4
    case THEME_4       //5
    case THEME_5       //6
    case THEME_6       //7
    case THEME_7       //8
    case THEME_8       //9
    case TEXT_COLOR_1  //10
    case TEXT_COLOR_2  //11
    case TEXT_COLOR_3  //12
    case TEXT_COLOR_4  //13
    case TEXT_COLOR_5  //13

}

extension Utility {

    class func getColorAccordingTheme(theme:ColorTheme) -> UIColor {
        
        if let model = AppDelegate.sharedDeleagte().appSettingModel{
        
            switch theme {
                
            case .THEME_1:
                
               return Utility.rgbToUIColor(red: model.appTheme?.themeColor1?.red, green: model.appTheme?.themeColor1?.green, blue: model.appTheme?.themeColor1?.blue, alpha: 1)
                
            case .THEME_2:
                
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor2?.red, green: model.appTheme?.themeColor2?.green, blue: model.appTheme?.themeColor2?.blue, alpha: model.appTheme?.themeColor2?.alpha)
                
            case .THEME_3:
               
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor3?.red, green: model.appTheme?.themeColor3?.green, blue: model.appTheme?.themeColor3?.blue, alpha: model.appTheme?.themeColor3?.alpha)
                
            case .THEME_4:
                
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor4?.red, green: model.appTheme?.themeColor4?.green, blue: model.appTheme?.themeColor4?.blue, alpha: model.appTheme?.themeColor4?.alpha)
                
            case .THEME_5:
               
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor5?.red, green: model.appTheme?.themeColor5?.green, blue: model.appTheme?.themeColor5?.blue, alpha: model.appTheme?.themeColor5?.alpha)
                
            case .THEME_6:
                
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor6?.red, green: model.appTheme?.themeColor6?.green, blue: model.appTheme?.themeColor6?.blue, alpha: model.appTheme?.themeColor6?.alpha)
                
            case .THEME_7:
                
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor7?.red, green: model.appTheme?.themeColor7?.green, blue: model.appTheme?.themeColor7?.blue, alpha: model.appTheme?.themeColor7?.alpha)
                
            case .THEME_8:
                
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor8?.red, green: model.appTheme?.themeColor8?.green, blue: model.appTheme?.themeColor8?.blue, alpha: model.appTheme?.themeColor8?.alpha)
                
            case .defaultColor:
                
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor9?.red, green: model.appTheme?.themeColor9?.green, blue: model.appTheme?.themeColor9?.blue, alpha: model.appTheme?.themeColor9?.alpha)
                
            case .clearColor:
                
                return Utility.rgbToUIColor(red: model.appTheme?.themeColor10?.red, green: model.appTheme?.themeColor10?.green, blue: model.appTheme?.themeColor10?.blue, alpha: model.appTheme?.themeColor10?.alpha)
                
            case .TEXT_COLOR_1:
                
                return Utility.rgbToUIColor(red: model.appTheme?.headingTextColor1?.red, green: model.appTheme?.headingTextColor1?.green, blue: model.appTheme?.headingTextColor1?.blue, alpha: model.appTheme?.headingTextColor1?.alpha)
                
            case .TEXT_COLOR_2:
                
                return Utility.rgbToUIColor(red: model.appTheme?.headingTextColor2?.red, green: model.appTheme?.headingTextColor2?.green, blue: model.appTheme?.headingTextColor2?.blue, alpha: model.appTheme?.headingTextColor2?.alpha)
                
            case .TEXT_COLOR_3:
                
                return Utility.rgbToUIColor(red: model.appTheme?.headingTextColor3?.red, green: model.appTheme?.headingTextColor3?.green, blue: model.appTheme?.headingTextColor3?.blue, alpha: model.appTheme?.headingTextColor3?.alpha)
                
            case .TEXT_COLOR_4:
                
                return Utility.rgbToUIColor(red: model.appTheme?.headingTextColor4?.red, green: model.appTheme?.headingTextColor4?.green, blue: model.appTheme?.headingTextColor4?.blue, alpha: model.appTheme?.headingTextColor4?.alpha)
                
            case .TEXT_COLOR_5:
                
                return Utility.rgbToUIColor(red: model.appTheme?.headingTextColor5?.red, green: model.appTheme?.headingTextColor5?.green, blue: model.appTheme?.headingTextColor5?.blue, alpha: model.appTheme?.headingTextColor5?.alpha)
            }
            
        }else{
        
            return UIColor.black
        }
    }

    class func rgbToUIColor(red:Int?,green:Int?,blue:Int?,alpha:Int?) -> UIColor{
    
        if let red = red, let green = green, let blue = blue{
        
             let cgRed  = CGFloat(Double(red)/255.0)
             let cgGreen  = CGFloat(Double(green)/255.0)
             let cgBlue  = CGFloat(Double(blue)/255.0)
             let cgAlpha = CGFloat((alpha ?? 1))
            
           return UIColor(red: cgRed, green: cgGreen, blue: cgBlue, alpha: cgAlpha )
        }
        return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
    class func colorWithHexString (_ hex:String) -> UIColor {
        //        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}

//MARK:- Date Related Function

extension Utility {

    //yyyy-MM-dd HH:mm:ss
    static let DATE_FORMAT_yyyy_mm_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    
    //MMM dd, yyyy
    static let DATE_FORMAT_MMM_DD_YYYY = "MMM dd, yyyy"
    
    //MMM dd, yyyy h:mm:ss a
    static let DATE_FORMAT_MMM_DD_YYYY_h_mm_ss_a = "MMM dd, yyyy h:mm:ss a"
    
    //MMM dd, yyyy h:mm a
    static let DATE_FORMAT_MMM_DD_YYYY_h_mm_a = "MMM dd, yyyy HH:mm a"
    
    static func dateFromStrig(date:String,currentDateFormat:String,reuiredDateFromat:String) -> String?{
    
        let currentFormat = DateFormatter()
        currentFormat.dateFormat = currentDateFormat
        
        if let cDate = currentFormat.date(from: date){
        
            let reuiredFromat = DateFormatter()
            reuiredFromat.dateFormat = reuiredDateFromat
            
            return reuiredFromat.string(from: cDate)
            
        }
        return date
    }
    
    static func dateFromStrig(date:Date,reuiredDateFromat:String) -> String?{
        
        let reuiredFromat = DateFormatter()
        reuiredFromat.dateFormat = reuiredDateFromat
        return reuiredFromat.string(from: date)
        
    }
    
    static func dateFromStrig(date:String,currentDateFormat:String) -> Date?{
        
        let currentFormat = DateFormatter()
        currentFormat.dateFormat = currentDateFormat
        
        if let cDate = currentFormat.date(from: date){
        
            return cDate
        }
        return nil
    }
    
    
   static func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
    
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = NSDate()
        let earliest = now.earlierDate(date as Date)
        let latest = (earliest == now as Date) ? date : now
        let components = calendar.dateComponents(unitFlags, from: earliest as Date,  to: latest as Date)
        
        if (components.year! >= 2) {
            
            return "\(components.year!) years ago"
            
        } else if (components.year! >= 1){
            
            if (numericDates){
                
                return "1 year ago"
                
            } else {
                
                return "Last year"
            }
            
        } else if (components.month! >= 2) {
            
            return "\(components.month!) months ago"
            
        } else if (components.month! >= 1){
            
            if (numericDates){
                
                return "1 month ago"
                
            } else {
                
                return "Last month"
            }
            
        } else if (components.weekOfYear! >= 2) {
            
            return "\(components.weekOfYear!) weeks ago"
            
        } else if (components.weekOfYear! >= 1){
            
            if (numericDates){
                
                return "1 week ago"
                
            } else {
                
                return "Last week"
            }
            
        } else if (components.day! >= 2) {
            
            return "\(components.day!) days ago"
            
        } else if (components.day! >= 1){
            
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
            
        } else if (components.hour! >= 2) {
            
            return "\(components.hour!) hours ago"
            
        } else if (components.hour! >= 1){
            
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            
            return "\(components.minute!) minutes ago"
            
        } else if (components.minute! >= 1){
            
            if (numericDates){
                
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
            
        } else if (components.second! >= 3) {
            
            return "Just now"
            
        } else {
            
            return "Just now"
        }
    }
    
    //MARK: - Date Function
    
    class func dateStringTo12HourFormat(dateAsString:String?) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date12HourFormatter = DateFormatter()
        date12HourFormatter.dateFormat = "MMM dd, yyyy h:mm:ss a"
        
        if let dateAsString = dateAsString{
            
            let date1 = dateFormatter.date(from: dateAsString)
            
            if let  date1 = date1 {
                
                let date2 = date12HourFormatter.string(from: date1)
                
                if date2.isEmpty == false {
                    
                    return date2
                    
                }else{
                    
                    return dateAsString
                }
                
            }else{
                
                return dateAsString
            }
            
        }else{
            
            return ""
        }
        
    }
    
    class func dateStringToDefaultFormatDate(dateAsString:String?) -> String {
        
        let dateFormatter = DateFormatter()
        
        //Jul 04, 2017 06:58 PM
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date12HourFormatter = DateFormatter()
        
        date12HourFormatter.dateFormat = "MMM dd, yyyy"
        
        if let dateAsString = dateAsString{
            
            let date1 = dateFormatter.date(from: dateAsString)
            
            if let  date1 = date1 {
                
                let date2 = date12HourFormatter.string(from: date1)
                
                if date2.isEmpty == false {
                    
                    return date2
                    
                }else{
                    
                    return dateAsString
                }
                
            }else{
                
                return dateAsString
            }
            
        }else{
            
            return ""
        }
    }
    
    class func getLastPath(path:String?) -> String? {
        
        if let path = path {
            
            if path.isEmpty == false{
            
                let url = URL(fileURLWithPath: path)
                return url.lastPathComponent
            }
        }
        return nil
    }
}

extension String {
    
    
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size.height
    }
    
    func htmlToNormal(fontSize:Int) -> NSAttributedString {
        
        let modifiedFont = NSString(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(fontSize)\">%@</span>" as NSString, self) as String
        
        return try! NSAttributedString(
            
            data: modifiedFont.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSFontAttributeName:UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)],
            documentAttributes: nil)
    }
}


class Colors {
    
    var gl:CAGradientLayer!
    
    init() {
        
        let colorTop = ThemeManager.setThemeColor(appColor: .navigation).cgColor
        
        let colorBottom = ThemeManager.setThemeColor(appColor: .navigation).cgColor
        
        self.gl = CAGradientLayer()
        
        self.gl.colors = [colorTop, colorBottom]
        
        self.gl.locations = [0.0, 1.0]
        
    }
}

extension UIColor {
    
    convenience init(hexString: String) {
        
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        var int = UInt32()
        
        Scanner(string: hex).scanHexInt32(&int)
        
        let a, r, g, b: UInt32
        
        switch hex.characters.count {
            
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension String {
    
    func trim() -> String {
        
        return components(separatedBy: .whitespaces).joined()
    }
}
