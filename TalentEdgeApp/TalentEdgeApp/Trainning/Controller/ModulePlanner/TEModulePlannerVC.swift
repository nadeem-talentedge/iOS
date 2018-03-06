
//
//  TEModulePlanner.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 14/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEModulePlannerVC: BCUIViewController {

    
    @IBOutlet weak var tableView: BCUITableView!
    
    var contentId: String?
    var contentName: String?
    var descritionValue: String?
    
    var arrOfModulerPlannerList = Array<ModulePlannerListModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let contentName = self.contentName{
        
            self.setTitle(title: contentName)
        }
        
        self.tableView.registerCellWithTable(nibName: TEModulePlannerHeaderCell.nibName, reuseIdentifier: TEModulePlannerHeaderCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEModulePlannerCell.nibName, reuseIdentifier: TEModulePlannerCell.reuseIdentifier)
        
        self.callWebserviceForModulePlannerContentList()
        
        self.tableView.addRefrehsControl(target: self)
        // Do any additional setup after loading the view.
    }

    
        
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForModulePlannerContentList()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



extension TEModulePlannerVC : TEModulePlannerCellDelegate{
    
    func play_Click(indx: Int) {
        
        let modulePlanner = self.arrOfModulerPlannerList[indx]
        
        if let contentTypeID = Utility.AnyVaueToInt(value: modulePlanner.contentTypeId as AnyObject?) as? Int{
            
            
            if contentTypeID == 1{
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                obj.documentType = .PDF
                obj.contentId = modulePlanner.id
                
                self.navigationController?.pushViewController(obj, animated: true)
                
            }else if contentTypeID == 2{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                obj.documentType = .VIDEO
                obj.contentId = modulePlanner.id
                
                self.navigationController?.pushViewController(obj, animated: true)

                
            }else if contentTypeID == 3{
                
                //self.arrOfContent.append(ContentListVideoInteractive(object:dict))
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let obj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                obj.documentType = .VIDEO
                obj.contentId = modulePlanner.id
                
                self.navigationController?.pushViewController(obj, animated: true)
                
            }else if contentTypeID == 4{
                
                let obj = TEAssessmentDetailVC(nibName: "TEAssessmentDetailVC", bundle: nil)
                
                obj.contentId = modulePlanner.id
                
                self.navigationController?.pushViewController(obj, animated: true)
                
            }else if contentTypeID == 5{
                
                let controller = TEAssignmentDetailVC(nibName: "TEAssignmentDetailVC", bundle: nil)
                
                controller.contentId = modulePlanner.id
                
                self.navigationController?.pushViewController(controller, animated: true)
                
            }else if contentTypeID == 6{
                
                //self.arrOfContent.append(ContentListModule(object:dict))
                
            }else if contentTypeID == 7{
                
               // self.arrOfContent.append(ContentListLiveClass(object:dict))
                
            } else if contentTypeID == 8{
                
                //self.arrOfContent.append(ContentListDiscussion(object:dict))
            }
        }

    }
}
//MARK:- Tableview Delegate and DataSource

extension TEModulePlannerVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.arrOfModulerPlannerList.count + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TEModulePlannerHeaderCell.reuseIdentifier) as! TEModulePlannerHeaderCell
            
            cell.lblTitle.setText(text: self.contentName)
            
            cell.lblSubTitle.setText(text: self.descritionValue)
            
            return cell
            
        }else{
        
            let cell  = tableView.dequeueReusableCell(withIdentifier: TEModulePlannerCell.reuseIdentifier) as! TEModulePlannerCell
            
            let indxPath :Int = indexPath.row - 1
            cell.indexOfCell = indxPath
            cell.delegate = self
            cell.configureCell(objet: arrOfModulerPlannerList[indxPath])
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}



//MARK: - Network Call

extension TEModulePlannerVC {
    
    /*
     In Header token:XXXX
     In Data content_id:XX
     */
    
    func callWebserviceForModulePlannerContentList() {
        
        if let content_id = self.contentId {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = content_id
            
            let headerParam = NSMutableDictionary()
            //            headerParam["user_id"] =  userName
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getModulePlannerContentList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("getModulePlannerContentList : ------> ",Utility.jsonToString(json: data) ?? "");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfModulerPlannerList.removeAll()
                                
                                for dict in resultData{
                                    
                                    self.arrOfModulerPlannerList.append(ModulePlannerListModel(object:dict))
                                }
                                self.tableView.reloadData()
                            }
                            
                        }else{
                            
                            
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }
                    else{
                        
                        Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                
                
                if self.arrOfModulerPlannerList.count == 0{
                    self.tableView.backgroundView = Utility.nodataFoundView()
                }
                
                self.tableView.endRefreshing()
                self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
    }
}

//

