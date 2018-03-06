//
//  AppDelegate.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

//https://docs.google.com/spreadsheets/d/1LjN3CgsKQNIj0Zj0GLABBX-KWUNIvxkOyJ62K0yJnYI/edit#gid=2050238882

import UIKit
import IQKeyboardManagerSwift
import UserNotifications
import NVActivityIndicatorView

@UIApplicationMain



class AppDelegate: UIResponder, UIApplicationDelegate {

    var appSettingModel:TEAppSettingModel?
    
    var window: UIWindow?
    var baseNavigationController:UINavigationController?

    class func sharedDeleagte() ->AppDelegate{
        
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        self.loadAppSettings()
        
        sleep(3)
        
        NVActivityIndicatorView.DEFAULT_COLOR = ThemeManager.setThemeColor(appColor: .navigation)
        
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().toolbarPreviousNextAllowedClasses = [UIStackView.self, UIView.self]
        
        //self.printFonts()
        
        self.registerAppForPushNotification(application:application)
        
        DispatchQueue.main.async {
        
            //Modifying rootViewController
            #if ELSA
                self.customLoadingForELSA()
                
            #elseif PVR
                self.customLoadingForELSA()
                
            #else
                self.customLoading()
                
            #endif
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate{
    
    func customLoading() -> Void{
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let userDefault = UserDefaults.standard
        
        if userDefault.value(forKey: "isTour") != nil{
            
            let nav = BCUINavigationController(rootViewController: TELoginVC(nibName: "TELoginVC", bundle: nil))
            self.window?.rootViewController = nav
            
        }else{
            
            let msgObj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TETourVC) as! TETourVC
            
            let nav = BCUINavigationController(rootViewController: msgObj)
            
            self.window?.rootViewController = nav
        }
    }
    
    func customLoadingForELSA() -> Void{
        
        let nav = BCUINavigationController(rootViewController: TELoginVC(nibName: "TELoginVC", bundle: nil))
        self.window?.rootViewController = nav
    }
    
    func printFonts() {
        
        let fontFamilyNames = UIFont.familyNames
        //let names = UIFont.fontNamesForFamilyName(familyName as! String)
        
        for familyName in fontFamilyNames {
            
            //if familyName == "HelveticaNeue"{
            
            print("------------------------------")
            
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
            
            print("------------------------------")
            //}
        }
    }

    func registerAppForPushNotification(application: UIApplication) -> Void {
        
        // iOS 10 support
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            application.registerForRemoteNotifications()
        }
            // iOS 9 support
        else if #available(iOS 9, *) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }

        else {
            application.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
        }
    }
    
    func loadAppSettings() -> Void {
    
        var plistName = "TalentEdgeSettings"
        
        #if ELSA
            plistName = "ELSASettings"
            
        #elseif PVR
            plistName = "PVRSetting"
            
        #else
            plistName = "TalentEdgeSettings"
            
        #endif
            
        if let fileUrl = Bundle.main.url(forResource: plistName, withExtension: "plist"),
            
            let data = NSDictionary(contentsOf: fileUrl) {
            self.appSettingModel = TEAppSettingModel(object: data)
            
        }
    }

}

extension AppDelegate{

    // Called when APNs has assigned the device a unique token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        // Convert token to string
        
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        
        UserDefaults.standard.setValue(deviceTokenString, forKey: "token")
        UserDefaults.standard.synchronize()
        print("APNs device token----------------------: \(deviceTokenString)")
        
        // Persist it in your backend in case it's new
    }
    
    // Called when APNs failed to register the device for push notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // Print the error to console (you should alert the user that registration failed)
        print("APNs registration failed: \(error)")
    }
    
    
    // Push notification received
    func application(_ application: UIApplication, didReceiveRemoteNotification data: [AnyHashable : Any]) {
        // Print notification payload data
        print("Push notification received: \(data)")
    }
    
}




