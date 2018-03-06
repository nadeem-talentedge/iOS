//
//  TEMessageVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 14/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MXSegmentedPager

enum MessageType {

    case Receive
    case Sent
}

class TEMessageVC: BCUIViewController {

    @IBOutlet weak var tableView:BCUITableView!
    var baseViewController:UIViewController?
    var messageType = MessageType.Receive
    var arrOfMessage = Array<TopMessage>()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.setTitle(title: "Message")
        
        self.registerCellWithTable()
        self.callWebserviceForMessage()
    
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}

extension TEMessageVC {

    func registerCellWithTable() -> Void {
        
        self.tableView.registerCellWithTable(nibName: TEMessageCell.nibName, reuseIdentifier: TEMessageCell.reuseIdentifier)
        
        
        
        // Register Cell With Identifier
        self.tableView.addRefrehsControl(target: self)
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForMessage()
    }
}

extension TEMessageVC:UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.arrOfMessage.count > 0{
        
            self.tableView.backgroundView = nil
            
            return 1
            
            
        }else{
            
            self.tableView.backgroundView = Utility.nodataFoundView(title:"No Message to show!")
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TEMessageCell.reuseIdentifier, for: indexPath) as! TEMessageCell
        
        cell.setMessageData(model: self.arrOfMessage[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = TEReadMessage(nibName: "TEReadMessage", bundle: nil)
        vc.topMessage = self.arrOfMessage[indexPath.row]
        
        if let controller = self.baseViewController{
            
            controller.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

//MARK: - Network Call

extension TEMessageVC {
    
    func callWebserviceForMessage() {
        
        self.startAnimating()
        
        let dicParam  =  NSMutableDictionary()
        
        dicParam["page"] = "0"
        dicParam["limit"] = "1000"
        
        if self.messageType == .Receive{
            
            dicParam["type"] = "inbox"
            
        }else{
            
            dicParam["type"] = "sent"
        }
        
        let headerParam = NSMutableDictionary()
        
        NetworkManager.httpPostRequest(.messageList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Message : ------> ",data?.string() ?? "NA");
            
            if let data = data {
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1{
                        
                        if let array = data.value(forKey: "resultData") as? NSArray{
                            
                            self.arrOfMessage.removeAll()
                            
                            for model in array{
                        
                                let model = TopMessage(object: model)
                                self.arrOfMessage.append(model)
                            }
                        }
                        
                    }
                }
            }
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
            
        })
    }
}
