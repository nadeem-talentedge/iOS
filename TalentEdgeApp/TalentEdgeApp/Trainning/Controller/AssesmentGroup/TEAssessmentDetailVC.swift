//
//  TEAssignmentDetailVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 23/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEAssessmentDetailVC: BCUIViewController {
    
    @IBOutlet weak var tableview: BCUITableView!
    
    var contentId:String?
    var contentName: String?
    
    var assessmentDetailModel:AssessmentDetailModel?
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        if let contentName = self.contentName{
            
            self.setTitle(title: contentName)
        }
        
        // Register cell with tableview
        
        self.tableview.registerCellWithTable(nibName: TEHeaderCell.nibName, reuseIdentifier: TEHeaderCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TEAssessmentDetailCell.nibName, reuseIdentifier: TEAssessmentDetailCell.reuseIdentifier)
        
        self.tableview.backgroundColor = UIColor.white
        self.tableview.isHidden = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.callWebserviceForViewAssessment()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


// MARK: - tableview delegate & datasource

extension TEAssessmentDetailVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.assessmentDetailModel != nil{
            
            return 2
            
        }else{
            
            //return 0
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            let cell : TEHeaderCell = tableView.dequeueReusableCell(withIdentifier: TEHeaderCell.reuseIdentifier) as! TEHeaderCell
            
            if let assessment = self.assessmentDetailModel{
                
                cell.lblTitle.setText(text: assessment.content?.title)
                
                cell.btnType.setText(text: "  Assessment")
                
                cell.btnStartDate.setText(text: "\((assessment.content?.startDate ?? "")) - \((assessment.content?.endDate ?? ""))")
            }
            
            return cell
        }
        else {
            
            let cell : TEAssessmentDetailCell = tableView.dequeueReusableCell(withIdentifier: TEAssessmentDetailCell.reuseIdentifier) as! TEAssessmentDetailCell
            cell.delegate = self
            cell.setData(model: self.assessmentDetailModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - Assessment Detail Call Delegate


extension TEAssessmentDetailVC: TEAssessmentDetailCellDelegate {
    
    func delegateStartQuizButtonDidSelect(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEQuizVC) as! TEQuizVC
        obj.contentId = self.contentId
        obj.contentName = self.contentName
        obj.testType = .new
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    func delegateReattemptButtonDidSelect() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEQuizVC) as! TEQuizVC
        obj.contentId = self.contentId
        obj.contentName = self.contentName
        obj.testType = .review
        self.navigationController?.pushViewController(obj, animated: true)
    }
}

//MARK: - Network Call

extension TEAssessmentDetailVC {
    
    func callWebserviceForViewAssessment() {
        
        if let moduleID = self.contentId , let token = Utility.getLoginUserDetail()?.token {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            headerParam["token"] =  token
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.assesmentView, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("ViewAssessment : ------> ",data ?? "ViewAssessment Error");
                
                if let resultData = self.parseData(data: data).0 as? NSDictionary{
                    
                    self.assessmentDetailModel = AssessmentDetailModel(object: resultData)
                    self.tableview.reloadData()
                    self.tableview.isHidden = false
                }
                
                self.stopAnimating()
            })
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
}
