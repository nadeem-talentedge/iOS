//
//  TETeacherLiveClassDetailVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 24/09/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TETeacherLiveClassDetailVC: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    var isLiveClass = true
    
    var liveClassContent:TeacherLiveClassContentModel?
    var liveClass:TeacherLiveClassModel?
    var attendence:TeacherAttendenceModel?
    var arrStudentSessionInfo = Array<StudentSessionInfoModel>()
    var batchID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        
        self.tableView.registerCellWithTable(nibName: TEStudentSessionInfoCell.nibName, reuseIdentifier: TEStudentSessionInfoCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TETeacherLiveClassCell.nibName, reuseIdentifier: TETeacherLiveClassCell.reuseIdentifier)
        
        self.callWebserviceForTeacherLiveClassDetail()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- TableView Deleagte and DataSource

extension TETeacherLiveClassDetailVC : UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
       return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
        
            return 1
            
        }else{
            
           return self.arrStudentSessionInfo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //
        
        if indexPath.section == 0{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherLiveClassCell.reuseIdentifier) as! TETeacherLiveClassCell
            
            if self.isLiveClass == true{
            
                if let model = self.liveClass{
                
                    cell.setTeacherLiveClassData(model:self.liveClass)
                    
                }else{
                    
                    cell.setTeacherLiveClassContentData(model: self.liveClassContent)
                }
                
                
            }else{
                
                cell.setTeacherLAttendanceData(model: self.attendence)
            }
            return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEStudentSessionInfoCell.reuseIdentifier) as! TEStudentSessionInfoCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            cell.setStudentSessionData(model: self.arrStudentSessionInfo[indexPath.item])
            return cell
        }
    }
}



//MARK:- Server Call
extension TETeacherLiveClassDetailVC : TEStudentSessionInfoCellDelegate {
    
    func profileDetail(indexPath: IndexPath?) {
     
        if let  indexPath  = indexPath{
            
            let model = self.arrStudentSessionInfo[indexPath.row]
            
            let vc = TEUserProfileVC(nibName: "TEUserProfileVC", bundle: nil)
            vc.isEdit = false
            vc.email = model.email
            vc.fname = model.fname
            vc.lname = model.lname
            vc.imageURL = model.pic
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func didSelectMessage(indexPath:IndexPath?) -> Void{
        
        if let  indexPath  = indexPath{
        
            let controller = TENewPostVC(nibName: "TENewPostVC", bundle: nil)
            controller.isContactEditable = false
            
            let batch = TEMultipleSelectionModel()
            batch.isSelected = true
            batch.id = self.batchID ?? "0="
            
            if self.isLiveClass == true{
                
                if self.liveClass != nil{
                    
                    batch.title = self.liveClass?.moduleName
                    
                    
                }else{
                   
                    batch.title = self.liveClassContent?.moduleName
                }
                
                
            }else{
               
                batch.title = self.attendence?.moduleName
            }
            controller.batch.append(batch)
            
            
            let model = self.arrStudentSessionInfo[indexPath.row]
            let student = TEMultipleSelectionModel()
            student.isSelected = true
            student.id = model.id
            student.title = "\(model.fname ?? "") \(model.lname ?? "")"
            
            controller.batchUser.append(student)
            
            if let vc = self.navigationController{
                
                vc.pushViewController(controller, animated: true)
            }
        }
    }
}

//MARK:- Server Call
extension TETeacherLiveClassDetailVC {
    
    func callWebserviceForTeacherLiveClassDetail() {
        
        if let batchID = self.batchID {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            dicParam["content_type_id"] = "7"
            
            if self.isLiveClass == true{
                
                dicParam["content_id"] = self.liveClass?.id ?? self.liveClassContent?.id
                
            }else{
            
                dicParam["content_id"] = self.attendence?.id ?? "0"
            }
            
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.facultyContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("LiveClass Detail Teacher: ------> ",data?.string() ?? "NA");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as?
                                NSDictionary{
                                
                                if let sessionInfo = resultData.value(forKey: "student_session_info") as? NSArray{
                                    
                                    for info in sessionInfo{
                                       self.arrStudentSessionInfo.append(StudentSessionInfoModel(object: info))
                                    }
                                    
                                }
                            }
                            
                        }
                        
                    }
                }
                self.tableView.reloadData()
                self.tableView.endRefreshing()
                self.stopAnimating()
            })
            
        }
    }
}
