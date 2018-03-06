//
//  ANRecruitmentVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class ANRecruitmentDetailVC: BCUIViewController {
    
    @IBOutlet weak var tableView: BCUITableView!
    
    var baseURL:String?
    var recruitmentModel:ANRecruitmentModel?
    //recruitmentModel
    
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
}

//MARK:- User Define

extension ANRecruitmentDetailVC{
    
    
    func likePost(indexPath:IndexPath?,contentID:String?) -> Void {
        
        self.callWebserviceForLikePost(indexPath: indexPath, contentID: contentID)
    }
    
    func openCommentView(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath {
            
            print("Index Path :",indexPath.row)
            
            let messageController = ANCommentsVC(nibName: "ANCommentsVC", bundle: nil)
            
            if let model = self.recruitmentModel{
                
                messageController.contentType = model.contentTypeId
                messageController.contentID = model.id
                
                self.navigationController?.pushViewController(messageController, animated: false)
            }
        }
    }
    
    func registerCellWithTableView() -> Void {
        
        self.tableView.registerCellWithTable(nibName: ANRecruitmentCell.nibName, reuseIdentifier: ANRecruitmentCell.reuseIdentifier)
    }
    
}

//MARK:- TableView Delegate and DataSource

extension ANRecruitmentDetailVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.recruitmentModel != nil{
            
            return 1
            
        }else{
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ANRecruitmentCell.reuseIdentifier, for: indexPath) as! ANRecruitmentCell
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        cell.lblHeading1.numberOfLines = 0
        
        cell.setData(model: self.recruitmentModel ,baseURL: self.baseURL)
        return cell
    }
}


//MARK:- Recruitment Cell

extension ANRecruitmentDetailVC: ANRecruitmentCellDelegate{
    
    func recruitmentDidSelectRefer(indexPath: IndexPath?) {
        
    }
    
    func recruitmentDidSelectLike(indexPath: IndexPath?) {
        
        if let model = self.recruitmentModel{
            
            if let like = model.selfLiked{
                
                if like == 0{
                    
                    self.likePost(indexPath: indexPath,contentID: model.id)
                }
            }
        }
    }
    
    func recruitmentDidSelectMessage(indexPath: IndexPath?) {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func recruitmentDidSelectDownloadFile(indexPath:IndexPath?) -> Void{
        
        if let model = self.recruitmentModel{
            
            self.callServiceForDownloadingFile(path: (self.baseURL ?? "")+(model.contentPath ?? ""))
        }
    }
    
    func openRecruitmentDetail(indexPath: IndexPath?){
        
        print("select")
    }
}

extension ANRecruitmentDetailVC {
    
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
                            
                            if let model = self.recruitmentModel{
                                
                                model.selfLiked = 1
                                model.likesCount = String(Int((model.likesCount ?? "0"))!+1)
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            } )
        }
    }
    
}

