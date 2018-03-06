//
//  LernersVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 27/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TELernersVC: BCUIViewController {

    var baseViewController:UIViewController?
    
    var batchID:String?
    var batchName:String?
    
    var arrOfLearnerList = Array<Any>()
    @IBOutlet weak var tableView: BCUITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let batchName = self.batchName{
            
            self.setTitle(title: batchName)
        }
        
        self.tableView.addRefrehsControl(target: self)
        
        if self.isTeacherLogin() == true {
            
            self.tableView.registerCellWithTable(nibName: TETeacherLernersCell.nibName, reuseIdentifier: TETeacherLernersCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                self.callWebserviceForLearnerList()
            }
            
            
        }else{
        
            self.tableView.registerCellWithTable(nibName: TELernersCell.nibName, reuseIdentifier: TELernersCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                self.callWebserviceForLearnerList()
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForLearnerList()
    }
}



extension TELernersVC : TELernersCellDelegate,TETeacherLernersCellDelegate{
    
    
    func learnerChatButtonDidClick(indexPath: IndexPath?) {
        
        self.openChat(indexPath: indexPath)
    }
    
    func teacherLearnerProfileButtonDidClick(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            if let model = arrOfLearnerList[indexPath.row]
                as? TeacherLearner{
                
                let vc = TEUserProfileVC(nibName: "TEUserProfileVC", bundle: nil)
                vc.isEdit = false
                
                if let name = model.name{
                
                    let strSplitArray = name.split(separator: " ")
                    vc.fname = String(strSplitArray.first ?? "" )
                    vc.lname = String(strSplitArray.last ?? "")
                }
                vc.imageURL = model.image
                
                if let controller = self.baseViewController{
                    
                    controller.navigationController?.pushViewController(vc, animated: true);
                    
                }else{
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    func teacherLearnerChatButtonDidClick(indexPath: IndexPath?) {
        
        self.openChat(indexPath: indexPath)
    }
    
    func openChat(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath {

            let obj = TEDiscussionChatVC(nibName: "TEDiscussionChatVC", bundle: nil)
            
            if self.isTeacherLogin() == true {
                
                if let discussionObj = arrOfLearnerList[indexPath.row]
                    as? TeacherLearner{
                    
                    obj.setTitle(title: discussionObj.name ?? "")
                    obj.content_id = discussionObj.id
                }
                
            }else{
              
                let discussionObj = arrOfLearnerList[indexPath.row]
                
                if discussionObj is BatchStudentModel {
                    
                    let model = discussionObj as! BatchStudentModel
                    
                    obj.setTitle(title: model.name ?? "")
                    obj.content_id = model.id
                }
            }
            if let controller = self.baseViewController{
                
                controller.navigationController?.pushViewController(obj, animated: true);
            }
            
            
        }
    }
}

extension TELernersVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfLearnerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isTeacherLogin() == true {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherLernersCell.reuseIdentifier) as! TETeacherLernersCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.cellConfiguration(model: arrOfLearnerList[indexPath.row] as? TeacherLearner)
            
            return cell
            
        }else{
        
            let cell : TELernersCell = tableView.dequeueReusableCell(withIdentifier: TELernersCell.reuseIdentifier) as! TELernersCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.cellConfiguration(model: arrOfLearnerList[indexPath.row])
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.openChat(indexPath: indexPath)
    }
}



//MARK: - Network Call

extension TELernersVC {
    
    /*
     In Header token:XXXX 
     In Data batch_id:3
     */
    
    func callWebserviceForLearnerList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getBatchStudentsListing, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Learner List : ------> ",data?.string() ?? "LearnerList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfLearnerList.removeAll()
                                
                                for dict in resultData{
                                    
                                    if dict is NSDictionary{
                                
                                        let dictAsDictionary = dict as! NSDictionary
                                        
                                        if let isSelf = dictAsDictionary.value(forKey: "self") as? Int {
                                            
                                            if isSelf == 1{
                                            
                                                if self.isTeacherLogin() == true {
                                                    
                                                    self.arrOfLearnerList.append(TeacherLearner(object: dictAsDictionary))
                                                    
                                                    
                                                }else{
                                                  
                                                    self.arrOfLearnerList.append(SelfBatchStudentModel(object: dictAsDictionary))
                                                    
                                                }
                                            }else{
                                            
                                                if self.isTeacherLogin() == true {
                                                 
                                                    self.arrOfLearnerList.append(TeacherLearner(object: dictAsDictionary))
                                                }
                                                else{
                                                  
                                                    self.arrOfLearnerList.append(BatchStudentModel(object: dictAsDictionary))
                                                }
                                            }
                                        }
                                    }
                                }
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                
                
                if self.arrOfLearnerList.count == 0{
                    self.tableView.backgroundView = Utility.nodataFoundView()
                }
                
                self.tableView.endRefreshing()
                self.stopAnimating()
                
                
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id not available", title: AppName, actions: nil, controller: self)
        }
        
    }
}
