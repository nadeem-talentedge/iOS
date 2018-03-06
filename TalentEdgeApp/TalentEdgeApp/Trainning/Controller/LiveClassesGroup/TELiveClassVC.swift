//
//  TELiveClassVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 26/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TELiveClassVC: BCUIViewController {

    var baseViewController:UIViewController?
    
    lazy var arrOfLiveClassList = Array<LiveClassListBase>()
    lazy var arrOfLiveClassListTeacher = Array<TeacherLiveClassModel>()
    
    var batchID:String?
    var batchName:String?
    
    var objLiveClass : LiveClassListModel?
    
    @IBOutlet weak var attendedValue: BCUILabel!
    @IBOutlet weak var totalClassValue: BCUILabel!
    @IBOutlet weak var tableview: BCUITableView!
    @IBOutlet weak var headerView: BCView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let batchName = self.batchName{
        
            self.setTitle(title: batchName)
        }
        
        self.tableview.addRefrehsControl(target: self)
        
        if self.isTeacherLogin() == true {
        
            headerViewHeight.constant = 0
            self.headerView.isHidden = true
            self.tableview.registerCellWithTable(nibName: TETeacherLiveClassCell.nibName, reuseIdentifier: TETeacherLiveClassCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                self.callWebserviceForLiveClassListForTeacher()
            }
            
            
            
        }else{
        
            headerViewHeight.constant = 44
            self.headerView.isHidden = false
            
            self.tableview.registerCellWithTable(nibName: TELiveClassCell.nibName, reuseIdentifier: TELiveClassCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                self.callWebserviceForLiveClassList()
            }
            
        }
    }

    func refreshTable(_ sender:AnyObject) -> Void {
        
        if self.isTeacherLogin() == true {
           
            self.callWebserviceForLiveClassListForTeacher()
            
        }else{
        
            self.callWebserviceForLiveClassList()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension TELiveClassVC : TELiveClassCellDelegate{
    
    func selectLiveClass(indexPath: IndexPath?) {
    
        self.joinLiveClass(indexPath: indexPath)
    }

    
    func joinLiveClass(indexPath: IndexPath?) {
     
        if let indexPath = indexPath{
        
          let model = self.arrOfLiveClassList[indexPath.row]
           self.callWebserviceForLiveClassURL(contentId: model.id)
        }
    }
}

extension TELiveClassVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isTeacherLogin() == true {
        
            return arrOfLiveClassListTeacher.count
            
        }else{
        
            return arrOfLiveClassList.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30.0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TELiveClassHeaderView.nibName, owner: self, options: nil)?[0] as! TELiveClassHeaderView;
        
        view.heading.setText(text: "SCHEDULED");
        
        return view;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isTeacherLogin() == true {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherLiveClassCell.reuseIdentifier) as! TETeacherLiveClassCell
            cell.setTeacherLiveClassData(model: self.arrOfLiveClassListTeacher[indexPath.item])
            return cell
            
        }else{
            
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TELiveClassCell.reuseIdentifier) as! TELiveClassCell
            
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            cell.setDataTraining(model: self.arrOfLiveClassList[indexPath.row])
            
            return cell
        }
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.isTeacherLogin() == true {
            
            let vc = TETeacherLiveClassDetailVC(nibName: "TETeacherLiveClassDetailVC", bundle: nil)
            vc.isLiveClass = true
            vc.batchID = self.batchID
            vc.liveClass = self.arrOfLiveClassListTeacher[indexPath.item]
            
            if let baseVC = self.baseViewController{
            
                baseVC.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}


//MARK: - Network Call


extension TELiveClassVC {
    
    func callWebserviceForLiveClassURL(contentId:String?) {
        
        if let batchID = self.batchID, let contentId = contentId {
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["batch_id"] = batchID
            dicParam["content_id"] = contentId
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
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
                        
                        //Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForLiveClassList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getLiveClassList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("LiveClassList List : ------> ",data ?? "LiveClassList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                self.objLiveClass = LiveClassListModel(object: resultData)
                                
                                self.totalClassValue.isHidden = false
                                self.attendedValue.isHidden = false
                                
                                //liveClass Model Update ... Live Class Attendance issue solved
                                
                                if let totalClassCount = self.objLiveClass?.totalClassCount{
                                        self.totalClassValue.setText(text: String(totalClassCount))
                                }
                                
                                if let attendedValue = self.objLiveClass?.totalAttendanceCount{
                                    self.attendedValue.setText(text: String(attendedValue))
                                }
                                
                                if let live_class = resultData.value(forKey: "live_class") as? NSArray{
                                    
                                    self.arrOfLiveClassList.removeAll()
                                    
                                    for dict in live_class{
                                        self.arrOfLiveClassList.append(LiveClassListBase(object:dict))
                                    }
                                }
                                
                                
                                
                                self.tableview.reloadData()
                            }
                            
                        }else{
                            
                            
                            self.totalClassValue.isHidden = true
                            self.attendedValue.isHidden = true
                            
                            
                            
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }
                    else{
                        
                        self.totalClassValue.isHidden = true
                        self.attendedValue.isHidden = true
                    }
                    
                }
                
                
                if self.arrOfLiveClassList.count == 0{
                    
                    self.tableview.backgroundView = Utility.nodataFoundView()
                }
                
                self.tableview.endRefreshing()
                self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForLiveClassListForTeacher() {
        
        if let batchID = self.batchID {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            dicParam["content_type_id"] = "7"
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.facultyContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("LiveClassList List Teacher: ------> ",data?.string() ?? "LiveClassList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfLiveClassListTeacher.removeAll()
                                for model in resultData {
                                
                                    self.arrOfLiveClassListTeacher.append(TeacherLiveClassModel(object: model))
                                }
                            }
                            
                        }else{
                            
                            self.totalClassValue.isHidden = true
                            self.attendedValue.isHidden = true
                        }
                        
                    }
                    else{
                        
                        self.totalClassValue.isHidden = true
                        self.attendedValue.isHidden = true
                    }
                }
                
                if self.arrOfLiveClassListTeacher.count == 0{
                    
                    self.tableview.backgroundView = Utility.nodataFoundView()
                }
                self.tableview.reloadData()
                self.tableview.endRefreshing()
                self.stopAnimating()
            })
            
        }
    }
}
