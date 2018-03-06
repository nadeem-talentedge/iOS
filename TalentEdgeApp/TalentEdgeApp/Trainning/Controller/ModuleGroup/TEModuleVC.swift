//
//  TEModuleVC.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 20/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEModuleVC: BCUIViewController {
    
    @IBOutlet weak var tableView: BCUITableView!
    var baseViewController:UIViewController?
    var arrOfModule = Array<ModuleBase>()
    var batchID:String?
    var stroke = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerCellWithTable(nibName: TEModuleCell.nibName, reuseIdentifier: TEModuleCell.reuseIdentifier)
        
        self.tableView.addRefrehsControl(target: self)
        
        self.callWebserviceForModule()
    }
    
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForModule()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
    
}

extension TEModuleVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfModule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TEModuleCell = tableView.dequeueReusableCell(withIdentifier: TEModuleCell.reuseIdentifier) as! TEModuleCell
        
        let module = self.arrOfModule[indexPath.row]
        cell.configureCell(moduleData: module)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //TEContentTeacherVC
        if self.isTeacherLogin() == true {
           
            let module = self.arrOfModule[indexPath.row]
            
            let obj = TEContentTeacherVC(nibName: "TEContentTeacherVC", bundle: nil)
            
            obj.moduleID = module.id
            obj.batchID = self.batchID
            obj.moduleName = module.name
            
            obj.baseViewController = self.baseViewController
            
            if let controller = self.baseViewController{
                
                controller.navigationController?.pushViewController(obj, animated: true);
                
            }else{
                
                self.navigationController?.pushViewController(obj, animated: true);
            }
            
            
        }else{
        
            let module = self.arrOfModule[indexPath.row]
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEContentVC) as! TEContentVC
            
            obj.moduleID = module.id
            obj.batchID = self.batchID
            obj.moduleName = module.name
            obj.stroke = self.stroke
            obj.baseViewController = self.baseViewController
            
            if let controller = self.baseViewController{
                
                controller.navigationController?.pushViewController(obj, animated: true);
                
            }else{
                
                self.navigationController?.pushViewController(obj, animated: true);
            }
        }
        
        
    }
}


//MARK: - Network Call

extension TEModuleVC {
    
    /*
     In Header
     deviceType: Android / IOS / WEB
     user_id: XXXX token: XXXX
     
     In Body
     batch_id:XX
     */
    
    func callWebserviceForModule() {
        
        if let batchID = self.batchID , let userName = Utility.getLoginUserDetail()?.resultData?.user?.username {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            
            let headerParam = NSMutableDictionary()
            headerParam["user_id"] =  userName
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getModuleList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                //print("Module : ------> ",data ?? "Module Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                            
                                self.arrOfModule.removeAll()
                                
                                for dict in resultData{
                                
                                    self.arrOfModule.append(ModuleBase(object:dict))
                                }
                                
                            }
                        }
                    }
                }
                
                if self.arrOfModule.count == 0{
                    
                    self.tableView.backgroundView = Utility.nodataFoundView()
                }
                
                self.tableView.endRefreshing()
                self.tableView.reloadData()
                self.stopAnimating()
            })
        }
    }
}
