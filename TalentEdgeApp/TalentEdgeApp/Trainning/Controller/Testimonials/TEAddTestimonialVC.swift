//
//  TEAddTestimonialVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 12/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEAddTestimonialVC: BCUIViewController {

    @IBOutlet weak var txtVWTestimonial: BCUITextView!
    @IBOutlet weak var lblUserName: BCUILabel!
    @IBOutlet weak var imgUser: BCUIImageView!
    
    var batchID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgUser.setImageFromUrl(url: Utility.getLoginUserDetail()?.resultData?.user?.avtarUrl,placeHolder: Utility.PLACEHOLDER_PROFILE)
        
        self.lblUserName.setText(text: Utility.getLoginUserDetail()?.resultData?.user?.username)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func publish_Click(_ sender: UIButton) {
       
        
        let strTestimonial = txtVWTestimonial.text.trimmingCharacters(in: .whitespacesAndNewlines)
        
            if strTestimonial.characters.count > 0 {
               
                self.view.endEditing(true)
                self.callWebserviceForAddTestimonial()
            }
            
    }
    
    @IBAction func cross_Click(_ sender: UIButton) {
        
        AppDelegate.sharedDeleagte().baseNavigationController?.dismiss(animated: true, completion: {
            
        })
    }

}

extension TEAddTestimonialVC : UITextViewDelegate{

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}



//MARK: - Network Call

extension TEAddTestimonialVC {
    
    /*
     In Header token:XXXX
     In Data 
     batch_id:XX 
     description:XXX 
     file: (optional)
     */
    
    func callWebserviceForAddTestimonial() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            dicParam["description"] = txtVWTestimonial.text
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.testimonialAdd, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("AddTestimonial  : ------> ",data ?? "AddTestimonial Error");
                //{"status":1,"message":"Added successfully.","id":"31","code":100}
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            self.txtVWTestimonial.text = ""
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                            
                        }else{
                            
                            
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }
                    else{
                        
                        
                        
                        Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
        
        
    }
}
