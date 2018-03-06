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

class ANEventDetailVC: UIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    
    var baseURL:String?
    var eventModel:ANEventModel?
    var temlplatesVC:TETemplatesVC?
    var keyBoardFrame:CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Register Celll With Table
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

extension ANEventDetailVC : ANCommentsVCDelegate{

    func likePost(indexPath:IndexPath?,contentID:String?) -> Void {
        
        self.callWebserviceForLikePost(indexPath: indexPath, contentID: contentID)
    }
    
    func openCommentView(indexPath:IndexPath?) -> Void {
        
        let messageController = ANCommentsVC(nibName: "ANCommentsVC", bundle: nil)
        
        if let model = self.eventModel{
            
            messageController.indexPath = indexPath
            messageController.delegate = self
            messageController.contentType = model.contentTypeId
            messageController.contentID = model.id
            
            self.navigationController?.pushViewController(messageController, animated: false)
        }
    }
    
    func registerCellWithTableView() -> Void {
        
        self.tableView.registerCellWithTable(nibName: ANEventCell.nibNameForDetail, reuseIdentifier: ANEventCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANDescriptionCell.nibName, reuseIdentifier: ANDescriptionCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANLikeCommentCell.nibName, reuseIdentifier: ANLikeCommentCell.reuseIdentifier)
    }

    func updateUI(indexPath: IndexPath?, commentCount: String) {
        
        self.eventModel?.commentCount = commentCount
        
        if let index = indexPath{
        
            self.tableView.reloadRows(at: [index], with: .none)
        }
        
    }
}


extension ANEventDetailVC :UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: ANEventCell.reuseIdentifier, for: indexPath) as! ANEventCell
            
            cell.indexPath = indexPath
            cell.setDataForEventDetail(model: self.eventModel,baseURL: self.baseURL)
            
            return cell
            
        }else if indexPath.row == 1{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: ANDescriptionCell.reuseIdentifier, for: indexPath) as! ANDescriptionCell
            
            cell.lblTitle.setText(text: self.eventModel?.title)
            cell.lblDesc.setText(text: self.eventModel?.descriptionValue)
            
            return cell
            
        }else{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: ANLikeCommentCell.reuseIdentifier, for: indexPath) as! ANLikeCommentCell
            cell.delegate = self
            cell.indexPath = indexPath
            cell.setData(model: self.eventModel)
            
            return cell
        
        }
    }
}

//MARK:- TableView Delegate and DataSource

extension ANEventDetailVC:ANLikeCommentCellDelegate{
    
    func likeComment(indexPath: IndexPath?) {
     
        if let model = self.eventModel{
            
            if let like = model.selfLiked{
                
                if like == 0{
                    
                    self.likePost(indexPath: indexPath,contentID: model.id)
                }
            }
        }
    }
    
    func gotoComment(indexPath: IndexPath?) {
 
        self.openCommentView(indexPath: indexPath)
    }
}

extension ANEventDetailVC {
    
    func callWebserviceForLikePost(indexPath:IndexPath? ,contentID:String?) {
        
        //self.startActivityAnimating()
        
        if let contentID = contentID{
            
            let param = NSMutableDictionary();
            
            let body = NSMutableDictionary();
            body["content_id"] = contentID
            
            NetworkManager.httpPostRequest(.likeContent, dataParam: body, requestHeader: param, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                //print("Like Content  : ------> ",Utility.jsonToString(json: data) ?? "NA");
                
                if let data = data{
                    
                    if let status = data.value(forKey: "status") as? Int{
                        
                        if status == 1 {
                            
                            if let model = self.eventModel{
                                
                                model.selfLiked = 1
                                model.likesCount = String(Int((model.likesCount ?? "0"))!+1)
                                self.tableView.reloadRows(at: [indexPath!], with: .none)
                            }
                        }
                    }
                }
            } )
        }
    }
    
}
