//
//  ANCommentsVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 06/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import NextGrowingTextView
import IQKeyboardManagerSwift

protocol ANCommentsVCDelegate {

    func updateUI(indexPath:IndexPath?,commentCount:String) -> Void
}

class ANCommentsVC: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    @IBOutlet weak var growingTextView: NextGrowingTextView!
    @IBOutlet weak var inputContainerView: BCView!
    @IBOutlet weak var inputContainerViewBottom: NSLayoutConstraint!
    
    var delegate:ANCommentsVCDelegate?
    
    var commentModel:CommentModel?
    
    var indexPath:IndexPath?
    var contentID:String?
    var contentType:String?
    
    var temlplatesVC:TETemplatesVC?
    var keyBoardFrame:CGRect?
    
    let placeholderText = "Write your comment here"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.setTitle(title: "Comments")
        
        self.setupGrowingTextView()
        self.registerCellWithTableView()
        self.callWebserviceForComments()
        // Do any additional setup after loading the view.
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
        
        if let delegate = self.delegate {
            
            if let message = self.commentModel?.resultData{
            
                delegate.updateUI(indexPath: indexPath, commentCount: "\(message.count)")
                
            }else{
            
                delegate.updateUI(indexPath: indexPath, commentCount: "0")
            }
        }
    }
}

//MARK:- User Define

extension ANCommentsVC{

    func setupGrowingTextView() -> Void {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ANCommentsVC.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ANCommentsVC.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
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

extension ANCommentsVC {

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

extension ANCommentsVC:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let model = self.commentModel{
        
            if let result = model.resultData{
            
                if result.count > 0{
                    
                    self.tableView.backgroundView = nil
                    return 1
                    
                } else{
                
                    self.tableView.backgroundView = Utility.nodataFoundView(title:"No Comments to show!")
                    return 0
                }
                
            }else{
            
                //self.tableView.backgroundView = Utility.nodataFoundView(title:"No Comments to show!")
                return 0
            }
        
        }else{
        
            //self.tableView.backgroundView = Utility.nodataFoundView(title:"No Comments to show!")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let model = self.commentModel{
            
            if let result = model.resultData{
                
                return result.count
            }
        }
        return 0
    }
    
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 95
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(ANCommentHeaderCell.nibName, owner: self, options: nil)?[0] as! ANCommentHeaderCell;
        
        return view;
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ANCommentCell.reuseIdentifier, for: indexPath) as! ANCommentCell
        
        cell.delegate = self
        cell.indexPath = indexPath

        cell.setData(model: (self.commentModel?.resultData?[indexPath.row])!, baseUrl: self.commentModel?.aSSETSBASEURL)
        
       return cell
    }
}

//MARK: - Network Call

extension ANCommentsVC:ANCommentCellDelegate {

    func likeClick(indexPath: IndexPath?) {
        
        /*if let indexPath = indexPath{
        
        }*/
    }
    
    func replyClick(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.commentModel?.resultData?[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = ANReplyOnCommentVC(nibName: "ANReplyOnCommentVC", bundle: nil)
            vc.parentID = model?.id
            vc.contentType = self.contentType
            vc.contentID = self.contentID
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: - Network Call

extension ANCommentsVC {
    
    func callWebserviceForSendingComments(comment:String) {
        
        print("Content ID--------->",self.contentID ?? "NA")
        print("contentType ID--------->",self.contentType ?? "NA")
        
        if let contentID = self.contentID, let contentType = self.contentType {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["asset_id"] = contentID
            dicParam["asset_type"] = contentType
            dicParam["comment"] = comment
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.addWallComment, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Add Wala comment : ------> ",Utility.jsonToString(json: data) ?? "NA");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            self.growingTextView.textView.text = ""
                            
                            self.growingTextView.placeholderAttributedText = NSAttributedString(string: self.placeholderText,
                                                                                                attributes: [NSFontAttributeName: self.growingTextView.textView.font!,
                                                                                                             NSForegroundColorAttributeName: UIColor.gray
                                ])

                            self.callWebserviceForComments()
                        }
                    }
                }
                self.stopAnimating()
                
            })
            
        }else{
        
            print("--------------------Some Data Missing--------------------")
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
                           
                            self.commentModel = CommentModel(object: data)
                            
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
