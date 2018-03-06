//
//  TEContentVC.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 20/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


class TEContentVC: BCUIViewController {
    
    @IBOutlet weak var tableview: BCUITableView!
    
    var docType : docmentTypeValue?
    
    var baseViewController:UIViewController?
    
    var stroke = false
    var moduleID:String?
    var batchID:String?
    
    var moduleName:String?
    
    var arrOfContent = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let moduleName = self.moduleName {
            
            self.setTitle(title: moduleName)
        }
        
        docType = docmentTypeValue.PDF
        
        if self.isTeacherLogin() == true {
            
            self.registerTableViewCellForTeacher()
            
        }else{
            
            self.registerTableViewCell()
        }
        
    }
    
    func registerTableViewCell() -> Void {
        
        self.tableview.registerCellWithTable(nibName: TEReferenceNotesCell.nibName, reuseIdentifier: TEReferenceNotesCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TELecturersCell.nibName, reuseIdentifier: TELecturersCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEAssignmentsCell.nibName, reuseIdentifier: TEAssignmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEAssesmentsCell.nibName, reuseIdentifier: TEAssesmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEConcludedCell.nibName, reuseIdentifier: TEConcludedCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TELiveClassCell.nibName, reuseIdentifier: TELiveClassCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEModuleListCell.nibName, reuseIdentifier: TEModuleListCell.reuseIdentifier)
        
        self.tableview.addRefrehsControl(target: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            self.callWebserviceForContentList()
        }
    }
    
    func registerTableViewCellForTeacher() -> Void {
        
        self.tableview.registerCellWithTable(nibName: TEReferenceNotesCell.nibName, reuseIdentifier: TEReferenceNotesCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TELecturersCell.nibName, reuseIdentifier: TELecturersCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEAssignmentsCell.nibName, reuseIdentifier: TEAssignmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEAssesmentsCell.nibName, reuseIdentifier: TEAssesmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEConcludedCell.nibName, reuseIdentifier: TEConcludedCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TELiveClassCell.nibName, reuseIdentifier: TELiveClassCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEModuleListCell.nibName, reuseIdentifier: TEModuleListCell.reuseIdentifier)
        
        self.tableview.addRefrehsControl(target: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            self.callWebserviceForContentList()
        }
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForContentList()
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


extension TEContentVC : TEConcludedCellDelegate{
    
    //MARK: - TEConcludedCellDelegate
    
    func concluded_Click(index : Int) {
        
        if self.arrOfContent[index] is ContentListVideos {
            
            let content = self.arrOfContent[index] as! ContentListVideos
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
            
            obj.documentType = .VIDEO
            obj.contentId = content.id
            obj.contentName = content.title
            
            self.navigationController?.pushViewController(obj, animated: true)
        }
    }
}



//MARK: - Video, Interactive Video, PDF(Notes Deleagte)

extension TEContentVC:TEReferenceNotesCellDelegate{

    func selectNoteAndVideo(indexPath : IndexPath?) {
        
        self.navigateNoteToDetail(indexPath:indexPath)
    }
    
    func navigateNoteToDetail(indexPath:IndexPath?) ->Void{
    
        if let indexPath = indexPath{
    
            if self.arrOfContent[indexPath.row] is ContentListNotes {
                
                let content = self.arrOfContent[indexPath.row] as! ContentListNotes
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                obj.documentType = .PDF
                obj.contentId = content.id
                obj.contentName = content.title
                obj.contentPath = content.contentPath
                obj.moduleID = self.moduleID
                self.navigationController?.pushViewController(obj, animated: true)
            }
                
            else if self.arrOfContent[indexPath.row] is ContentListVideos {
                
                let content = self.arrOfContent[indexPath.row] as! ContentListVideos
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                obj.documentType = .VIDEO
                obj.contentId = content.id
                obj.contentName = content.title
                obj.moduleID = self.moduleID
                obj.stroke = self.stroke
                
                if self.stroke == true{
                    
                    obj.contentListVideos = content
                }
                
                self.navigationController?.pushViewController(obj, animated: true)
            }
            else if self.arrOfContent[indexPath.row] is ContentListVideoInteractive {
                
                let content = self.arrOfContent[indexPath.row] as! ContentListVideoInteractive
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                obj.documentType = .VIDEO
                obj.contentId = content.id
                obj.contentName = content.title
                obj.moduleID = self.moduleID
                obj.stroke = self.stroke
                
                if self.stroke == true{
                    
                    obj.contentListVideoInteractive = content
                }
                self.navigationController?.pushViewController(obj, animated: true)
            }
        }
    }
}


//MARK: - TELecturersCellDelegate Delegate

extension TEContentVC:TELecturersCellDelegate{

    func submit_Click(indexPath index : IndexPath?) {
    
    }
}

//MARK: - ModulePlaner Cell Delegate

extension TEContentVC:TEModuleListCellDelegate {

    func rightClickModuleList(indexPath: IndexPath?) {
        
        self.navigateToMuduleDetail(indexPath: indexPath)
    }
    
    func navigateToMuduleDetail(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath{
        
            let content = self.arrOfContent[indexPath.row] as! ContentListModule
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEModulePlannerVC) as! TEModulePlannerVC
            
            obj.contentId = content.id
            
            obj.contentName = content.title
            
            obj.descritionValue = content.descriptionValue
            
            self.navigationController?.pushViewController(obj, animated: true)
        }
    }
}

