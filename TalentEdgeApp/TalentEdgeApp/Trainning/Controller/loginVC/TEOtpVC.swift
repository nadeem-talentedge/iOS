//
//  TEOtpVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 03/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import NVActivityIndicatorView

class TEOtpVC: BCUIViewController {

    @IBOutlet weak var txtOTP: SkyFloatingLabelTextField!
    @IBOutlet weak var lblMobileNUmber: BCUILabel!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var btnEditMobileNUmber: BCUIButton!
    @IBOutlet weak var btnSumit: BCUIButton!
    @IBOutlet weak var btnResendCode: BCUIButton!
    @IBOutlet weak var imgLogo: BCUIImageView!
    
    var mobileNumber:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        self.lblMobileNUmber.setText(text: self.mobileNumber)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(true)
        //self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func resendOTPButtonDidClick(sender:UIButton){
        
        if let mobileNumber = self.mobileNumber{
        
            let bodyParam : NSMutableDictionary = NSMutableDictionary()
            bodyParam["mobile_no"] = mobileNumber
            self.callWebserviceForGenerateOTP(bodyParam: bodyParam, headerParam: nil)
        }
        
    }
    
    @IBAction func submitButtonDidClick(sender:UIButton){
    
        if let mobileNumber = self.mobileNumber{
        
            if self.validate(){
                
                let body : NSMutableDictionary = NSMutableDictionary()
                body["login_type"] = "2"
                
                let headerParam : NSMutableDictionary = NSMutableDictionary()
                
                headerParam["username"] = mobileNumber
                headerParam["password"] = self.txtOTP.text
                
                self.callWebserviceForLogin(paramDic:body, requestHeader: headerParam)
            }
        }
        
    }
    
    @IBAction func editButtonDidClick(sender:UIButton){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func validate() -> Bool {
        
        if let text = self.txtOTP.text{
        
            if text.characters.count != 6{
        
                Utility.showAlert(message: "Please enter 6 digit OTP number", title: AppName, actions: nil, controller: self)
                
                return false
            }
        }
        return true
    }
}

//MARK:- UITextField Delegate

extension TEOtpVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
}

//MARK:- Server Call

extension TEOtpVC{
    
    func callWebserviceForGenerateOTP(bodyParam:NSMutableDictionary? ,headerParam:NSMutableDictionary?) {
        
        self.startAnimating()
        
        NetworkManager.httpPostRequest(.generateLoginOtp, dataParam: bodyParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("OTP : ------> ",data ?? "Generate Login OTP");
            
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
        
        NetworkManager.httpPostRequest(.loginUser, dataParam: paramDic, requestHeader: requestHeader, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Login : ------> ",data ?? "Login Error");
            
            if let data = data{
                
                if let isSuccess = data.value(forKey: "status") as? Bool{
                    
                    if isSuccess == true{
                        
                        Utility.saveUserDetail(loginUser: LoginBase(object: data))
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let home = storyboard.instantiateViewController(withIdentifier: Utility.ID_AppHome) as! TEAppHomeVC
                        
                        let navigationController = BCUINavigationController(rootViewController: home)
                        
                        let mainViewController = TEMenuManager()
                        mainViewController.rootViewController = navigationController
                        mainViewController.setup(type: UInt(2))
                        
                        self.navigationController?.navigationBar.isHidden = true
                        self.navigationController?.pushViewController(mainViewController, animated: true)
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
                
                Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
            }
            self.stopAnimating()
            
            
        } )
    }
}
