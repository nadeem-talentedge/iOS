//
//  Utility.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class Utility: NSObject {
    

    //MARK:- Storyboard Ids

    static let lightGrayColor : UIColor = (UIColor(red: 121.0/255.0, green: 121.0/255.0, blue: 121.0/255.0, alpha: 1.0))
    
    static let ID_HomeVC = "ID_HomeVC"
    static let ID_DashBoardVC = "ID_TEDashboardVC"
    static let ID_AppHome = "ID_TEAppHomeVC"
    static let ID_ModuleVC = "ID_TEModuleVC"
    static let ID_TEContentVC = "ID_TEContentVC"
    static let ID_TEAssignmentDetailVC = "ID_TEAssignmentDetailVC"
    static let ID_TEQuizVC = "ID_TEQuizVC"
    static let ID_TELecturerDetailVC = "ID_TELecturerDetailVC"
    static let ID_TELiveClassVC = "ID_TELiveClassVC"
    static let ID_TEPDFReaderVC = "ID_TEPDFReaderVC"
    static let ID_TEAssesmentVC = "ID_TEAssesmentVC"
    static let ID_TEAssignmentsVC = "ID_TEAssignmentsVC"
    static let ID_TEOverViewVC = "ID_TEOverViewVC"
    static let ID_TELernersVC = "ID_TELernersVC"
    static let ID_TELeftMenuVC = "ID_TELeftMenuVC"
    static let ID_TELoginVC = "ID_TELoginVC"
    static let ID_TEAssessmentDetailVC = "ID_TEAssessmentDetailVC"
    static let ID_TEUserProfileVC = "ID_TEUserProfileVC"
    static let ID_TEDiscussionListVC = "ID_TEDiscussionListVC"
    static let ID_TETestimonialsVC = "ID_TETestimonialsVC"
    static let ID_TEQuizChildVC = "ID_TEQuizChildVC"
    static let ID_TEDiscussionChatVC = "ID_TEDiscussionChatVC"
    static let ID_TEAddTestimonialVC = "ID_TEAddTestimonialVC"
    static let ID_TEAttendanceVC = "ID_TEAttendanceVC"
    static let ID_TEModulePlannerVC = "ID_TEModulePlannerVC"
    
    //MARK:- Storyboard Name
    
    static let STORYBOARD_TRAINING = "Main"
    static let STORYBOARD_Announcement = "Announcement.storyboard"
    
    //MARK:- Place Holder Images Name
    static let PLACEHOLDER_PROFILE = "man-user"
    
    
    
    
    
    //MARK:- Static Function
    
    class func checkForNull(value:Any?) -> String{
        
        if let value = value{
            
            if value is String {
                
                return value as! String
                
            }
            else{
                
                return "NA"
            }
            
        }else{
            
            return "NA";
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
    
    
    /*-(void)saveCustomObject:(Player *)object
    {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    [prefs setObject:myEncodedObject forKey:@"testing"];
    }
    
    -(Player *)loadCustomObjectWithKey:(NSString*)key
    {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [prefs objectForKey:key ];
    Player *obj = (Player *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return obj;
    }*/
    
    //MARK:- Alert Controller
    
    static func showAlert(message: String?, title: String?, actions: [UIAlertAction]?, controller: UIViewController!) {
        
        DispatchQueue.main.async( execute: {
            
            var displayMessage: String? = message
            var displayTitle: String? = title
            
            if message == nil{
                displayMessage = "Test Message"
            }
            
            if title == nil{
                displayTitle = "Talent Edge"
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
}
