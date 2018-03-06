//
//  ANDetailVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 08/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

import NextGrowingTextView
import IQKeyboardManagerSwift

enum DetailType {
    
    case BirthDay
    case Anniversary
    case Joinning
    case Award
    
}

class ANDetailVC: UIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    
    @IBOutlet weak var inputContainerView: BCView!
    
    @IBOutlet weak var inputContainerViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var growingTextView: NextGrowingTextView!
    
    var model:Any?
    var baseURL:String?
    var detailType:DetailType = .BirthDay
    
    var temlplatesVC:TETemplatesVC?
    var keyBoardFrame:CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupGrowingTextView()
        self.registerCellWithTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
    }
    

}

//MARK:- User Define

extension ANDetailVC{
    
    func setupGrowingTextView() -> Void {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ANCommentsVC.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ANCommentsVC.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.growingTextView.textView.autocorrectionType = .no
        
        self.growingTextView.layer.cornerRadius = 0
        
        self.growingTextView.backgroundColor = UIColor.clear
        
        self.growingTextView.textView.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 8, right: 0)
        
        self.growingTextView.placeholderAttributedText = NSAttributedString(string: "Type your comment here",
                                                                            attributes: [NSFontAttributeName: self.growingTextView.textView.font!,
                                                                                         NSForegroundColorAttributeName: UIColor.gray
            ]
        )
    }
    
    func registerCellWithTableView() -> Void {
        
        self.tableView.registerCellWithTable(nibName: ANAnniversaryCell.nibName, reuseIdentifier: ANAnniversaryCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANAwardCell.nibName, reuseIdentifier: ANAwardCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANBirthdayCell.nibName, reuseIdentifier: ANBirthdayCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANJoiningCell.nibName, reuseIdentifier: ANJoiningCell.reuseIdentifier)
    
    }
    
    @IBAction func cameraDidSelect(sender:BCUIButton) -> Void{
        
    }
    
    @IBAction func cloudDidSelect(sender:BCUIButton) -> Void{
        
        if sender.isSelected == false{
            
            sender.isSelected = true
            
            if self.temlplatesVC == nil{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                self.temlplatesVC = storyboard.instantiateViewController(withIdentifier: Utility.ID_TETemplatesVC) as? TETemplatesVC
            }
            
            
            if let temlplatesVC = self.temlplatesVC{
                
                if let keyBoardFrame = self.keyBoardFrame{
                    
                    temlplatesVC.view.frame = keyBoardFrame
                    self.growingTextView.inputView = temlplatesVC.view
                    self.growingTextView.reloadInputViews()
                }
            }
            
        }else{
            
            sender.isSelected = false
            self.growingTextView.inputView = nil
            self.growingTextView.reloadInputViews()
        }
    }
}

//MARK:- Keyboard Notification

extension ANDetailVC {
    
    func keyboardWillHide(_ sender: Notification) {
        
        if let userInfo = (sender as NSNotification).userInfo {
            
            self.keyBoardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            
            if let _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
                
                //key point 0,
                self.inputContainerViewBottom.constant =  0
                //textViewBottomConstraint.constant = keyboardHeight
                UIView.animate(withDuration: 0.25, animations: { () -> Void in self.view.layoutIfNeeded() })
            }
        }
    }
    
    func keyboardWillShow(_ sender: Notification) {
        
        if let userInfo = (sender as NSNotification).userInfo {
            
            if let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
                
                self.inputContainerViewBottom.constant = keyboardHeight
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
}

//MARK:- TableView Delegate and DataSource

extension ANDetailVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.model is ANBirthdayModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANBirthdayCell.reuseIdentifier, for: indexPath) as! ANBirthdayCell
            
            cell.indexPath = indexPath
            //cell.delegate = self
            
            cell.setData(model: self.model as? ANBirthdayModel,baseURL: self.baseURL)
            return cell
            
        }else if model is ANAnniversaryModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANAnniversaryCell.reuseIdentifier, for: indexPath) as! ANAnniversaryCell
            
            cell.indexPath = indexPath
            //cell.delegate = self
            
            cell.setData(model: self.model as? ANAnniversaryModel,baseURL: self.baseURL)
            return cell
            
        }else if model is ANJoinningModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANJoiningCell.reuseIdentifier, for: indexPath) as! ANJoiningCell
            
            cell.indexPath = indexPath
            //cell.delegate = self
            
            cell.setData(model: self.model as? ANJoinningModel,baseURL: self.baseURL)
            return cell
            
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANAwardCell.reuseIdentifier, for: indexPath) as! ANAwardCell
            
            cell.indexPath = indexPath
            //cell.delegate = self
            
            cell.setData(model: self.model as? ANAwardModel,baseURL: self.baseURL)
            return cell
        }
    }
}
