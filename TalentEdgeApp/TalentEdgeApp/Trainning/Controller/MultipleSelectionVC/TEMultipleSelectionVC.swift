//
//  TEMultipleSelectionVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

enum Type {
    
    case batch
    case batchUser
    case contacts
    case content
}

protocol TEMultipleSelectionVCDelegate {
    
    func didSelect(list:Array<TEMultipleSelectionModel>,type:Type)
}

class TEMultipleSelectionVC: BCUIViewController {

    @IBOutlet weak var tableView:BCUITableView!
    @IBOutlet weak var btnApply:BCUIButton!
    @IBOutlet weak var btnReset:BCUIButton!
    
    var type = Type.contacts
    var id:String?
    
    var delegate:TEMultipleSelectionVCDelegate?
    
    var list = Array<TEMultipleSelectionModel>(){
        
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerCellWithTable()
        
        if self.type == .batch{
            
            if self.list.count <= 0 {
            
                self.getBatchDetail()
            }
            
        }else if self.type == .batchUser {
            
            if self.list.count <= 0 {
            
                self.getBatchUserList()
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCellWithTable() -> Void {
        
        self.tableView.estimatedSectionHeaderHeight = 2.0
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        self.tableView.backgroundColor = UIColor.white
        self.tableView.registerCellWithTable(nibName: TEMultipleSelectionCell.nibName, reuseIdentifier: TEMultipleSelectionCell.reuseIdentifier)
        
    }
    
    @IBAction func apply(sender:BCUIButton) -> Void {
        
        if let delegate = self.delegate{
        
            delegate.didSelect(list: self.list,type: self.type)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func reset(sender:BCUIButton) -> Void {
        
        for model in list{
        
            model.isSelected = false
        }
        self.tableView.reloadData()
    }
}

extension TEMultipleSelectionVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableViewAutomaticDimension;
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TESearchBarHeader.nibName, owner: self, options: nil)?[0] as! TESearchBarHeader;
        return view;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TEMultipleSelectionCell.reuseIdentifier, for: indexPath) as! TEMultipleSelectionCell
        
        cell.delegate = self
        
        cell.indexPath = indexPath
        
        let model = self.list[indexPath.row]
        
        cell.lblTitle.setText(text: model.title)
        
        cell.btnCheckBox.isSelected = model.isSelected
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.manageSelection(indexPath: indexPath)
    }
    
}

extension TEMultipleSelectionVC:TEMultipleSelectionCellDelegate{

    func checkBoxDidClick(indexPath: IndexPath?) {
        
        self.manageSelection(indexPath: indexPath)
    }
    
    func manageSelection(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath{
        
            let model = self.list[indexPath.row]
            
            model.isSelected = !model.isSelected
            
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK:- Server Call

extension TEMultipleSelectionVC {
    
    func getBatchDetail() {
        
        
        //print("semesterId----------------->",self.semester?.semesterId ?? "NA")
        
        self.startAnimating()
        
        let dict = NSMutableDictionary()
        //dict["semester_id"] = self.semester?.semesterId ?? ""
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.dashboard, dataParam: dict, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Dashbord Data : ------> ",Utility.jsonToString(json: data) ?? "Dashboard Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        if let resultData = data.value(forKey: "resultData") as? NSDictionary {
                            
                            if self.isTeacherLogin() {
                                
                                if let arr = resultData.value(forKey: "facultyOngoingCourse") as? NSArray{
                                    
                                    self.list.removeAll()
                                    
                                    for dict in arr {
                                        
                                        if let dict  = dict as? NSDictionary{
                                            
                                            let model = TEMultipleSelectionModel()
                                            
                                            model.title = dict.value(forKey:"name") as? String
                                            
                                            model.id = dict.value(forKey:"id") as? String
                                            
                                            self.list.append(model)
                                        }
                                    }
                                }
                                
                            }else{
                            
                                if let arr = resultData.value(forKey: "ongoingCourse") as? NSArray{
                                    
                                    self.list.removeAll()
                                    
                                    for dict in arr {
                                        
                                        if let dict  = dict as? NSDictionary{
                                            
                                            let model = TEMultipleSelectionModel()
                                            
                                            model.title = dict.value(forKey:"name") as? String
                                            
                                            model.id = dict.value(forKey:"id") as? String
                                            
                                            self.list.append(model)
                                        }
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }
            }
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
            
        } )
    }
    
    func getBatchUserList() {
        
        
        //print("semesterId----------------->",self.semester?.semesterId ?? "NA")
        
        self.startAnimating()
        
        let dict = NSMutableDictionary()
        dict["batch_id"] = self.id ?? ""
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.finduserbybatch, dataParam: dict, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Dashbord Data : ------> ",Utility.jsonToString(json: data) ?? "Dashboard Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        if let resultData = data.value(forKey: "resultData") as? NSDictionary {
                            
                            if let arr = resultData.value(forKey: "student") as? NSArray{
                                
                                self.list.removeAll()
                                
                                for dict in arr {
                                    
                                    if let dict  = dict as? NSDictionary{
                                        
                                        let model = TEMultipleSelectionModel()
                                        
                                        model.title = dict.value(forKey:"name") as? String
                                        
                                        model.id = dict.value(forKey:"id") as? String
                                        
                                        self.list.append(model)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
            
        } )
    }
}
