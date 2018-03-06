//
//  TEDiscussionListVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 09/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEDiscussionListVC: BCUIViewController {

    var baseViewController:UIViewController?
    
    var batchID:String?
    var batchName:String?
    
    var arrOfDiscussionList = Array<DiscussionModel>()
    
    @IBOutlet weak var tableView: BCUITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let batchName = self.batchName{
            
            self.setTitle(title: batchName)
        }
        
        self.tableView.registerCellWithTable(nibName: TEDiscussionCell.nibName, reuseIdentifier: TEDiscussionCell.reuseIdentifier)
        
        self.tableView.addRefrehsControl(target: self)
        
        self.callWebserviceForDiscussionList()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForDiscussionList()
    }

}


extension TEDiscussionListVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfDiscussionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TEDiscussionCell = tableView.dequeueReusableCell(withIdentifier: TEDiscussionCell.reuseIdentifier) as! TEDiscussionCell
        
        cell.configureCell(object: arrOfDiscussionList[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let discussionObj = arrOfDiscussionList[indexPath.row]
        
        let obj = TEDiscussionChatVC(nibName: "TEDiscussionChatVC", bundle: nil)
        
        obj.content_id = discussionObj.id
        
        if let controller = self.baseViewController{
            
            controller.navigationController?.pushViewController(obj, animated: true);
            
        }else{
            
            self.navigationController?.pushViewController(obj, animated: true)
        }
    }
}


//MARK: - Network Call

extension TEDiscussionListVC {
    
    /*
     In Header
     user_id: XXXX
     token: XXXX
     In Body batch_id:XX
     */
    
    func callWebserviceForDiscussionList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getDiscussionList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Discussion List : ------> ",data ?? "DiscussionList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfDiscussionList.removeAll()
                                
                                for dict in resultData{
                                    self.arrOfDiscussionList.append(DiscussionModel(object:dict))
                                }
                                self.tableView.reloadData()
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
                
                
                if self.arrOfDiscussionList.count == 0{
                    self.tableView.backgroundView = Utility.nodataFoundView()
                }
                
                 self.tableView.endRefreshing()
                 self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id not available", title: AppName, actions: nil, controller: self)
        }
        
    }
}
