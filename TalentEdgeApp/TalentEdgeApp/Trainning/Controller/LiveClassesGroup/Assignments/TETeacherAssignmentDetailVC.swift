//
//  TETeacherAssignmentDetailVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 25/09/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TETeacherAssignmentDetailVC: BCUIViewController {

    @IBOutlet weak var btnCompleteGrading: BCUIButton!
    @IBOutlet weak var heightCompleteGrading: NSLayoutConstraint!
    
    @IBOutlet weak var tableview: BCUITableView!
    var teacherAssignmentModel:TeacherAssignmentModel?
    var teacherAssignmentContentModel:TeacherAssignmentContentModel?
    var arrStudenSubmissionInfo = Array<StudentSubmissionInfoModel>()
    var batchID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = self.teacherAssignmentModel {
            
            if self.isGradingDone(value: data.isGradingDone){
                
                self.btnCompleteGrading.isHidden = true
                self.heightCompleteGrading.constant = 0
                
            }else{
                
                self.btnCompleteGrading.isHidden = false
                self.heightCompleteGrading.constant = 44
            }
            
        }else{
            
            self.btnCompleteGrading.isHidden = true
            self.heightCompleteGrading.constant = 0
        }
        
        
        self.tableview.registerCellWithTable(nibName: TETeacherAssignmentsCell.nibName, reuseIdentifier: TETeacherAssignmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEStudentSubmissionInfoCell.nibName_Online_R, reuseIdentifier: TEStudentSubmissionInfoCell.reuseIdentifier_Online_R)
        
        self.tableview.registerCellWithTable(nibName: TEStudentSubmissionInfoCell.nibName_Online_NR, reuseIdentifier: TEStudentSubmissionInfoCell.reuseIdentifier_Online_NR)
        
        self.tableview.registerCellWithTable(nibName: TEStudentSubmissionInfoCell.nibName_Offline, reuseIdentifier: TEStudentSubmissionInfoCell.reuseIdentifier_Offline)
        
        self.callWebserviceForTeacherAssignmentDetail()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func isReceived(value:String?) -> Bool{
        
        if let value = value{
            
            if value.isEmpty == true{
                
                return false
            }else{
                
                if value == "1"{
                    
                    return true
                    
                }else{
                    
                    return false
                }
            }
            
        }else{
            
            return false
        }
    }
    
    func isOnline(value:String?) -> Bool{
        
        if let value = value{
            
            if value.isEmpty == true{
                
                return false
            }else{
                
                if value.lowercased() == "Online".lowercased(){
                    
                    return true
                    
                }else{
                    
                    return false
                }
            }
            
        }else{
            
            return false
        }
    }
    
    func isGraded(value:String?) -> Bool{
        
        if let value = value{
            
            if value.isEmpty == true{
                
                return false
            }else{
                
                if value.lowercased() == "Graded".lowercased(){
                    
                    return true
                    
                }else{
                    
                    return false
                }
            }
            
        }else{
            
            return false
        }
    }
    
    func isGradingDone(value:String?) -> Bool{
        
        if let value = value{
            
            if value.isEmpty == true{
                
                return false
            }else{
                
                if value.lowercased() == "1".lowercased(){
                    
                    return true
                    
                }else{
                    
                    return false
                }
            }
            
        }else{
            
            return false
        }
    }
    
    func getReuseIdentifier(mode:String?,submissionID:String?) -> String {
        
        if let mode = mode{
            
            if self.isOnline(value: mode){
              
                if let id = submissionID{
                    
                    if id.isEmpty == false{
                   
                        return TEStudentSubmissionInfoCell.reuseIdentifier_Online_R
                        
                    }else{
                   
                        return TEStudentSubmissionInfoCell.reuseIdentifier_Online_NR
                    }
                }else{
                    
                    return TEStudentSubmissionInfoCell.reuseIdentifier_Online_NR
                }
            }else{
                
               return TEStudentSubmissionInfoCell.reuseIdentifier_Offline
            }
            
        }
        return TEStudentSubmissionInfoCell.reuseIdentifier_Offline
    }
    
    @IBAction func completeGrading(sender:UIButton) -> Void{
        
        self.updateGrading()
    }
}

