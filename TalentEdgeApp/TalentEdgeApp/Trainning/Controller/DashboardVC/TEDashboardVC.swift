//
//  TEDashboardVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 20/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import ASExtendedCircularMenu

class TEDashboardVC: BCUIViewController {

    @IBOutlet weak var btnBottom:ASCircularMenuButton!
    @IBOutlet weak var tableView: BCUITableView!
    var baseViewController:UIViewController?
    var semester:Semester?
    var courseName:String?
    var dashbordData:DashbordBase?
    
    let arrOfTrainings = ["Active Trainings","Completed Trainings","Recommended Trainings"]
    
    override func viewDidLoad() {
    
        super.viewDidLoad()

        if self.isELS() || self.isULS(){
            
            self.btnBottom.isHidden = true
            
            if self.isULS(){
                
                self.setTitle(title: self.courseName ?? "")
            }
        
        }else{
            
            self.btnBottom.isHidden = false
            self.configureBottomMenu(sender: self.btnBottom)
        }
        
        // Register Cell With Identifier
        self.tableView.addRefrehsControl(target: self)
        
        self.tableView.registerCellWithTable(nibName: TEActiveTrainningCell.nibName, reuseIdentifier: TEActiveTrainningCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TECompleteTrainingCell.nibName, reuseIdentifier: TECompleteTrainingCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TERecommndedTrainingCell.nibName, reuseIdentifier: TERecommndedTrainingCell.reuseIdentifier)
        
        self.callWebserviceForDashboardDetail()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForDashboardDetail()
    }
}

//MARK:- User Define

extension TEDashboardVC {
    
    @IBAction func openMenu(sender:ASCircularMenuButton) -> Void{
    }
}

//MARK:- Tableview Delegate

