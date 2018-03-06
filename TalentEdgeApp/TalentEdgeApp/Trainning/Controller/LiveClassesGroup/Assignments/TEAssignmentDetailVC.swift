//
//  TEAssignmentDetailVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 23/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEAssignmentDetailVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    
    var baseViewController:UIViewController?
    
    var contentId:String?
    var contentName:String?
    
    var assigmentDetailModel:AssigmentDetailModel?
    var userImage : UIImageView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let contentName = self.contentName{
        
            self.setTitle(title: contentName)
        }
        
        self.tableview.registerCellWithTable(nibName: TEHeaderCell.nibName, reuseIdentifier: TEHeaderCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEMySubmitionCell.nibName, reuseIdentifier: TEMySubmitionCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEHeaderCell.nibName, reuseIdentifier: TEHeaderCell.reuseIdentifier)
        
        tableview.estimatedRowHeight = 50
        tableview.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
        self.tableview.registerCellWithTable(nibName: TEAssignmentDetailCell.nibName, reuseIdentifier: TEAssignmentDetailCell.reuseIdentifier)
    
        self.callWebserviceForViewAssignment()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: - tableview delegate & datasource

extension TEAssignmentDetailVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.assigmentDetailModel != nil{
        
                return 2
            
        }else{
        
        
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
            
        case 0:
            let cell : TEHeaderCell = tableView.dequeueReusableCell(withIdentifier: TEHeaderCell.reuseIdentifier) as! TEHeaderCell
            
            if let assignmet = self.assigmentDetailModel{
                
                cell.lblTitle.setText(text: assignmet.content?.title)
                
                cell.btnType.setText(text: "  Assignment")
                
                //cell.btnStartDate.setText(text: "")
                //cell.btnStartDate.isHidden = true
                cell.btnStartDate.setText(text: "\((assignmet.content?.startDate ?? "")) - \((assignmet.content?.endDate ?? ""))")
                
            }
            return cell
            
        case 1:
            let cell : TEAssignmentDetailCell = tableView.dequeueReusableCell(withIdentifier: TEAssignmentDetailCell.reuseIdentifier) as! TEAssignmentDetailCell
            
            cell.delegate = self
            
            cell.setData(model: self.assigmentDetailModel)
            
            return cell
            
        default:
            let cell : TEMySubmitionCell = tableView.dequeueReusableCell(withIdentifier: TEMySubmitionCell.reuseIdentifier) as! TEMySubmitionCell
            cell.delegate = self
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}

//MARK: - TEMySubmitionCellDelegate Delegate


extension TEAssignmentDetailVC: TEMySubmitionCellDelegate {
    
    func delegateEditButtonDidClick() {
        
    }
    
    func delegateDeleteButtonDidClick() {
        
    }
}

//MARK: - Assigment Detail Call Delegate


extension TEAssignmentDetailVC: TEAssignmentDetailCellDelegate {

    func downloadAssigmentDidClick() {
        
        self.callServiceForDownloadingFile(path: self.assigmentDetailModel?.content?.contentPath)
    }
    
    func uploadAssigmentDidClick() {
        
        self.actionSheetForPhoto()
    }
    
    override func getImageFromImagePicker(image: UIImage, url: NSURL?) {
        
        self.callWebserviceForUploadAssignment(docImage: image)
    }
}

//MARK: - Network Call

extension TEAssignmentDetailVC {
    
    func callWebserviceForViewAssignment() {
        
        if let moduleID = self.contentId , let token = Utility.getLoginUserDetail()?.token {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            headerParam["token"] =  token
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.assignmentView, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("ViewAssignment : ------> ",data ?? "ViewAssigmnet Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                self.assigmentDetailModel = AssigmentDetailModel(object: resultData)
                                self.tableview.reloadData()
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
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    
    /*
     In Header token:XXXX
     In Data
     content_id:XX
     uploaded_path:XX (File) in multipart/form-data
     
     
     */
    func callWebserviceForUploadAssignment(docImage : UIImage) {
        
        
        if let content_id = self.contentId{
         
            let paramParam : NSMutableDictionary = NSMutableDictionary()
            paramParam["content_id"] = content_id
            
            let headerParam : NSMutableDictionary = NSMutableDictionary()
            
            self.startAnimating()
            
            
            NetworkManager.httpMultiPartFromRequest(.uploadAssignment, dataParam: paramParam, requestHeader: headerParam,  userimage : docImage,completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Upload Assignment: ------> ",data ?? "Upload Assignment error");
                
                if let data = data{
                    
                    if let status = data.value(forKey: "status") as? Bool {
                        
                        if status == true{
                            
                            Utility.showAlert(message: "Assignment uploaded successfully", title: AppName, actions: nil, controller: self)
                            
                        }else{
                          
                            if let message = data.value(forKey: "message") as? String{
                                
                                Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                            }
                            else{
                                
                                Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                            }
                        }
                        
                    }else{
                    
                        if let message = data.value(forKey: "message") as? String{
                            
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        else{
                            
                            Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                        }
                    }
                }
                self.stopAnimating()
            })
            
            
        }
        else{
            
            Utility.showAlert(message: "content id not available", title: AppName, actions: nil, controller: self)
        }
        
    }
}