//MARK:- TableView Deleagte and DataSource

extension TETeacherAssignmentDetailVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
            
        }else{
            
            return self.arrStudenSubmissionInfo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherAssignmentsCell.reuseIdentifier) as! TETeacherAssignmentsCell
            
            if let data = self.teacherAssignmentModel {
            
                cell.setTeacherAssignmentData(model: data)
                
            }else{
            
                cell.setTeacherAssignmenContentData(model: self.teacherAssignmentContentModel)
            }
            
            
            return cell
            
        }else{
            
            let model = arrStudenSubmissionInfo[indexPath.item]
            
            if let data = self.teacherAssignmentModel {
               
                let identifier = self.getReuseIdentifier(mode: data.submissionMode, submissionID: model.submissionId)
                
                //print("Cell -------->",identifier)
                
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TEStudentSubmissionInfoCell
                
                cell.delegate = self
                cell.indexPath = indexPath
                
                if isOnline(value: data.submissionMode){
                
                    cell.setOnlineData(model: model, isGraded: self.isGraded(value: data.isGraded))
                    
                }else{
                    
                    cell.setOfflineData(model: model, isGraded: self.isGraded(value: data.isGraded))
                }
                return cell
            }else{
                
                if let data = self.teacherAssignmentContentModel{
                    
                    let identifier = self.getReuseIdentifier(mode: data.submissionMode, submissionID: model.isReceived)
                    
                    //print("Cell -------->",identifier)
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TEStudentSubmissionInfoCell
                    
                    cell.delegate = self
                    cell.indexPath = indexPath
                    
                    if isOnline(value: data.submissionMode){
                        
                        cell.setOnlineData(model: model, isGraded: self.isGraded(value: data.isGraded))
                        
                    }else{
                        
                        cell.setOfflineData(model: model, isGraded: self.isGraded(value: data.isGraded))
                    }
                    return cell
                }
            }
            return BCUITableViewCell()
        }
    }
    
}

extension TETeacherAssignmentDetailVC: TEStudentSubmissionInfoCellDelegate{
    
    func profileButtonDidClick(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = arrStudenSubmissionInfo[indexPath.row]
            
            let vc = TEUserProfileVC(nibName: "TEUserProfileVC", bundle: nil)
            vc.isEdit = false
            vc.email = model.email
            vc.fname = model.fname
            vc.lname = model.lname
            vc.imageURL = model.pic
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func openDocButtonDidClick(indexPath: IndexPath?) {
        
        if let indexPath = indexPath {
        
            let model = arrStudenSubmissionInfo[indexPath.item]
            self.callServiceForDownloadingFile(path: model.uploadPath)
        }
        
    }
    
    func recievedButtonDidClick(indexPath: IndexPath?) {
        
        if let indexPath = indexPath {
           
            //print("--------------------> ",indexPath.item)
            
            let model = arrStudenSubmissionInfo[indexPath.item]
            
            if let data = self.teacherAssignmentModel {
                
                if self.isReceived(value: model.isReceived) == false{
                
                    /*
                     content_id: XXXX
                     user_id: XXXX
                     marks: XXXX
                     */
                    
                    if self.isGraded(value: data.isGraded){
                        
                        var inputTextField: UITextField?
                        
                        let altForgot = UIAlertController(title: AppName, message:"Please Enter marks", preferredStyle: .alert)
                        
                        altForgot.addTextField { textField -> Void in
                            // you can use this text field
                            textField.keyboardType = .numbersAndPunctuation
                            inputTextField = textField
                        }
                        
                        
                        /*****OK Action******/
                        altForgot.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction)in
                            
                            let dict = NSMutableDictionary()
                            dict.setValue(data.id, forKey: "content_id")
                            
                            dict.setValue(inputTextField?.text, forKey: "marks")
                            dict.setValue(model.userId, forKey: "user_id")
                            
                            self.updateMarks(dictParam: dict)
                            
                        }))
                        
                        altForgot.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (UIAlertAction)in
                            
                            altForgot.dismiss(animated: true, completion: nil)
                        }))
                        
                        self.present(altForgot, animated: true, completion: nil)
                        
                    }else{
                        
                        let dict = NSMutableDictionary()
                        dict.setValue(data.id, forKey: "content_id")
                        
                        dict.setValue("0", forKey: "marks")
                        
                        dict.setValue(model.userId, forKey: "user_id")
                        
                        self.updateMarks(dictParam: dict)
                    }
                }
                
            }
        }
    }
}

