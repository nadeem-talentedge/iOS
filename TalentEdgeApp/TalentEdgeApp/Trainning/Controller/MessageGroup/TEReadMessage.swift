//
//  TENewPostVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import AssetsLibrary

class TEReadMessage: BCUIViewController {

    @IBOutlet weak var tableView:BCUITableView!
    var topMessage:TopMessage?
    var isContactEditable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navButton()
        self.setTitle(title: "Message")
        self.registerCellWithTable()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navButton() ->Void{
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnDelete = UIButton()
        btnDelete.tag = 1
        btnDelete.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnDelete.setImage(UIImage(named: "delete_white"), for: .normal)
        
        let btnForward = UIButton()
        btnForward.tag = 2
        btnForward.setImage(UIImage(named: "forward_white"), for: .normal)
        btnForward.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        
        btnDelete.addTarget(self, action: #selector(didSelect), for: .touchUpInside)
        
        btnForward.addTarget(self, action: #selector(didSelect), for: .touchUpInside)
        
        let delete = UIBarButtonItem(customView: btnDelete)
        delete.tag = btnDelete.tag
        
        let forward = UIBarButtonItem(customView: btnForward)
        forward.tag = btnForward.tag
        
        
        buttonsArray.append(delete)
        buttonsArray.append(forward)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
        
    }

    func didSelect(sender:UIButton) -> Void {
        
        let vc = TENewPostVC(nibName: "TENewPostVC", bundle: nil)
        vc.isReply = true
        vc.isContactEditable = false
        vc.topMessage = self.topMessage
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - User Define

extension TEReadMessage{

    func registerCellWithTable() -> Void {
        
        self.tableView.backgroundColor = UIColor.white
        
        self.tableView.registerCellWithTable(nibName: TEReadMessageSubjectCell.nibName, reuseIdentifier: TEReadMessageSubjectCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEReadMessageInfoCell.nibName, reuseIdentifier: TEReadMessageInfoCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEAttachmentCell.nibName, reuseIdentifier: TEAttachmentCell.reuseIdentifier)
    }
}

extension TEReadMessage: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let attachment = topMessage?.attach{
        
            return 3+attachment.count
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReadMessageSubjectCell.reuseIdentifier, for: indexPath) as! TEReadMessageSubjectCell
            
            cell.lblTitle.setText(text: self.topMessage?.subject)
            
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReadMessageInfoCell.reuseIdentifier, for: indexPath) as! TEReadMessageInfoCell
            
            cell.lblName.setText(text: self.topMessage?.fromName ?? self.topMessage?.toName)
            cell.lblDate.setText(text: self.topMessage?.created)
            cell.imgICon.setImageFromUrl(url: self.topMessage?.fromUserPic ?? self.topMessage?.toUserPic, placeHolder: nil)
            
            return cell
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReadMessageSubjectCell.reuseIdentifier, for: indexPath) as! TEReadMessageSubjectCell
            
            cell.lblTitle.setText(text: self.topMessage?.message)
            
            return cell
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TEAttachmentCell.reuseIdentifier, for: indexPath) as! TEAttachmentCell
            cell.indexPath = indexPath
            
            cell.btnClose.isHidden = true
            
            if let attachment = topMessage?.attach{
                
                let string = attachment[indexPath.row - 3]
                cell.lblImageName.setText(text: string)
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if indexPath.row > 2 {
            
            if let attachment = topMessage?.attach{
                
                let string = attachment[indexPath.row - 3]
                self.callServiceForDownloadingFile(path: string)
            }
        }
    }
    
}

//MARK:- Server Call

extension TEReadMessage{

    func readMessage(notificationId:String?) {
        
        if let notificationId = notificationId{
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["notificationId"] = notificationId
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.viewNotification, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Notification Read : ------> ",data?.string() ?? "NA");
            
            })
        }
        
    }
    
    func postMessage() {
        
        
        let paramParam : NSMutableDictionary = NSMutableDictionary()
        
        let headerParam : NSMutableDictionary = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpMultiPartFromRequest(.messageCompose, dataParam: paramParam, requestHeader: headerParam,  userimage : nil,completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Post Message: ------> ",data ?? "Upload Assignment error");
                
                if let data = data{
                    
                    if let message = data.value(forKey: "message") as? String{
                        
                        Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                    else{
                        
                        Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                    }
                }
                self.stopAnimating()
            })
    }
}

