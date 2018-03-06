//
//  TELoginVC.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 20/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import IQKeyboardManagerSwift

class TELoginVC: BCUIViewController {
    
    @IBOutlet weak var USERNAME: BCTextField!
    @IBOutlet weak var PASSWORD: BCTextField!
    @IBOutlet weak var btnForgotPass: BCUIButton!
    @IBOutlet weak var btnLogin: BCUIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        AppDelegate.sharedDeleagte().baseNavigationController = self.navigationController
        
        #if DEBUG
            
            //USERNAME.text = "aditya_teacher"
            //PASSWORD.text = "password"
            
            USERNAME.text = "Ashutosh"
            PASSWORD.text = "123456"
            
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        IQKeyboardManager.sharedManager().toolbarPreviousNextAllowedClasses = [UIStackView.self, UIView.self]
        
        self.navigationController?.isNavigationBarHidden = true
        self.checkForAutoLogin()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        //self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- User Define
    func checkForAutoLogin() -> Void {
        
        if let detail = Utility.getLoginUserDetail(){
            
            print("------>",detail.token ?? "NA")
            self.navigateToHomePage()
            
        }
    }
    
    @IBAction func showPasswordDidClick(_ sender: UIButton) {
        
        if sender.isSelected == true{
            
            sender.isSelected = false
            PASSWORD.isSecureTextEntry = true
            
        }else{
            
            sender.isSelected = true
            PASSWORD.isSecureTextEntry = false
        }
    }
    
    @IBAction func OTPLoginDidClick(sender:BCUIButton) {
        
        let vc = TEMobileNumberVC(nibName: "TEMobileNumberVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- NAvigation

extension TELoginVC{
    
    func navigateToHomePage() -> Void {
        
        if let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let type = appInfo[0].type{
                    
                    switch(type){
                        
                    case "LMS":
                        
                        if self.isTeacherLogin() == true{
                           
                            self.sliqFacultyNagigation()
                            
                        }else{
                           
                            self.defaultNagigation()
                            //self.sliqStudentNagigation()
                        }
                        break;
                        
                    case "ULS":
                        self.ulsNagigation()
                        break;
                        
                    default:
                        self.defaultNagigation()
                        break
                    }
                    
                }else{
                    
                    self.defaultNagigation()
                }
            }else{
                
                self.defaultNagigation()
            }
            
        }else{
            
            self.defaultNagigation()
        }
    }
    
    func defaultNagigation() -> Void {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let home = storyboard.instantiateViewController(withIdentifier: Utility.ID_AppHome) as! TEAppHomeVC
        
        let navigationController = BCUINavigationController(rootViewController: home)
        
        let mainViewController = TEMenuManager()
        
        mainViewController.rootViewController = navigationController
        
        mainViewController.setup(type: UInt(2))
        
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func sliqStudentNagigation() -> Void {
        
        let vc = TEDashboardVC(nibName: "TEDashboardVC", bundle: nil)
        
        let navigationController = BCUINavigationController(rootViewController: vc)
        
        let mainViewController = TEMenuManager()
        
        mainViewController.rootViewController = navigationController
        
        mainViewController.setup(type: UInt(2))
        
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func sliqFacultyNagigation() -> Void {
        
        let vc = TETeacherDashboardVC(nibName: "TETeacherDashboardVC", bundle: nil)
        
        
        let navigationController = BCUINavigationController(rootViewController: vc)
        
        let mainViewController = TEMenuManager()
        
        mainViewController.rootViewController = navigationController
        
        mainViewController.setup(type: UInt(2))
        
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func ulsNagigation() -> Void {
        
        let vc = TECourseListVC(nibName: "TECourseListVC", bundle: nil)
        
        let navigationController = BCUINavigationController(rootViewController: vc)
        
        let mainViewController = TEMenuManager()
        
        mainViewController.rootViewController = navigationController
        
        mainViewController.setup(type: UInt(2))
        
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}

//MARK:- Login
extension TELoginVC{
    
    @IBAction func loginDidClick(sender:BCUIButton) {
        
        let body : NSMutableDictionary = NSMutableDictionary()
        body["login_type"] = "1"
        
        let headerParam : NSMutableDictionary = NSMutableDictionary()
        
        headerParam["deviceType"] = "IOS"
        headerParam["deviceId"] = UserDefaults.standard.value(forKey: "token")
        headerParam["username"] = USERNAME.text
        headerParam["password"] = PASSWORD.text
        
        callWebserviceForLogin(paramDic:nil, requestHeader: headerParam)
    }
    
    func validateForm() -> Bool {
        
        if TEValidation.isValidatedName(USERNAME.text!).characters.count > 0{
            
            Utility.showAlert(message: "Username is not correct", title: AppName, actions: nil, controller: self)
            
            return false
            
        }else if (PASSWORD.text?.characters.count)! < 5 {
            
            
            Utility.showAlert(message: "password should be minimum 5 characters", title: AppName, actions: nil, controller: self)
            
            return false
        }
        return true
        
    }
}


//MARK:- Forgot Password

extension TELoginVC{
    
    @IBAction func help(_ sender: UIButton) {
        
        /*self.navigationController?.navigationBar.isHidden = false
        let vc = TEWebView(nibName: "TEWebView", bundle: nil)
        vc.pageType = .help
        self.navigationController?.pushViewController(vc, animated: true)*/
    }
    
    @IBAction func forgotPassDidClick(_ sender: UIButton) {
        
        let vc = TEMobileNumberVC(nibName: "TEMobileNumberVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        //self.forgotPasswordAlert()
    }
    
    func forgotPasswordAlert() -> Void {
        
        var inputTextField: UITextField?
        
        let altForgot = UIAlertController(title: AppName, message:"Please Enter mail Id", preferredStyle: .alert)
        
        altForgot.addTextField { textField -> Void in
            // you can use this text field
            inputTextField = textField
        }
        
        
        /*****OK Action******/
        altForgot.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction)in
            
            print(inputTextField?.text ?? "Error")
            
            let paramParam : NSMutableDictionary = NSMutableDictionary()
            paramParam["email"] = inputTextField?.text
            
            let headerParam : NSMutableDictionary = NSMutableDictionary()
            
            self.callWebserviceForForgotPassword(paramDic: paramParam, requestHeader: headerParam)
            
        }))
        
        altForgot.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (UIAlertAction)in
            
            altForgot.dismiss(animated: true, completion: nil)
        }))
        