//MARK:- Server Call

extension TETeacherAssignmentDetailVC {
    
    func updateGrading() {
        
        self.startAnimating()
        
        let dict = NSMutableDictionary()
        
        dict.setValue(self.batchID, forKey: "batch_id")
        dict.setValue("5", forKey: "content_type_id")
        dict.setValue(self.teacherAssignmentModel?.id, forKey: "content_id")
        dict.setValue("1", forKey: "grading_done")
        
        let headerParam = NSMutableDictionary()
        
        NetworkManager.httpPostRequest(.facultyContentList, dataParam: dict, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("TeacherAssignmentDetail: ------> ",data?.string() ?? "NA");
            
            if let data = data{
                
                if let isSuccess = data.value(forKey: "status") as? Bool{
                    
                    if isSuccess == true{
                        
                        self.teacherAssignmentModel?.isGradingDone = "1"
                        
                    }else{
                        
                        if let message = data.value(forKey: "message") as? String{
                            
                            Utility.showAlert(message: message, title: nil, actions: nil, controller: self)
                        }
                    }
                    
                }
            }
            self.tableview.reloadData()
            self.stopAnimating()
        })
    }
    
    func updateMarks(dictParam:NSMutableDictionary) {
        
        self.startAnimating()
        let headerParam = NSMutableDictionary()
        
        NetworkManager.httpPostRequest(.reviewAssignmentMarks, dataParam: dictParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("TeacherAssignmentDetail: ------> ",data?.string() ?? "NA");
            
            if let data = data{
                
                if let isSuccess = data.value(forKey: "status") as? Bool{
                    
                    if isSuccess == true{
                    
                        self.callWebserviceForTeacherAssignmentDetail()
                        
                    }else{
                        
                        if let message = data.value(forKey: "message") as? String{
                            
                            Utility.showAlert(message: message, title: nil, actions: nil, controller: self)
                        }
                    }
                    
                }
            }
            self.stopAnimating()
        })
    }
    
    func callWebserviceForTeacherAssignmentDetail() {
        
        if let batchID = self.batchID {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            dicParam["content_type_id"] = "5"
            
            if let data = self.teacherAssignmentModel {
                
                dicParam["content_id"] = data.id ?? "0"
                
            }else{
            
                dicParam["content_id"] = self.teacherAssignmentContentModel?.id ?? "0"
            }
            
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.facultyContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("TeacherAssignmentDetail: ------> ",data?.string() ?? "NA");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as?
                                NSDictionary{
                            
                                self.arrStudenSubmissionInfo.removeAll()
                                
                                if let student_submission_info = resultData.value(forKey: "student_submission_info") as? NSArray{
                                    
                                    for info in student_submission_info{
                                        
                                        self.arrStudenSubmissionInfo.append(StudentSubmissionInfoModel(object: info))
                                    }
                                }
                            }
                            
                        }
                        
                    }
                }
                
                self.tableview.reloadData()
                self.tableview.endRefreshing()
                self.stopAnimating()
            })
            
        }
    }
}
