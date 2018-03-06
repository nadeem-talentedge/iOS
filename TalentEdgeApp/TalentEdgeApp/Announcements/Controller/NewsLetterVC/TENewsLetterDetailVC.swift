//
//  TENewsLetterDetailVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 03/08/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import NextGrowingTextView
import IQKeyboardManagerSwift

class TENewsLetterDetailVC: UIViewController {
    
    @IBOutlet weak var tableView: BCUITableView!
    
    var baseURL:String?
    var newsLetterModel:TENewLetterModel?
    var baseViewController:UIViewController?
    
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

extension TENewsLetterDetailVC{
    
    
    func likePost(indexPath:IndexPath?,contentID:String?) -> Void {
        
        self.callWebserviceForLikePost(indexPath: indexPath, contentID: contentID)
    }
    
    func openCommentView(indexPath:IndexPath?) -> Void {
        
        let messageController = ANCommentsVC(nibName: "ANCommentsVC", bundle: nil)
        
        if let model = self.newsLetterModel{
            
            messageController.contentType = model.contentTypeId
            messageController.contentID = model.id
            
            self.navigationController?.pushViewController(messageController, animated: false)
        }
    }
    
    func registerCellWithTableView() -> Void {
        
        self.tableView.registerCellWithTable(nibName: TENewsLetterCell.nibName, reuseIdentifier: TENewsLetterCell.reuseIdentifier)
    }
    
}

//MARK:- TableView Delegate and DataSource

extension TENewsLetterDetailVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.newsLetterModel != nil{
            
            return 1
            
        }else{
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TENewsLetterCell.reuseIdentifier, for: indexPath) as! TENewsLetterCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        cell.lblHeading1.numberOfLines = 0
        cell.setData(model: self.newsLetterModel,baseURL: self.baseURL)
        
        return cell
    }
}

extension TENewsLetterDetailVC: TENewsLetterCellDelegate {
    
    //TENewLetterModel
    func newsletterDidSelectMessage(indexPath:IndexPath?) -> Void {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func newsletterDidSelectLike(indexPath:IndexPath?) -> Void{
        
        if let model = self.newsLetterModel{
            
            if let like = model.selfLiked{
                
                if like == 0{
                    
                    self.likePost(indexPath: indexPath,contentID: model.id)
                }
            }
        }
    }
    
    
    func newsSelectNoteAndVideo(indexPath : IndexPath?) -> Void{
        
        if let model = self.newsLetterModel {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
            
            controller.documentType = .PDF
            controller.contentId = model.id
            controller.contentName = model.title
            controller.contentPath = model.contentPath
            
            if let vc = self.baseViewController{
                
                vc.navigationController?.pushViewController(controller, animated: false)
                
            }else{
                
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}

extension TENewsLetterDetailVC {
    
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
                            
                            if let model = self.newsLetterModel{
                                
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
