//
//  TESubmitGraph.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 03/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TESubmitGraphDelegate {
    
    func reattemptButtonDidClick(sender:BCUIButton) -> Void
    func reviewButtonDidClick(sender:BCUIButton) -> Void
}

class TESubmitGraph: BCUIViewController {

    var delegate:TESubmitGraphDelegate?
    
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    @IBOutlet weak var lblTotalQuestionTop: BCUILabel!
    
    @IBOutlet weak var lblYourScore: BCUILabel!
    @IBOutlet weak var lblTimeTaken: BCUILabel!
    @IBOutlet weak var lblTimeLimitTop: BCUILabel!
    
    @IBOutlet weak var lblAssesmentType: BCUILabel!
    @IBOutlet weak var lblTotalMarks: BCUILabel!
    @IBOutlet weak var lblTotalQuestionBottom: BCUILabel!
    @IBOutlet weak var lblTimeLimitBottom: BCUILabel!
    
    @IBOutlet weak var btnReAttempt: BCUIButton!
    @IBOutlet weak var btnReview: BCUIButton!
    
    var certificatePath:String?
    var contentName:String?
    var contentId:String?
    var totalTime:String?
    var totalTimeTaken:String?
    var myScore:String?
    var totalQuestion:String?
    var totalAttempt:String?
    var totalMarks:String?
    var assessmentType:String?
    var percentage = 0.0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.getCertificate()
        //Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        if let contentName = self.contentName{
            
            self.setTitle(title: contentName)
        }
        
        self.progressView.value = CGFloat(self.percentage)
        
        self.lblTotalQuestionTop.setText(text: "Total Questions \((self.totalQuestion ?? ""))")
        
        self.lblYourScore.setText(text:"Your Score : \((self.myScore ?? "0"))")
        self.lblTimeTaken.setText(text:"Time Taken : \((self.totalTimeTaken ?? ""))")
        self.lblTimeLimitTop.setText(text:"Time Limit : \((self.totalTime ?? ""))")
        
        self.lblAssesmentType.setText(text: self.assessmentType)
        self.lblTotalQuestionBottom.setText(text: self.totalQuestion)
        self.lblTotalMarks.setText(text: self.totalMarks)
        self.lblTimeLimitBottom.setText(text: self.totalTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //Dispose of any resources that can be recreated.
    }
    
    @IBAction func reattemptButtonDidClick(sender:BCUIButton) -> Void{
        
        if let delegate = self.delegate{
            
            delegate.reattemptButtonDidClick(sender: sender)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func reviewButtonDidClick(sender:BCUIButton) -> Void{
        
        if let delegate = self.delegate{
            
            delegate.reviewButtonDidClick(sender: sender)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func openCertificate(sender:BCUIButton) -> Void{
        
        if let path = self.certificatePath{
            
            if path.isEmpty == false{
             
                self.callServiceForDownloadingFile(path: self.certificatePath)
                
            }else{
            
            }
            
        }else{
            
        }
    }
}

//MARK: - Network Call

extension TESubmitGraph {
    
    func getCertificate() {
        
        if let moduleID = self.contentId {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.completedTest, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Complete Test : ------> ",data ?? "Start Test Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                if let studentResult = resultData.value(forKey: "studentResult") as? NSDictionary {
                                
                                    if let certificate_path  = studentResult.value(forKey: "certificate_path") as? String{
                                    
                                        self.certificatePath = certificate_path
                                        print("certificate_path :",certificate_path)
                                        
                                    }else{
                                        
                                    }
                                    
                                }
                                
                            }
                            
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
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
}
