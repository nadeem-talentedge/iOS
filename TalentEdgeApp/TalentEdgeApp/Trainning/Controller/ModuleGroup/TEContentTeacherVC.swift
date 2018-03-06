//
//  TEContentTeacherVC.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 20/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


class TEContentTeacherVC: BCUIViewController {
    
    @IBOutlet weak var tableview: BCUITableView!
    
    var docType : docmentTypeValue?
    
    var baseViewController:UIViewController?
    
    var moduleName:String?
    var moduleID:String?
    var batchID:String?
    
    var arrOfContent = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let moduleName = self.moduleName {
            
            self.setTitle(title: moduleName)
        }
        docType = docmentTypeValue.PDF
        self.registerTableViewCellForTeacher()
        
    }
    
    func registerTableViewCellForTeacher() -> Void {
        
        self.tableview.registerCellWithTable(nibName: TETeacherAssesmentsCell.nibName, reuseIdentifier: TETeacherAssesmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TETeacherAssignmentsCell.nibName, reuseIdentifier: TETeacherAssignmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TETeacherLiveClassCell.nibName, reuseIdentifier: TETeacherLiveClassCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TETeacherModulePlanerContentCell.nibName, reuseIdentifier: TETeacherModulePlanerContentCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TETeacherNotesCell.nibName, reuseIdentifier: TETeacherNotesCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TETeacherVideoCell.nibName, reuseIdentifier: TETeacherVideoCell.reuseIdentifier)
        
        
        
        self.tableview.addRefrehsControl(target: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            self.callWebserviceForTeacherContentList()
        }
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForTeacherContentList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

//MARK: - TableView Delegate and DataSource

extension TEContentTeacherVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.arrOfContent[indexPath.row] is TeacherNotesContentModel{//Notes
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherNotesCell.reuseIdentifier) as! TETeacherNotesCell
            cell.indexPath = indexPath
            
            cell.setNotesData(model: self.arrOfContent[indexPath.row] as? TeacherNotesContentModel)
            
            return cell
            
        }
        else if self.arrOfContent[indexPath.row] is TeacherVideoContentModel{//Video
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherVideoCell.reuseIdentifier) as! TETeacherVideoCell
            
            cell.indexPath = indexPath
            
            cell.setVideoData(model: self.arrOfContent[indexPath.row] as? TeacherVideoContentModel)
            
            return cell
        }
        else if self.arrOfContent[indexPath.row] is TeacherInteractiveVideoContentModel{//Interactive Video
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherVideoCell.reuseIdentifier) as! TETeacherVideoCell
            
            cell.indexPath = indexPath
            
            cell.setInteractiveVideoData(model: self.arrOfContent[indexPath.row] as? TeacherInteractiveVideoContentModel)
            
            return cell
        }
        else if self.arrOfContent[indexPath.row] is TeacherAssessmentContentModel{//Assessment
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherAssesmentsCell.reuseIdentifier) as! TETeacherAssesmentsCell
            
            cell.indexPath = indexPath
            
            cell.setTecherAssessmentContentData(model: self.arrOfContent[indexPath.item] as? TeacherAssessmentContentModel)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is TeacherAssignmentContentModel{//Assignment
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherAssignmentsCell.reuseIdentifier) as! TETeacherAssignmentsCell
            
            cell.indexPath = indexPath
            
            cell.setTeacherAssignmenContentData(model: self.arrOfContent[indexPath.item] as? TeacherAssignmentContentModel)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is TeacherLiveClassContentModel{//LiveClass
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherLiveClassCell.reuseIdentifier) as! TETeacherLiveClassCell
            
            cell.indexPath = indexPath
            
            cell.setTeacherLiveClassContentData(model: self.arrOfContent[indexPath.item] as? TeacherLiveClassContentModel)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is TeacherModulePlannerContentModel{//Module Planner
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherModulePlanerContentCell.reuseIdentifier) as! TETeacherModulePlanerContentCell
            
            cell.indexPath = indexPath
            
            //cell.setTeacherLiveClassContentData(model: self.arrOfContent[indexPath.item] as? TeacherLiveClassContentModel)
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
     
        
        
        if self.arrOfContent[indexPath.row] is TeacherLiveClassContentModel{//LiveClass
        
            let vc = TETeacherLiveClassDetailVC(nibName: "TETeacherLiveClassDetailVC", bundle: nil)
            vc.isLiveClass = true
            vc.batchID = self.batchID
            vc.liveClassContent = self.arrOfContent[indexPath.item] as? TeacherLiveClassContentModel
            
            if let baseVC = self.baseViewController{
                
                baseVC.navigationController?.pushViewController(vc, animated: true)
            }
            
        }else if self.arrOfContent[indexPath.row] is TeacherAssessmentContentModel{
            
            if self.isTeacherLogin() == true {
                
                let vc = TETeacherAssessmentDetailVC(nibName: "TETeacherAssessmentDetailVC", bundle: nil)
                vc.batchID = self.batchID
                vc.teacherAssessmentContentModel = self.arrOfContent[indexPath.item] as? TeacherAssessmentContentModel
                
                if let base = self.baseViewController{
                    
                    base.navigationController?.pushViewController(vc, animated: true)
                }
            }
        } else if self.arrOfContent[indexPath.row] is TeacherAssignmentContentModel{
            
            let vc = TETeacherAssignmentDetailVC(nibName: "TETeacherAssignmentDetailVC", bundle: nil)
            
            vc.batchID = self.batchID
            vc.teacherAssignmentContentModel = self.arrOfContent[indexPath.row] as? TeacherAssignmentContentModel
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


//MARK: - Network Call

extension TEContentTeacherVC {
    
    func callWebserviceForLiveClassURL(contentId:String?) {
        
        if let batchID = self.batchID, let contentId = contentId {
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["batch_id"] = batchID
            dicParam["content_id"] = contentId
            
            let headerParam = NSMutableDictionary()
            
            //self.startActivityAnimating()
            
            NetworkManager.httpPostRequest(.joinLiveClass, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Live Class URL : ------> ",data ?? "Live Class Eorrr");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                
                                if let url = resultData.value(forKey: "URL") as? String{
                                    
                                    if let urlServer = URL(string: url){
                                        
                                        if UIApplication.shared.canOpenURL(urlServer){
                                            
                                            UIApplication.shared.openURL(urlServer)
                                            
                                        }else{
                                            
                                            Utility.showAlert(message: "Invalid Url", title: AppName, actions: nil, controller: self)
                                        }
                                        
                                    }else{
                                        
                                        Utility.showAlert(message: "Invalid Url", title: AppName, actions: nil, controller: self)
                                    }
                                    
                                }else{
                                    
                                    Utility.showAlert(message: "Invalid Url", title: AppName, actions: nil, controller: self)
                                }
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
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForTeacherContentList() {
        
        if let moduleID = self.moduleID , let userName = Utility.getLoginUserDetail()?.resultData?.user?.username {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["module_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            headerParam["user_id"] =  userName
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                //print("Content List : ------> ",data ?? "Content List Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfContent.removeAll()
                                
                                for dict in resultData{
                                    
                                    if let dict = dict as? NSDictionary{
                                        
                                        if let contentTypeID = Utility.AnyVaueToInt(value: dict.value(forKey: "content_type_id") as AnyObject) as? Int{
                                            
                                            //print("Content type ------->",contentTypeID)
                                            
                                            if contentTypeID == 1{//Notes
                                                
                                                //print("Notes : ------> ",dict.string() ?? "");
                                                self.arrOfContent.append(TeacherNotesContentModel(object:dict))
                                                
                                            }else if contentTypeID == 2{//Video
                                                
                                                //print("Video : ------> ",dict.string() ?? "");
                                                self.arrOfContent.append(TeacherVideoContentModel(object:dict))
                                                
                                            }else if contentTypeID == 3{//Interactive Video
                                                
                                                //print("Interactive Video : ------> ",dict.string() ?? "");
                                            self.arrOfContent.append(TeacherInteractiveVideoContentModel(object:dict))
                                                
                                            }
                                            
                                            else if contentTypeID == 4{//Assessment
                                                

                                                //print("Assessment : ------> ",dict.string() ?? "");
                                                self.arrOfContent.append(TeacherAssessmentContentModel(object:dict))

                                                
                                            }else if contentTypeID == 5{//Assignment
                                                
                                                    //print("Assignment : ------> ",dict.string() ?? "");
                                                self.arrOfContent.append(TeacherAssignmentContentModel(object:dict))

                                            }else if contentTypeID == 6{//Module Planner
                                                
                                                //print("Module Planner : ------> ",dict.string() ?? "");
                                            self.arrOfContent.append(TeacherModulePlannerContentModel(object:dict))

                                            }else if contentTypeID == 7{//Live Class
                                                
                                                    //print("Live Class : ------> ",dict.string() ?? "");
                                                self.arrOfContent.append(TeacherLiveClassContentModel(object:dict))

                                                
                                            }else if contentTypeID == 8{//Discussion
                                                
                                                    print("Content type ------->",contentTypeID)
                                                
                                                    //print("Discussion : ------> ",dict.string() ?? "");
                                                self.arrOfContent.append(TeacherDiscussionContentModel(object:dict))

                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
                if self.arrOfContent.count == 0{
                    
                    self.tableview.backgroundView = Utility.nodataFoundView()
                }
                self.tableview.endRefreshing()
                
                self.tableview.reloadData()
                
                self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
    }
}
