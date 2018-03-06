//
//  TECourseListVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 16/09/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TECourseListVC: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    var courseModel:CourseModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitleForULS(title: "Dashboard")
        self.ulsRightBarItems()
        
        self.registerCellWithTable()
        self.callWebserviceForDashboardDetail()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func leftNavButtonDidClick(sender: UIButton) {
        
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForDashboardDetail()
    }

}

//MARK:- User Define

extension TECourseListVC{

    func registerCellWithTable() -> Void {
        
        self.tableView.addRefrehsControl(target: self)
        
        self.tableView.registerCellWithTable(nibName: TECourseListCell.nibName, reuseIdentifier: TECourseListCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TECourseListCell.nibName_Two, reuseIdentifier: TECourseListCell.reuseIdentifier_Two)
    }
    
    @IBAction func srmDidClick(sender:BCUIButton) -> Void{
        
        if let id = Utility.getLoginUserDetail()?.resultData?.counsellor?.id{
        
            let vc = TENewPostVC(nibName: "TENewPostVC", bundle: nil)
            vc.isCounsellor = true
            vc.isContactEditable = false
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else{
            
            Utility.showAlert(message: "SRM not assigned", title: nil, actions: nil, controller: self)
        }
        
    }
}


//MARK:- TableView Delegate and DataSaurce

extension TECourseListVC : UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.courseModel != nil{
            
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
        
            if let list = self.courseModel?.internalCourse{
                
                return list.count
            }
            return 0
            
        }else{
        
            if let list = self.courseModel?.externalCourse{
                
                return list.count
            }
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TECourseListCell.reuseIdentifier, for: indexPath) as! TECourseListCell
            cell.isCellTypeTwo = false
            cell.delegate = self
            cell.indexPath = indexPath
            if let list = self.courseModel?.internalCourse{
                
                cell.setInternalCourse(model: list[indexPath.item])
            }
            return cell
            
        }else{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TECourseListCell.reuseIdentifier_Two, for: indexPath) as! TECourseListCell
            
            cell.isCellTypeTwo = true
            cell.delegate = self
            cell.indexPath = indexPath
            
            if let list = self.courseModel?.externalCourse{
                
                cell.setExternalCourse(model: list[indexPath.item])
            }
            
            return cell
        }
    }
}

extension TECourseListVC:TECourseListCellDelegate {
    
    func didSelectSemester(model: Semester?, indexPath: IndexPath?) {
    
        if let model = model, let indexPath = indexPath {
            
            if let list = self.courseModel?.internalCourse{
            
                let listModel = list[indexPath.row]
                let vc = TEDashboardVC(nibName: "TEDashboardVC", bundle: nil)
                vc.semester = model
                vc.courseName = listModel.courseName
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
    }
    
    
    func didCareerstrokes(model: ExternalCourse?) {
        
        if let model = model {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let moduleVC = storyboard.instantiateViewController(withIdentifier: Utility.ID_ModuleVC) as! TEModuleVC
            
            moduleVC.setTitle(title: model.courseName ?? "Dashboard")
            moduleVC.batchID = model.id
            moduleVC.stroke = true
            self.navigationController?.pushViewController(moduleVC, animated: true)
            
        }
        
    }
    
    func didSelectInfo(description: String?) {
        
        if let des = description {
            
            Utility.showAlert(message: des, title: nil, actions: nil, controller: self)
        }
    }
}

//MARK:- Server Call

extension TECourseListVC {
    
    func callWebserviceForDashboardDetail() {
        
        self.startAnimating()
        
        let header = NSMutableDictionary();
        header["token"] = Utility.getLoginUserDetail()?.token ?? ""
        
        NetworkManager.httpPostRequest(.courseList, dataParam: nil, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Course Date : ------> ",Utility.jsonToString(json: data) ?? "Dashboard Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                    
                        if let resultData = data.value(forKey: "resultData"){
                            
                            self.courseModel = CourseModel(object: resultData)
                        }
                    
                    }
                }
                
            }
            
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
        })
    }
}
