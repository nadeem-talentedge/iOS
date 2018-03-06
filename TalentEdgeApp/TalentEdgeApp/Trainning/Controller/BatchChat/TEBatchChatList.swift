//
//  TEBatchChatList.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 20/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import ASExtendedCircularMenu

class TEBatchChatList: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    var baseViewController:UIViewController?
    var dashbordData:DashbordBase?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()

        self.setTitle(title: "Chat")
        
        // Register Cell With Identifier
        self.tableView.addRefrehsControl(target: self)
        
        self.tableView.registerCellWithTable(nibName: BatchChatCell.nibName, reuseIdentifier: BatchChatCell.reuseIdentifier)
        
        self.callWebserviceForDashboardDetail()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForDashboardDetail()
    }
}

//MARK:- User Define

extension TEBatchChatList {
    
    @IBAction func openMenu(sender:ASCircularMenuButton) -> Void{
    
    }
}

//MARK:- Tableview Delegate

extension TEBatchChatList:UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isTeacherLogin() == true{
        
            if let ongoingCourse = dashbordData?.facultyOngoingCourse{
                
                return ongoingCourse.count
                
            }else{
                
                return 0
            }
            
        }else{
           
            if let ongoingCourse = dashbordData?.ongoingCourse{
                
                return ongoingCourse.count
                
            }else{
                
                return 0
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BatchChatCell.reuseIdentifier, for: indexPath) as! BatchChatCell
        
        if self.isTeacherLogin() == true{
            
            if let ongoingCourse = dashbordData?.facultyOngoingCourse{
                
                let model = ongoingCourse[indexPath.row]
            
                cell.imgCource.setImageFromUrl(url: model.logo, placeHolder: nil)
                cell.lblCourceName.setText(text: "\(model.instituteName ?? "") \(model.courseName ?? "")")
                cell.lblDuration.setText(text: model.courseDuration)
            }
            
        }else{
            
            
            if let ongoingCourse = dashbordData?.ongoingCourse{
                
                let model = ongoingCourse[indexPath.row]
                
                cell.imgCource.setImageFromUrl(url: model.logo, placeHolder: nil)
                cell.lblCourceName.setText(text: "\(model.instituteName ?? "") \(model.courseName ?? "")")
                cell.lblDuration.setText(text: model.courseDuration)
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let controller = TEWebView(nibName: "TEWebView", bundle: nil)
        controller.pageType = .avatar
        
        if self.isTeacherLogin() == true{
            
            if let ongoingCourse = dashbordData?.facultyOngoingCourse{
                
                let model = ongoingCourse[indexPath.row]
                controller.setTitle(title: model.name ?? "")
                controller.batchID = model.id
            }
            
        }else{
            
            
            if let ongoingCourse = dashbordData?.ongoingCourse{
                
                let model = ongoingCourse[indexPath.row]
                controller.setTitle(title: model.name ?? "")
                controller.batchID = model.id
            }
            
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK:- Server Call
extension TEBatchChatList {
    
    func callWebserviceForDashboardDetail() {
        
        
        self.startAnimating()
        
        let dict = NSMutableDictionary()
        dict["semester_id"] = ""
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.dashboard, dataParam: dict, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Dashbord Data : ------> ",Utility.jsonToString(json: data) ?? "Dashboard Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        if let resultData = data.value(forKey: "resultData") as? NSDictionary {
                            
                            self.dashbordData = DashbordBase(object: resultData)
                        }
                    }
                }
                
            }
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
            
        } )
        
    }
}
