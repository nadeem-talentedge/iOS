//
//  TETeacherAssessmentDetailVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 25/09/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TETeacherAssessmentDetailVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    var batchID:String?
    var teacherAssessmentModel:TeacherAssessmentModel?
    var teacherAssessmentContentModel:TeacherAssessmentContentModel?
    var arrStudentAttemptInfo = Array<StudentAttemptInfoModel>()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableview.registerCellWithTable(nibName: TETeacherAssesmentsCell.nibName, reuseIdentifier: TETeacherAssesmentsCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEStudentAttemptInfoCell.nibName, reuseIdentifier: TEStudentAttemptInfoCell.reuseIdentifier)
        
        self.callWebserviceForTeacherAssessmentDetail()
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

//MARK:- TableView Deleagte and DataSource

extension TETeacherAssessmentDetailVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
            
        }else{
            
            return self.arrStudentAttemptInfo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherAssesmentsCell.reuseIdentifier) as! TETeacherAssesmentsCell
            
            if let model = self.teacherAssessmentModel{
            
                cell.setTecherAssessmentData(model:model)
            }else{
                
                cell.setTecherAssessmentContentData(model: teacherAssessmentContentModel)
            }
            return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEStudentAttemptInfoCell.reuseIdentifier) as! TEStudentAttemptInfoCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            cell.setData(model: self.arrStudentAttemptInfo[indexPath.item])
            
            return cell
        }
    }
    
}

extension  TETeacherAssessmentDetailVC:TEStudentAttemptInfoCellDelegate{
    
    func profileButtonDidClick(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = arrStudentAttemptInfo[indexPath.row]
            
            let vc = TEUserProfileVC(nibName: "TEUserProfileVC", bundle: nil)
            vc.isEdit = false
            vc.email = model.email
            vc.imageURL = model.pic
            
            if let name = model.name{
                
                let strSplitArray = name.split(separator: " ")
                vc.fname = String(strSplitArray.first ?? "" )
                vc.lname = String(strSplitArray.last ?? "")
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK:- Server Call
extension TETeacherAssessmentDetailVC {
    
    func callWebserviceForTeacherAssessmentDetail() {
        
        if let batchID = self.batchID {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            dicParam["content_type_id"] = "4"
            
            if let model = self.teacherAssessmentModel{
            
                dicParam["content_id"] = model.id ?? "0"
                
            }else{
                
                dicParam["content_id"] = self.teacherAssessmentContentModel?.id ?? "0"
            }
            
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.facultyContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("TeacherAssessmentDetail: ------> ",data?.string() ?? "NA");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as?
                                NSDictionary{
                                
                                if let student_attempt_info = resultData.value(forKey: "student_attempt_info") as? NSArray{
                                    
                                    for info in student_attempt_info{
                                        
                                     self.arrStudentAttemptInfo.append(StudentAttemptInfoModel(object: info))
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