//MARK:- Assessment Cell Delegate

extension TEContentVC:TEAssesmentsCellDelegate{

    func selectAssessment(indexPath: IndexPath?) {
        
        self.navigateToAssessmentDetail(indexPath: indexPath)
    }
    
    func navigateToAssessmentDetail(indexPath:IndexPath?){
    
        if let indexPath = indexPath{
    
            if self.arrOfContent[indexPath.row] is ContentListAssessment {
                
                let content = self.arrOfContent[indexPath.row] as! ContentListAssessment
                
                let obj = TEAssessmentDetailVC(nibName: "TEAssessmentDetailVC", bundle: nil)
                
                obj.contentId = content.id
                
                obj.contentName = content.title
                
                self.navigationController?.pushViewController(obj, animated: true)
                
            }
        }
    }
}


//MARK:- TEAssignments Cell Delegate

extension TEContentVC:TEAssignmentsCellDelegate {
    
    func selectAssignment(indexPath: IndexPath?) {
        
        self.openAssigmentDetail(indexPath: indexPath)
    }
    
    func openAssigmentDetail(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath{
            
            if self.arrOfContent[indexPath.row] is ContentListAssignment {
                
                let content = self.arrOfContent[indexPath.row] as! ContentListAssignment
                
                let controller = TEAssignmentDetailVC(nibName: "TEAssignmentDetailVC", bundle: nil)
                
                controller.contentId = content.id
                
                controller.contentName = content.title
                
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
        }
    }
}

//MARK: - Live Class Cell Delegate

extension TEContentVC : TELiveClassCellDelegate{
    
    func selectLiveClass(indexPath: IndexPath?) {
    
        self.joinLiveClass(indexPath: indexPath)
    }

    func joinLiveClass(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.arrOfContent[indexPath.row]
            
            if let model = model as? ContentListLiveClass{
            
                self.callWebserviceForLiveClassURL(contentId: model.id)
            }
        }
    }
}
//MARK: - TableView Delegate and DataSource

