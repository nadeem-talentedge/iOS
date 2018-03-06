//
//  TEMobileNumberVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 03/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import NVActivityIndicatorView

class TEMobileNumberVC: BCUIViewController {

    @IBOutlet weak var txtMobileNumber: BCTextField!
    @IBOutlet weak var txtTitle: BCUILabel!
    @IBOutlet weak var txtErrorMessage: BCUILabel!
    @IBOutlet weak var btnGenerateOtp: BCUIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitle(title: "Generate OTP")
        
        self.txtTitle.fontSize = .large
        self.txtTitle.fontType = .bold
        self.txtTitle.setTextColor = .text_heading
        
        self.txtErrorMessage.text = ""
        self.txtErrorMessage.fontSize = .large
        self.txtErrorMessage.fontType = .medium
        self.txtErrorMessage.setTextColor = .text_error_message
        
        self.txtMobileNumber.fontSize = .large
        self.txtMobileNumber.fontType = .light
        self.txtMobileNumber.setTextColor = .text_normal
        
        self.btnGenerateOtp.fontSize = .large
        self.btnGenerateOtp.fontType = .medium
        self.btnGenerateOtp.isThemeButton = true
        
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      
        super.viewWillDisappear(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func proceddButtonDidClick(sender:UIButton){
    
        if self.validate(){
        
            let bodyParam : NSMutableDictionary = NSMutableDictionary()
            bodyParam["mobile_no"] = self.txtMobileNumber.text
            self.callWebserviceForGenerateOTP(bodyParam: bodyParam, headerParam: nil)
        }
    }
    
    func validate() -> Bool {
        
        if TEValidation.phoneNumberValidation(self.txtMobileNumber.text!).characters.count > 0{
            
            Utility.showAlert(message: "Please enter valid mobile number", title: AppName, actions: nil, controller: self)
            
            return false
        }
        return true
    }
}

//MARK:- UITextField Delegate

extension TEMobileNumberVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}

//MARK:- Server Call

extension TEMobileNumberVC{

    func callWebserviceForGenerateOTP(bodyParam:NSMutableDictionary? ,headerParam:NSMutableDictionary?) {
        
        self.startAnimating()
        
        NetworkManager.httpPostRequest(.generateLoginOtp, dataParam: bodyParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("OTP : ------> ",data ?? "Generate Login OTP");
            
            if let data = data{
                
                if (data.value(forKey: "message") as? String) != nil{
                    
                    let vc = TEOtpVC(nibName: "TEOtpVC", bundle: nil)
                    vc.mobileNumber = self.txtMobileNumber.text
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                else{
                    
                    Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                }
            }
            self.stopAnimating()
        } )
    }
}
