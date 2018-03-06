//
//  TEReferAndEarnVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 17/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEReferAndEarnVC: UIViewController {

    @IBOutlet weak var lblYourCode: BCUILabel!
    @IBOutlet weak var lblDetail: BCUILabel!
    var baseViewController:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblYourCode.setText(text: Utility.getLoginUserDetail()?.resultData?.user?.userId)
        self.lblDetail.setText(text: "Help your friends succed in their career.\n Refer them to us and win prizes or \n vouchers on every successful enrolment")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnExport(sender: AnyObject)
    {
        let someText:String = "Hey checkout Talentedge Mobile App, and register using unique code '\(Utility.getLoginUserDetail()?.resultData?.user?.userId ?? "")'"
        let sharedObjects:[AnyObject] = [someText as AnyObject]
        let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook,UIActivityType.postToTwitter]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}
