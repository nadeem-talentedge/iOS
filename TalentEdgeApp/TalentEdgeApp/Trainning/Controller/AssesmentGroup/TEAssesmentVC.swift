//
//  TEAssesmentVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEAssesmentVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    var baseViewController:UIViewController?
    
    var batchID:String?
    var batchName:String?
    
    lazy var arrOfAssessmentLis = Array<AssessmentListBase>()
    lazy var arrOfTeacherAssessmentList = Array<TeacherAssessmentModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let batchName = self.batchName{
            
            self.setTitle(title: batchName)
        }
        
        self.tableview.addRefrehsControl(target: self)
        
        if self.isTeacherLogin() == true {
            
            self.tableview.registerCellWithTable(nibName: TETeacherAssesmentsCell.nibName, reuseIdentifier: TETeacherAssesmentsCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
                self.callWebserviceForTeacherAssesmentList()
            }
            
            
        }else{
        
            self.tableview.registerCellWithTable(nibName: TEAssesmentsCell.nibName, reuseIdentifier: TEAssesmentsCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
                self.callWebserviceForAssesmentList()
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        if self.isTeacherLogin() == true {
           
            self.callWebserviceForTeacherAssesmentList()
            
        }else{
        
            self.callWebserviceForAssesmentList()
        }
        
    }
    
    func openDetail(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath {
            
            let content = self.arrOfAssessmentLis[indexPath.row]
            
            let obj = TEAssessmentDetailVC(nibName: "TEAssessmentDetailVC", bundle: nil)
            
            obj.contentId = content.content?.id
            
            obj.contentName = content.content?.title
            
            if let nav = self.baseViewController{
                
                nav.navigationController?.pushViewController(obj, animated: true)
                
            }else{
            
                self.navigationController?.pushViewController(obj, animated: true)
            }
        }
    }
}

//MARK:- TableView Delegate

extension TEAssesmentVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isTeacherLogin() == true {
            
            return self.arrOfTeacherAssessmentList.count
            
        }else{
        
            return self.arrOfAssessmentLis.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isTeacherLogin() == true {
         
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherAssesmentsCell.reuseIdentifier) as! TETeacherAssesmentsCell
            
            cell.setTecherAssessmentData(model: self.arrOfTeacherAssessmentList[indexPath.item])
            return cell
            
        }else{
        
            let cell : TEAssesmentsCell = tableView.dequeueReusableCell(withIdentifier: TEAssesmentsCell.reuseIdentifier) as! TEAssesmentsCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            cell.setDataTraining(model: self.arrOfAssessmentLis[indexPath.row],batchName: self.batchName)
            
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.isTeacherLogin() == true {
            
            let vc = TETeacherAssessmentDetailVC(nibName: "TETeacherAssessmentDetailVC", bundle: nil)
            vc.batchID = self.batchID
            vc.teacherAssessmentModel = self.arrOfTeacherAssessmentList[indexPath.item]
            
            if let base = self.baseViewController{
                
                base.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        }else{
        
            self.openDetail(indexPath: indexPath)
        }
        
    }
}

extension TEAssesmentVC : TEAssesmentsCellDelegate {
    
    func selectAssessment(indexPath : IndexPath?) -> Void{
    
        self.openDetail(indexPath: indexPath)
    }
}

//MARK:- Network Call

extension TEAssesmentVC {
    
    func callWebserviceForTeacherAssesmentList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            dicParam["content_type_id"] = "4"
            
            let headerParam = NSMutableDictionary()
            //            headerParam["user_id"] =  userName
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.facultyContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Teacher AssesmentList : -------------> ",data?.string() ?? "assesmentList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfAssessmentLis.removeAll()
                                
                                for dict in resultData{
                                    
                                   self.arrOfTeacherAssessmentList.append(TeacherAssessmentModel(object:dict))
                                }
                                
                            }
                            
                        }
                    }
                }
                
                self.tableview.reloadData()
                
                if self.arrOfTeacherAssessmentList.count == 0{
                    
                    self.tableview.backgroundView = Utility.nodataFoundView()
                }
                
                self.tableview.endRefreshing()
                self.stopAnimating()
            })
        }
    }
    
    func callWebserviceForAssesmentList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()

            self.startAnimating()
            
            NetworkManager.httpPostRequest(.assesmentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("AssesmentList : -------------> ",data ?? "assesmentList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfAssessmentLis.removeAll()
                                
                                for dict in resultData{
                                    
                                    self.arrOfAssessmentLis.append(AssessmentListBase(object:dict))
                                }
                                
                            }
                            
                        }
                    }
                }
                
                self.tableview.reloadData()
                
                if self.arrOfAssessmentLis.count == 0{
                    
                    self.tableview.backgroundView = Utility.nodataFoundView()
                }
                self.tableview.endRefreshing()
                self.stopAnimating()
            })
        }
    }
}
