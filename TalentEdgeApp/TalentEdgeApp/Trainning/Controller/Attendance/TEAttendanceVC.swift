//
//  TELiveClassDetailVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEAttendanceVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    var baseViewController:UIViewController?
    
    var batchID:String?
    var batchName:String?
    
    var attendanceObj : TEAttendanceModel?
    
    lazy var arrOfAttendance = Array<LiveSessionAttendance>()
    lazy var arrOfAttendanceTeacher = Array<TeacherAttendenceModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let batchName = self.batchName{
            
            self.setTitle(title: batchName)
        }
        
        self.tableview.addRefrehsControl(target: self)
        
        if self.isTeacherLogin() == true {
            
            self.tableview.registerCellWithTable(nibName: TETeacherLiveClassCell.nibName, reuseIdentifier: TETeacherLiveClassCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
                self.callWebserviceForTeacherAttendance()
            }
            
            
        }else{
         
            self.tableview.registerCellWithTable(nibName: TELiveClassCell.nibName, reuseIdentifier: TELiveClassCell.reuseIdentifier)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
                self.callWebserviceForAttendance()
            }
            
        }
        
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForAttendance()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TEAttendanceVC : TELiveClassCellDelegate{
    
    func selectLiveClass(indexPath: IndexPath?) {
        
    }
}

extension TEAttendanceVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isTeacherLogin() == true {
        
            return self.arrOfAttendanceTeacher.count
            
        }else{
            
            if let attendence = self.attendanceObj?.liveSessionAttendance{
                
                return attendence.count
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if self.isTeacherLogin() == true {
            
            return 0
        }else{
        
            return 300.0;
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TEAttendanceView.nibName, owner: self, options: nil)?[0] as! TEAttendanceView;
        view.setData(object: attendanceObj)
        return view;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isTeacherLogin() == true {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherLiveClassCell.reuseIdentifier) as! TETeacherLiveClassCell
            
            cell.setTeacherLAttendanceData(model: self.arrOfAttendanceTeacher[indexPath.item])
            
            return cell
            
        }else{
    
            let cell : TELiveClassCell = tableView.dequeueReusableCell(withIdentifier: TELiveClassCell.reuseIdentifier) as! TELiveClassCell
            cell.delegate = self
            
            if let attendence = self.attendanceObj?.liveSessionAttendance{
                
                cell.setDataAttendence(model: attendence[indexPath.row])
            }
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if self.isTeacherLogin() == true {
            
            let vc = TETeacherLiveClassDetailVC(nibName: "TETeacherLiveClassDetailVC", bundle: nil)
            vc.isLiveClass = false
            vc.batchID = self.batchID
            vc.attendence = self.arrOfAttendanceTeacher[indexPath.item]
            
            if let baseVC = self.baseViewController{
                
                baseVC.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}



//MARK: - Network Call

extension TEAttendanceVC {
    
    /*
     In Header token:XXXX
     In Data batch_id:XX
     */
    
    func callWebserviceForAttendance() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.myAttendance, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Attendance List : ------> ",data ?? "Attendance Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                self.attendanceObj = TEAttendanceModel(object: resultData)
                                
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
    
    func callWebserviceForTeacherAttendance() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getLiveClassAttendance, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                //print("Attendance Teacher : ------> ",data?.string() ?? "Attendance Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                if let liveSessionAttendance = resultData.value(forKey: "liveSessionAttendance") as? NSArray{
                                    
                                    self.arrOfAttendanceTeacher.removeAll()
                                    
                                    for model in liveSessionAttendance{
                                  self.arrOfAttendanceTeacher.append(TeacherAttendenceModel(object: model))
                                        
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
        }else{
            
            print("------------Attendence Batch ID NIL-------")
        }
    }
}
