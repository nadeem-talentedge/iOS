//
//  TEDiscussionChatVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 11/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import NextGrowingTextView
import IQKeyboardManagerSwift

class TEDiscussionChatVC: BCUIViewController {

    let placeholderText = "Write your comment here"
    
    @IBOutlet weak var growingTextView: NextGrowingTextView!
    @IBOutlet weak var inputContainerView: BCView!
    @IBOutlet weak var inputContainerViewBottom: NSLayoutConstraint!
    @IBOutlet weak var tableview: BCUITableView!
    
    var keyBoardFrame:CGRect?
    var arrOfComment = Array<CommentsChat>()
    var content_id : String?
    var discussion : DiscussionChat?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.setupGrowingTextView()
        self.registerCellWithTableView()
        self.callWebserviceForCommentList()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    

    func setupGrowingTextView() -> Void {
        
        NotificationCenter.default.addObserver(self, selector: #selector(TEDiscussionChatVC.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(TEDiscussionChatVC.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.growingTextView.textView.autocorrectionType = .no
        
        self.growingTextView.textView.returnKeyType = .default
        
        self.growingTextView.layer.cornerRadius = 0
        
        self.growingTextView.backgroundColor = UIColor.clear
        
        self.growingTextView.textView.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 8, right: 0)
        
        self.growingTextView.placeholderAttributedText = NSAttributedString(string: placeholderText,
                                                                            attributes: [NSFontAttributeName: self.growingTextView.textView.font!,
                                                                                         NSForegroundColorAttributeName: UIColor.gray
            ]
        )
    }
    
    func registerCellWithTableView() -> Void {
        
        self.tableview.registerCellWithTable(nibName: TEDiscussionChatLeftCell.nibName, reuseIdentifier: TEDiscussionChatLeftCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEDiscussionChatRightCell.nibName, reuseIdentifier: TEDiscussionChatRightCell.reuseIdentifier)
    }
    
    @IBAction func sendMessage(sender: UIButton) {
        
        let strComment = self.growingTextView.textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if strComment.isEmpty == false {
            
            self.view.endEditing(true)
            self.callWebserviceForSaveComment(comment: strComment)
        }
    }
    
    func scrollTableAtBottom(){
        
        if (self.arrOfComment.count-1) > 0{
        
            self.tableview.scrollToRow(at: IndexPath(row: (self.arrOfComment.count-1), section: 0), at: .bottom, animated: true)
        }
    }
}

//MARK:- Keyboard Notification

extension TEDiscussionChatVC {
    
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

extension TEDiscussionChatVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        let object = self.arrOfComment[indexPath.row]
        
        if object.createdBy == Utility.getLoginUserDetail()?.resultData?.user?.userId{
            
                return true
        }
        else{
            
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
                self.callWebserviceForDeleteComment(indexx : indexPath.row)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfComment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let object = self.arrOfComment[indexPath.row]
        
        if object.createdBy == Utility.getLoginUserDetail()?.resultData?.user?.userId{
            
            let cell : TEDiscussionChatRightCell = tableView.dequeueReusableCell(withIdentifier: TEDiscussionChatRightCell.reuseIdentifier) as! TEDiscussionChatRightCell
            
            cell.cellConfiguration(object: arrOfComment[indexPath.row])
            
            return cell
        }
        else{
            
            let cell : TEDiscussionChatLeftCell = tableView.dequeueReusableCell(withIdentifier: TEDiscussionChatLeftCell.reuseIdentifier) as! TEDiscussionChatLeftCell
            
            cell.cellConfiguration(object: arrOfComment[indexPath.row])
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}


//MARK: - Network Call

extension TEDiscussionChatVC {
    
    /*
     
     In Header token:XXXX
     In Data content_id:XX
     
     saveComment
     */
    
    func callWebserviceForCommentList() {
        
        if let content_id = self.content_id {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = content_id
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getCommentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Comment List : ------> ",data ?? "CommentList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                if let discussionDic = resultData.value(forKey: "discussion") as? NSDictionary{
                                    
                                    self.discussion = DiscussionChat(object: discussionDic)
                                    
                                    //self.setTitle(title: (self.discussion?.title)!)
                                }
                                
                                
                                if let commentData = resultData.value(forKey: "comments") as? NSArray{
                                    
                                    self.arrOfComment.removeAll()
                                    
                                    for dict in commentData{
                                        self.arrOfComment.append(CommentsChat(object:dict))
                                    }
                                
                                    self.tableview.reloadData()
                                    self.scrollTableAtBottom()
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
            
        }else{
            
            Utility.showAlert(message: "content id not available", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForSaveComment(comment : String) {
        
        if let content_id = self.content_id {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = content_id
            dicParam["comment"] = comment
            
            let headerParam = NSMutableDictionary()
            
           // self.startActivityAnimating()
            
            NetworkManager.httpPostRequest(.saveComment, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("save Comment : ------> ",data ?? "save Comment Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            
                            let dicComment  =  NSMutableDictionary()
                            dicComment["created"] = data.value(forKey: "created")
                            dicComment["id"] = data.value(forKey: "id")
                            dicComment["comment"] = data.value(forKey: "comment")
                            
                            dicComment["created_by"] = Utility.getLoginUserDetail()?.resultData?.user?.userId
                            dicComment["created_by_name"] = Utility.getLoginUserDetail()?.resultData?.user?.username
                            dicComment["pic"] = Utility.getLoginUserDetail()?.resultData?.user?.avtarUrl
                            dicComment["user_role"] = ""
                            
                            self.growingTextView.textView.text = nil
                            self.arrOfComment.append(CommentsChat(object: dicComment))
                            self.tableview.reloadData()
                            self.scrollTableAtBottom()
                            
                            
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
            
            Utility.showAlert(message: "content id not available", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    /*
     
     In Header token:XXXX
     In Data comment_id:XX
     
     */
    
    func callWebserviceForDeleteComment(indexx : Int) {
        
       let comment =  self.arrOfComment[indexx]
        
        if let comment_id = comment.id {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["comment_id"] = comment_id
            
            
            let headerParam = NSMutableDictionary()
            
            //self.startActivityAnimating()
            
            NetworkManager.httpPostRequest(.deleteComment, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("delete Comment : ------> ",data ?? "delete Comment Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                        self.arrOfComment.remove(at: indexx)
                        self.tableview.reloadData()
                            
                                
                           
                            
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
            
            Utility.showAlert(message: "content id not available", title: AppName, actions: nil, controller: self)
        }
        
    }
}