extension TEContentVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.arrOfContent[indexPath.row] is ContentListNotes{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReferenceNotesCell.reuseIdentifier) as! TEReferenceNotesCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            cell.configureCell(model: self.arrOfContent[indexPath.row] as? ContentListNotes, baseURL: nil)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is ContentListVideos{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReferenceNotesCell.reuseIdentifier) as! TEReferenceNotesCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            cell.configureCell(model: self.arrOfContent[indexPath.row] as? ContentListVideos, baseURL: nil)
            
            return cell
            
            
        }else if self.arrOfContent[indexPath.row] is ContentListVideoInteractive{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReferenceNotesCell.reuseIdentifier) as! TEReferenceNotesCell
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            cell.configureCellForInteractiveVideo(model: self.arrOfContent[indexPath.row] as? ContentListVideoInteractive, baseURL: nil)
            
            return cell
            
            
        }else if self.arrOfContent[indexPath.row] is ContentListAssessment{
            
            let cell : TEAssesmentsCell = tableView.dequeueReusableCell(withIdentifier: TEAssesmentsCell.reuseIdentifier) as! TEAssesmentsCell
            
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            cell.setDataContentList(model: self.arrOfContent[indexPath.row] as? ContentListAssessment)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is ContentListAssignment{
            
            let cell : TEAssignmentsCell = tableView.dequeueReusableCell(withIdentifier: TEAssignmentsCell.reuseIdentifier) as! TEAssignmentsCell
            
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            cell.setDataContentList(model: self.arrOfContent[indexPath.row] as? ContentListAssignment)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is ContentListModule{
            
            let cell : TEModuleListCell = tableView.dequeueReusableCell(withIdentifier: TEModuleListCell.reuseIdentifier) as! TEModuleListCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            cell.configureCell(objet: self.arrOfContent[indexPath.row] as? ContentListModule)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is ContentListLiveClass{
            
            let cell : TELiveClassCell = tableView.dequeueReusableCell(withIdentifier: TELiveClassCell.reuseIdentifier) as! TELiveClassCell
            
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            cell.setDataContentList(model: self.arrOfContent[indexPath.row] as? ContentListLiveClass)
            
            return cell
            
        }else if self.arrOfContent[indexPath.row] is ContentListDiscussion{
            
            let cell : TEConcludedCell = tableView.dequeueReusableCell(withIdentifier: TEConcludedCell.reuseIdentifier) as! TEConcludedCell
            cell.delegate = self
            cell.indexOfCell = indexPath.row
            cell.configureCell(objet: self.arrOfContent[indexPath.row] as! ContentListDiscussion)
            
            return cell
            
        }else{
            
            let cell : TELecturersCell = tableView.dequeueReusableCell(withIdentifier: TELecturersCell.reuseIdentifier) as! TELecturersCell
            
            cell.indexPath = indexPath
            
            cell.delegate = self
            
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.arrOfContent[indexPath.row] is ContentListNotes {
            
            self.navigateNoteToDetail(indexPath:indexPath)
        }
            
        else if self.arrOfContent[indexPath.row] is ContentListVideos {
        
            self.navigateNoteToDetail(indexPath:indexPath)
        }
            
        else if self.arrOfContent[indexPath.row] is ContentListAssignment {
            
            self.openAssigmentDetail(indexPath: indexPath)
        }
            
        else if self.arrOfContent[indexPath.row] is ContentListAssessment {
            
            self.navigateToAssessmentDetail(indexPath: indexPath)
        }
        
        else if self.arrOfContent[indexPath.row] is ContentListModule {
        
            self.navigateToMuduleDetail(indexPath: indexPath)
        }
    }
}


//MARK: - Network Call

extension TEContentVC {
    
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
    
    func callWebserviceForContentList() {
        
        if let moduleID = self.moduleID , let userName = Utility.getLoginUserDetail()?.resultData?.user?.username {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["module_id"] = moduleID
            
            if self.stroke == true{
            
                if self.isULS() == true{
                    
                    dicParam["module_type"] = "1"
                }
            }
            
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
                                            
                                            //print("contentTypeID : ------> ",contentTypeID);
                                            
                                            if contentTypeID == 1{
                                                
                                                self.arrOfContent.append(ContentListNotes(object:dict))
                                                
                                            }else if contentTypeID == 2{
                                                
                                                self.arrOfContent.append(ContentListVideos(object:dict))
                                                
                                            }else if contentTypeID == 3{
                                                
                                                //print("contentTypeID JSON : ------> ",Utility.jsonToString(json: dict) ?? "");
                                                self.arrOfContent.append(ContentListVideoInteractive(object:dict))
                                                
                                            }else if contentTypeID == 4{
                                                
                                                self.arrOfContent.append(ContentListAssessment(object:dict))
                                                
                                            }else if contentTypeID == 5{
                                                
                                                self.arrOfContent.append(ContentListAssignment(object:dict))
                                                
                                            }else if contentTypeID == 6{
                                                
                                                self.arrOfContent.append(ContentListModule(object:dict))
                                                
                                            }else if contentTypeID == 7{
                                                
                                                self.arrOfContent.append(ContentListLiveClass(object:dict))
                                                
                                            } else if contentTypeID == 8{
                                                
                                                self.arrOfContent.append(ContentListDiscussion(object:dict))
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
                                            
                                            //print("contentTypeID : ------> ",contentTypeID);
                                            
                                            if contentTypeID == 1{
                                                
                                                self.arrOfContent.append(ContentListNotes(object:dict))
                                                
                                            }else if contentTypeID == 2{
                                                
                                                self.arrOfContent.append(ContentListVideos(object:dict))
                                                
                                            }else if contentTypeID == 3{
                                                
                                                //print("contentTypeID JSON : ------> ",Utility.jsonToString(json: dict) ?? "");
                                                self.arrOfContent.append(ContentListVideoInteractive(object:dict))
                                                
                                            }else if contentTypeID == 4{
                                                
                                                self.arrOfContent.append(ContentListAssessment(object:dict))
                                                
                                            }else if contentTypeID == 5{
                                                
                                                self.arrOfContent.append(ContentListAssignment(object:dict))
                                                
                                            }else if contentTypeID == 6{
                                                
                                                self.arrOfContent.append(ContentListModule(object:dict))
                                                
                                            }else if contentTypeID == 7{
                                                
                                                self.arrOfContent.append(ContentListLiveClass(object:dict))
                                                
                                            } else if contentTypeID == 8{
                                                
                                                self.arrOfContent.append(ContentListDiscussion(object:dict))
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
