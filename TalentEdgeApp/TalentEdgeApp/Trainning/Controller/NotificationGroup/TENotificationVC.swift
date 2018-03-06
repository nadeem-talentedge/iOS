//
//  TENotificationVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 14/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TENotificationVC: BCUIViewController {

    @IBOutlet weak var tableView:BCUITableView!
    
    var noficationModel:TENotificationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTitle(title: "Notification")
        
        self.registerCellWithTable()
        self.callWebserviceForNotification()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TENotificationVC {
    
    func registerCellWithTable() -> Void {
        
        self.tableView.registerCellWithTable(nibName: TENotificationCell.nibName, reuseIdentifier: TENotificationCell.reuseIdentifier)
        
        // Register Cell With Identifier
        self.tableView.addRefrehsControl(target: self)
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForNotification()
    }
}

extension TENotificationVC:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.noficationModel != nil{
        
            return 1
        }else{
        
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        if let model = self.noficationModel?.notifications{
        
            return model.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TENotificationCell.reuseIdentifier, for: indexPath) as! TENotificationCell
        
        if let model = self.noficationModel?.notifications?[indexPath.row]{
        
            cell.lblTitle.numberOfLines = model.numberOfLine
            cell.setData(model: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let model = self.noficationModel?.notifications?[indexPath.row]{
            
            model.isRead = "1"
            
            if model.numberOfLine == 2{
            
                model.numberOfLine = 0
                self.tableView.reloadRows(at: [indexPath], with: .top)
                
            }else{
            
                model.numberOfLine = 2
                self.tableView.reloadRows(at: [indexPath], with: .bottom)
            }
            
            self.callWebserviceForChangeReadStatus(notificationId:model.id)
            
        }
    }
}

//MARK: - Network Call

extension TENotificationVC {
    
    func callWebserviceForNotification() {
        
        self.startAnimating()
        
        let dicParam  =  NSMutableDictionary()
        
        dicParam["start"] = "0"
        dicParam["limit"] = "1000"
        
        let headerParam = NSMutableDictionary()
        
        NetworkManager.httpPostRequest(.notificationList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Notification  : ------> ",data?.string() ?? "NA");
            
            if let data = data {
            
                if let status = data.value(forKey: "status") as? Int{
                
                    if status == 1{
                    
                        self.noficationModel = TENotificationModel(object: data)
                    }
                }
            }
            
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
        })
    }
    
    func callWebserviceForChangeReadStatus(notificationId:String?) {
        
        if let notificationId = notificationId{
        
            let dicParam  =  NSMutableDictionary()
            
            dicParam["notificationId"] = notificationId
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.viewNotification, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Notification Read : ------> ",data?.string() ?? "NA");
                
                /*if let data = data {
                    
                    if let status = data.value(forKey: "status") as? Int{
                        
                        if status == 1{
                            
                            self.noficationModel = TENotificationModel(object: data)
                        }
                    }
                }*/
            })
        }
        
    }
}