        self.present(altForgot, animated: true, completion: nil)
    }
    
}

//MARK:- UITextField Delegate

extension TELoginVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        
        textField.resignFirstResponder()
        return true
    }
    
}

//MARK:- Server Call

extension TELoginVC{
    
    func callWebserviceForForgotPassword(paramDic:NSMutableDictionary? ,requestHeader:NSMutableDictionary) {
        
        
        self.startAnimating()
        
        NetworkManager.httpPostRequest(.forgotPassword, dataParam: paramDic, requestHeader: requestHeader, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Forgot Password : ------> ",data ?? "Forgot Password");
            
            if let data = data{
                
                if let message = data.value(forKey: "message") as? String{
                    
                    
                    Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                    
                }
                else{
                    
                    
                    Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                }
            }
            self.stopAnimating()
        } )
    }
    
    func callWebserviceForLogin(paramDic:NSMutableDictionary? ,requestHeader:NSMutableDictionary) {
        
        self.startAnimating()
        
        NetworkManager.loginRequest(dataParam: paramDic, requestHeader: requestHeader, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            if let data = data{
                
                print("Login : ------> ",data.string() ?? "NA");
                
                if let isSuccess = data.value(forKey: "status") as? Bool{
                    
                    if isSuccess == true{
                        
                        Utility.saveUserDetail(loginUser: LoginBase(object: data))
                        self.navigateToHomePage()
                    }
                        
                    else{
                        
                        if let message = data.value(forKey: "message")  as? String {
                            
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }else{
                            
                        }
                    }
                    
                }
                else{
                    
                    Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                }
            }else{
                
                //print("Login : ------> ",error ?? "");
                
                Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
            }
            self.stopAnimating()
            
        } )
    }
}


