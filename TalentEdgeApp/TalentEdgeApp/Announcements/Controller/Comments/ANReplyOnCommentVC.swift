//
//  ANReplyOnCommentVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 06/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import NextGrowingTextView
import IQKeyboardManagerSwift

class ANReplyOnCommentVC: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    @IBOutlet weak var inputContainerView: BCView!
    @IBOutlet weak var inputContainerViewBottom: NSLayoutConstraint!
    @IBOutlet weak var growingTextView: NextGrowingTextView!
    var commentModel:CommentModel?
    var reply: [Reply]?
    var contentID:String?
    var parentID:String?
    var contentType:String?
    
    var temlplatesVC:TETemplatesVC?
    var keyBoardFrame:CGRect?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.setTitle(title: "Reply")
        self.setupGrowingTextView()
        self.registerCellWithTableView()
        callWebserviceForComments()
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

extension ANReplyOnCommentVC{

    func setupGrowingTextView() -> Void {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ANReplyOnCommentVC.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ANReplyOnCommentVC.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.growingTextView.textView.autocorrectionType = .no
        
        self.growingTextView.textView.returnKeyType = .send
        
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
        
        self.tableView.backgroundColor = UIColor.white
        self.tableView.registerCellWithTable(nibName: ANCommentCell.nibName, reuseIdentifier: ANCommentCell.reuseIdentifier)
    }

    @IBAction func cameraDidSelect(sender:BCUIButton) -> Void{
    
    }
    
    @IBAction func cloudDidSelect(sender:BCUIButton) -> Void{
        
        self.callWebserviceForSendingComments(comment: self.growingTextView.textView.text)
        self.view.endEditing(true)
    }
}

//MARK:- Keyboard Notification

extension ANReplyOnCommentVC {

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

extension ANReplyOnCommentVC:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.reply != nil{
        
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let model = self.reply{
        
            return model.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ANCommentCell.reuseIdentifier, for: indexPath) as! ANCommentCell
        
        //cell.delegate = self
        cell.indexPath = indexPath
        
        cell.setReplyData(model: self.reply?[indexPath.row], baseUrl: self.commentModel?.aSSETSBASEURL)
        
        return cell
    }
}

//MARK: - Network Call

extension ANReplyOnCommentVC {
    
    func callWebserviceForSendingComments(comment:String) {
        
        if let parentID = self.parentID,let contentID = self.contentID, let contentType = self.contentType {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["parent_id"] = parentID
            dicParam["asset_id"] = contentID
            dicParam["asset_type"] = contentType
            dicParam["comment"] = comment
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.addWallComment, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Add Wala comment : ------> ",Utility.jsonToString(json: data) ?? "NA");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            self.callWebserviceForComments()
                        }
                    }
                }
                self.stopAnimating()
            })
        }
    }
    
    func callWebserviceForComments() {
        
        if let contentID = self.contentID {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["asset_id"] = contentID
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.listWallComment, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Comment List : ------> ",Utility.jsonToString(json: data) ?? "NA");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                          
                            if let parentID = self.parentID,let contentID = self.contentID{
                            
                                print("--------->",parentID,contentID)
                                self.commentModel = CommentModel(object: data)
                                
                                if let resultData = self.commentModel?.resultData{
                                    
                                    let filter = resultData.filter{$0.assetId == contentID && $0.id == parentID }
                                    
                                    if filter.count > 0 {
                                    
                                        let model = filter[0]
                                        self.reply = model.reply
                                    }
                                }
                            }
                        }
                    }
                }
                self.stopAnimating()
                self.tableView.reloadData {
                }
            })
        }
    }
}
