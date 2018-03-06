//
//  TETeacherDashboardVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 20/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import ASExtendedCircularMenu

class TETeacherDashboardVC: BCUIViewController {
    
    
    @IBOutlet weak var tableView: BCUITableView!
    @IBOutlet weak var btnBottom:ASCircularMenuButton!
    var semester:Semester?
    var dashbordData:DashbordBase?
    var baseViewController:UIViewController?
    
    let arrOfHeader = ["Active Course","Completed Course"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        if self.isELS(){
            
            self.btnBottom.isHidden = true
            
        }else{
            
            self.btnBottom.isHidden = false
            self.configureBottomMenu(sender: self.btnBottom)
        }
        
        self.setTitleForULS(title: "Dashboard")
        
        self.ulsNavigationBarBaseHomeRightButtons()
        
        self.tableView.registerCellWithTable(nibName: TETeacherOngoingCourseCell.nibName, reuseIdentifier: TETeacherOngoingCourseCell.reuseIdentifier)
        
        self.tableView.addRefrehsControl(target: self)
        
        self.callWebserviceForDashboardDetail()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
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

extension TETeacherDashboardVC {
    
    @IBAction func openMenu(sender:ASCircularMenuButton) -> Void{
        
    }
}


//MARK:- Tableview Delegate

extension TETeacherDashboardVC:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let data = self.dashbordData{
            
            return arrOfHeader.count
            
        }else{
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = self.dashbordData{
            
            if section == 0{
                
                if let facultyOngoing = data.facultyOngoingCourse{
                    
                    return facultyOngoing.count
                    
                }else{
                    
                    return 0
                }
            }else{
                
                if let facultyComplete = data.facultyCompletedCourse{
                    
                    return facultyComplete.count
                    
                }else{
                    
                    return 0
                }
            }
            
            
        }else{
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let title = self.arrOfHeader[section]
        
        if title == "Active Course"{
            
            let view = Bundle.main.loadNibNamed(ActiveTeacherHeader.nibName, owner: self, options: nil)?[0] as! ActiveTeacherHeader;
            
            view.lblName.setText(text: "\(Utility.getLoginUserDetail()?.resultData?.user?.fName ?? "") \(Utility.getLoginUserDetail()?.resultData?.user?.lName ?? "")");
            
            if let data = self.dashbordData{
                
                if let facultyOngoing = data.facultyOngoingCourse{
                    
                    view.lblDetail.setText(text: "Checkout your \(facultyOngoing.count) latest courses & their progress")
                }else{
                    
                    view.lblDetail.setText(text: "Checkout your 0 latest courses & their progress")
                }
            }else{
                
                view.lblDetail.setText(text: "Checkout your 0 latest courses & their progress")
            }
            return view;
            
        }else{
            
            let view = Bundle.main.loadNibNamed(TEDashboardTableHeader.nibName, owner: self, options: nil)?[0] as! TEDashboardTableHeader;
            
            view.lblTitle.setText(text: title);
            
            return view;
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TETeacherOngoingCourseCell.reuseIdentifier, for: indexPath) as! TETeacherOngoingCourseCell
        cell.indexPath = indexPath
        cell.delegate = self
        
        if indexPath.section == 0{
            
            if let facultyOngoing = self.dashbordData?.facultyOngoingCourse{
                
                cell.setOngoingCourse(model: facultyOngoing[indexPath.item])
            }
            
        }else{
            
            if let facultyComplete = self.dashbordData?.facultyCompletedCourse{
                
                cell.setCompletedCourse(model: facultyComplete[indexPath.item])
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let title = self.arrOfHeader[indexPath.section]
        
        if title == "Active Course"{
            
            if let ongoing = self.dashbordData?.facultyOngoingCourse{
                
                let model = ongoing[indexPath.row]
                
                self.navigate(indexNumber: 0, batchId: model.id, courseName: "\(model.courseName ?? "") -\(model.name ?? "")", bannerUrl: model.logo,isOngoing: true)
            }
            
        }else{
            
            if let ongoing = self.dashbordData?.facultyCompletedCourse{
                
                let model = ongoing[indexPath.row]
                
                self.navigate(indexNumber: 0, batchId: model.id, courseName: "\(model.courseName ?? "") -\(model.name ?? "")", bannerUrl: model.logo,isOngoing: false)
            }
        }
    }
}

//MARK:- OngoingCourseCellDelegate Delegate

extension TETeacherDashboardVC:TETeacherOngoingCourseCellDelegate {
    
    func didSelectOpetions(indexNumber: Int, indexPath: IndexPath?) {
        
        if let indexPath = indexPath {
            
            //["Active Course","Completed Course"]
            let title = self.arrOfHeader[indexPath.section]
            
            if title == "Active Course"{
                
                if let ongoing = self.dashbordData?.facultyOngoingCourse{
                    
                    let model = ongoing[indexPath.row]
                    
                    self.navigate(indexNumber: indexNumber, batchId: model.id, courseName: "\(model.courseName ?? "") -\(model.name ?? "")", bannerUrl: model.logo,isOngoing: true)
                }
                
            }else{
                
                if let ongoing = self.dashbordData?.facultyCompletedCourse{
                    
                    let model = ongoing[indexPath.row]
                    
                    self.navigate(indexNumber: indexNumber, batchId: model.id, courseName: "\(model.courseName ?? "") -\(model.name ?? "")", bannerUrl: model.logo,isOngoing: false)
                }
            }
        }
        
    }
    
    func navigate(indexNumber:Int,batchId:String?,courseName:String?,bannerUrl:String?,isOngoing:Bool) -> Void {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeVC = storyboard.instantiateViewController(withIdentifier: Utility.ID_HomeVC) as! HomeVC
        
        homeVC.baseViewController = self.baseViewController
        homeVC.indexNumber = indexNumber
        homeVC.batchID = batchId
        homeVC.batchName = courseName
        homeVC.bannerUrl = bannerUrl
        
        if isOngoing == true{
            
            homeVC.courceType = .ongoing
        }else{
            
            homeVC.courceType = .completed
        }
        
        if let controller = self.baseViewController{
            
            controller.navigationController?.pushViewController(homeVC, animated: true);
            
        }else{
            
            self.navigationController?.pushViewController(homeVC, animated: true);
        }
    }
}

//MARK:- Server Call

extension TETeacherDashboardVC {
    
    func callWebserviceForDashboardDetail() {
        
        self.startAnimating()
        
        let header = NSMutableDictionary()
        header["user_id"] = Utility.getLoginUserDetail()?.resultData?.user?.username ?? ""
        
        NetworkManager.httpPostRequest(.dashboard, dataParam: nil, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Teacher Dashboard Data : ------> ",Utility.jsonToString(json: data) ?? "Dashboard Error");
            
            if let data = self.parseData(data: data).0{
             
                self.dashbordData = DashbordBase(object: data)
            }
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
            
        } )
    }
}
