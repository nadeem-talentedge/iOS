//
//  TESubmitInfoVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 03/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TESubmitInfoVCDelegate {
    
    func submitButtonDidClick(sender:BCUIButton) -> Void
    func cancelButtonDidClick(sender:BCUIButton) -> Void
}

class TESubmitInfoVC: BCUIViewController {

    @IBOutlet weak var lblTotalQuestions: BCUILabel!
    @IBOutlet weak var lblTotalAttempts: BCUILabel!
    @IBOutlet weak var lblTimeTaken: BCUILabel!
    
    @IBOutlet weak var btnSubmit: BCUIButton!
    @IBOutlet weak var btnCancel: BCUIButton!
    
    var delegate:TESubmitInfoVCDelegate?
    var totalQuestion:String?
    var totalAttmpt:String?
    var totalTime:String?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.lblTotalQuestions.setText(text: self.totalQuestion)
        
        self.lblTotalAttempts.setText(text: self.totalAttmpt)
        
        self.lblTimeTaken.setText(text: self.totalTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func submitButtonDidClick(sender:BCUIButton) -> Void{
    
        if let delegate = self.delegate{
        
            delegate.submitButtonDidClick(sender: sender)
        }
        
    }
    
    @IBAction func cancelButtonDidClick(sender:BCUIButton) -> Void{
     
        if let delegate = self.delegate{
            
            delegate.cancelButtonDidClick(sender: sender)
        }
        
        
    }
}