extension TEDashboardVC:UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
     
        return self.arrOfTrainings.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if let data = self.dashbordData{
            
            if section == 0 {
                
                if let ongoingCourse = data.ongoingCourse{
                
                    if ongoingCourse.count > 0{
                
                        return 50.0
                    
                    }else{
                    
                        return 0.0
                    }
                    
                }else{
                
                    return 0.0
                }
                
                
            }else if section == 1{
                
                if let completedCourse = data.completedCourse{
                
                    if completedCourse.count > 0{
                
                        return 44.0
                        
                    }else{
                    
                        return 0
                    }
                }else{
                
                    return 0
                }
                
                
            }else{
                
                if let suggestedCourse = data.suggestedCourse{
                
                    if suggestedCourse.count > 0{
                    
                        return 44.0
                    }else{
                    
                        return 0.0
                    }
                }else{
                
                    return 0.0
                }
            }
            
        }else{
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if self.isULS() {
            
            let view = Bundle.main.loadNibNamed(TEDashboardTableHeader.nibName, owner: self, options: nil)?[0] as! TEDashboardTableHeader;
            
            view.lblTitle.setText(text: self.semester?.semesterName);
            return view;
            
        } else if isLMS(){
            
                let title = self.arrOfTrainings[section]
                
                if title == "Active Trainings"{
                    
                    let view = Bundle.main.loadNibNamed(ActiveTeacherHeader.nibName, owner: self, options: nil)?[0] as! ActiveTeacherHeader;
                    
                    view.lblName.setText(text: "\(Utility.getLoginUserDetail()?.resultData?.user?.fName ?? "") \(Utility.getLoginUserDetail()?.resultData?.user?.lName ?? "")");
                    
                    if let data = self.dashbordData{
                        
                        if let ongoing = data.ongoingCourse{
                            
                            view.lblDetail.setText(text: "Checkout your \(ongoing.count) latest courses & their progress")
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
        else{
        
            let view = Bundle.main.loadNibNamed(TEDashboardTableHeader.nibName, owner: self, options: nil)?[0] as! TEDashboardTableHeader;
            
            view.lblTitle.setText(text: self.arrOfTrainings[section]);
            return view;
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = self.dashbordData{
            
            if section == 0 {
                
                if let ongoingCourse = data.ongoingCourse{
                    
                    return ongoingCourse.count
                    
                }else{
                    
                    return 0
                }
                
                
            }else if section == 1{
                
                if let completedCourse = data.completedCourse{
                    
                    return completedCourse.count
                    
                }
                else{
                    
                    return 0
                }
                
                
            }else{
                
                if let suggestedCourse = data.suggestedCourse{
                    
                        return suggestedCourse.count
                }
                else{
                    
                    return 0
                }
            }
            
        }else{
        
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
     
        if indexPath.section == 0 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TEActiveTrainningCell.reuseIdentifier, for: indexPath) as! TEActiveTrainningCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            if let data = self.dashbordData?.ongoingCourse{
            
                cell.setData(data:data[indexPath.row])
            }
            return cell;
            
        }else if indexPath.section == 1{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TECompleteTrainingCell.reuseIdentifier, for: indexPath) as! TECompleteTrainingCell
            cell.delegate = self
            return cell
            
        }else{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TERecommndedTrainingCell.reuseIdentifier, for: indexPath) as! TERecommndedTrainingCell
            cell.recomndedData = self.dashbordData?.suggestedCourse
            return cell;
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeVC = storyboard.instantiateViewController(withIdentifier: Utility.ID_HomeVC) as! HomeVC
        
        homeVC.baseViewController = self.baseViewController
        
        if indexPath.section == 0 {
        
            
            
            if let data = self.dashbordData?.ongoingCourse{
                
                if data.count > 0 {
                    
                    homeVC.batchID = data[indexPath.row].id
                    
                    homeVC.batchName = "\((data[indexPath.row].courseName ?? "")) - \((data[indexPath.row].name ?? ""))"
                    
                    homeVC.courceType = .ongoing
                    homeVC.bannerUrl = data[indexPath.row].bannerUrl
                }
            }
        }else{
           
            if let data = self.dashbordData?.completedCourse{
                
                if data.count > 0 {
                    
                    homeVC.batchID = data[indexPath.row].id
                    
                    homeVC.batchName = "\((data[indexPath.row].courseName ?? "")) - \((data[indexPath.row].name ?? ""))"
                    
                    homeVC.courceType = .completed
                    homeVC.bannerUrl = data[indexPath.row].bannerUrl
                }
            }
        }
        
        if let controller = self.baseViewController{
            
            controller.navigationController?.pushViewController(homeVC, animated: true);
        }else{
            
            self.navigationController?.pushViewController(homeVC, animated: true);
        }
        
    }
}

//MARK:- Active Training Delegate

extension TEDashboardVC :TEActiveTrainningCellDelegate {

    func navigate(indexNumber:Int,indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath{
            
            if let data = self.dashbordData?.ongoingCourse{
                
                if data.count > 0 {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let model = data[indexPath.row]
                    
                    let homeVC = storyboard.instantiateViewController(withIdentifier: Utility.ID_HomeVC) as! HomeVC
                    
                    homeVC.baseViewController = self.baseViewController
                    homeVC.indexNumber = indexNumber
                    homeVC.batchID = model.id
                    homeVC.batchName = model.courseName
                    homeVC.bannerUrl = model.bannerUrl
                    homeVC.courceType = .ongoing
                    
                    if let controller = self.baseViewController{
                        
                        controller.navigationController?.pushViewController(homeVC, animated: true);
                        
                    }else{
                        
                        self.navigationController?.pushViewController(homeVC, animated: true);
                    }
                }
            }
        }
    }
    
    func didSelectShareButton() {
    }
    
    func didSelectOpetion(indexPath: IndexPath?, key: String?) {
    
        if let key = key {
            
            if key == "complete module"{
                
                self.navigate(indexNumber: 1, indexPath: indexPath)
                
            }else if key == "live class"{
                
                self.navigate(indexNumber: 2, indexPath: indexPath)
                
            }
            else if key == "attendance"{
                
                self.navigate(indexNumber: 3, indexPath: indexPath)
            }
                
            else if key == "assignments"{
                
                self.navigate(indexNumber: 4, indexPath: indexPath)
            }
                
            else if key == "assessments"{
                
                self.navigate(indexNumber: 5, indexPath: indexPath)
            }
            else if key == "discussion"{
                
                self.navigate(indexNumber: 7, indexPath: indexPath)
            }
            else if key == "learners"{
                
                self.navigate(indexNumber: 6, indexPath: indexPath)
            }
            else{
                
            }
            
        }
    }
}


//MARK:- Completed Trainning Delegate

extension TEDashboardVC: TECompleteTrainingCellDelegate{


    func menuButtonDidClick() -> Void{}
    func starButtonDidClick() -> Void{}
    func shareButtonDidClick() -> Void{}
    func chatButtonDidClick() -> Void{}
}

//MARK:- Server Call

extension TEDashboardVC {
    
    func callWebserviceForDashboardDetail() {
        
        
        print("semesterId----------------->",self.semester?.semesterId ?? "NA")
        
        self.startAnimating()
        
        let dict = NSMutableDictionary()
        dict["semester_id"] = self.semester?.semesterId ?? ""
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.dashboard, dataParam: dict, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Dashbord Data : ------> ",Utility.jsonToString(json: data) ?? "Dashboard Error");
            
            if let data = self.parseData(data: data).0{
                
                self.dashbordData = DashbordBase(object: data)
                
            }
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
            
        } )
        
    }
}
