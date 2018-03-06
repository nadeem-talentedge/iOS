//
//  TEAssignmentsVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEAssignmentsVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    var baseViewController:UIViewController?
    
    var batchID:String?
    var batchName:String?
    
    var arrOfAssignmentList = Array<AssignmentListBase>()
    var arrOfTeacherAssignmentList = Array<TeacherAssignmentModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let batchName = self.batchName{
            
            self.setTitle(title: batchName)
        }

        self.tableview.addRefrehsControl(target: self)
        
        if self.isTeacherLogin() == true {
            
            self.tableview.registerCellWithTable(nibName: TETeacherAssignmentsCell.nibName, reuseIdentifier: TETeacherAssignmentsCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                self.callWebserviceForTeacherAssignmentList()
            }
            
            
            
        }else{
        
            self.tableview.registerCellWithTable(nibName: TEAssignmentsCell.nibName, reuseIdentifier: TEAssignmentsCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                self.callWebserviceForAssignmentList()
            }
            
        }
    }

    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        if self.isTeacherLogin() == true {
            
            self.callWebserviceForTeacherAssignmentList()
            
        }else{
            
            self.callWebserviceForAssignmentList()
        }
        
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


extension TEAssignmentsVC : TEAssignmentsCellDelegate {
    
    
    func selectAssignment(indexPath: IndexPath?) {
        
        self.openAssigmentDetail(indexPath: indexPath)
    }

    func openAssigmentDetail(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath{
        
            let assignmentModel = self.arrOfAssignmentList[indexPath.row]
            
            let controller = TEAssignmentDetailVC(nibName: "TEAssignmentDetailVC", bundle: nil)
            
            controller.contentId = assignmentModel.id
            controller.contentName = assignmentModel.title
            
            if let nav = self.baseViewController{
                
                nav.navigationController?.pushViewController(controller, animated: true)
                
            }else{
            
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        
    }
}


extension TEAssignmentsVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if self.isTeacherLogin() == true {
            
             return self.arrOfTeacherAssignmentList.count
            
        }else{
        
            return self.arrOfAssignmentList.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isTeacherLogin() == true {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherAssignmentsCell.reuseIdentifier) as! TETeacherAssignmentsCell
            
            cell.setTeacherAssignmentData(model: self.arrOfTeacherAssignmentList[indexPath.item])
            
            return cell
            
        }else{
    
            let cell = tableView.dequeueReusableCell(withIdentifier: TEAssignmentsCell.reuseIdentifier) as! TEAssignmentsCell
            
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            let assignmentModel = self.arrOfAssignmentList[indexPath.row]
            
            cell.setDataTraining(model: assignmentModel)
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if self.isTeacherLogin() == true {
           
            let vc = TETeacherAssignmentDetailVC(nibName: "TETeacherAssignmentDetailVC", bundle: nil)
            vc.batchID = self.batchID
            vc.teacherAssignmentModel = self.arrOfTeacherAssignmentList[indexPath.item]
            
            if let base = self.baseViewController{
                
                base.navigationController?.pushViewController(vc, animated: true)
                
            }else{
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }else{
        
            self.openAssigmentDetail(indexPath: indexPath)
        }
        
    }
}


//MARK: - Network Call

extension TEAssignmentsVC {
    
    /*
     In Header token:XXXX
     In Data batch_id:XX
     */
    
    func callWebserviceForTeacherAssignmentList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            dicParam["content_type_id"] = "5"
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.facultyContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Teacher AssignmentList : ------> ",data?.string() ?? "AssignmentList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                for dict in resultData{
                                    
                               self.arrOfTeacherAssignmentList.append(TeacherAssignmentModel(object:dict))
                                }
                            }
                            
                        }
                        
                    }
                }
                
                self.tableview.reloadData()
                
                if self.arrOfTeacherAssignmentList.count <= 0{
                    self.tableview.backgroundView = Utility.nodataFoundView()
                }
                
                self.tableview.endRefreshing()
                
                self.stopAnimating()
            })
            
        }
    }
    
    func callWebserviceForAssignmentList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.assignmentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("AssignmentList : ------> ",data ?? "AssignmentList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfAssignmentList.removeAll()
                                 
                                 for dict in resultData{
                                 
                                 self.arrOfAssignmentList.append(AssignmentListBase(object:dict))
                                 }
                                
                            }
                            
                        }
                    }
                }
                
                self.tableview.reloadData()
                
                if self.arrOfAssignmentList.count == 0{
                    
                    self.tableview.backgroundView = Utility.nodataFoundView()
                }
                self.tableview.endRefreshing()
                self.stopAnimating()
            })
        }
        
    }
    
}
