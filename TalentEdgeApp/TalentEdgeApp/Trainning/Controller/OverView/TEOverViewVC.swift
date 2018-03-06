//
//  TEOverViewVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEOverViewVC: BCUIViewController {

    
    @IBOutlet weak var tableView: BCUITableView!
    var baseViewController:UIViewController?
    var batchID:String?
    var onGoingCource = Array<OngoingCourse>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerCellWithTable(nibName: TEOverviewCell.nibName, reuseIdentifier: TEOverviewCell.reuseIdentifier)
        
        self.tableView.addRefrehsControl(target: self)
        self.callWebserviceForDashboardDetail()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForDashboardDetail()
    }

}




extension TEOverViewVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TEOverviewCell = tableView.dequeueReusableCell(withIdentifier: TEOverviewCell.reuseIdentifier) as! TEOverviewCell
        
        cell.setData(model: self.onGoingCource[indexPath.row])
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
}

//MARK:- Server Call

extension TEOverViewVC {
    
    func callWebserviceForDashboardDetail() {
        
        self.startAnimating()
        
        let header = NSMutableDictionary();
        header["user_id"] = Utility.getLoginUserDetail()?.resultData?.user?.username ?? ""
        
        NetworkManager.httpPostRequest(.dashboard, dataParam: nil, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Dashbord Data For Overview : ------> ",data ?? "Overview Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        if let resultData = data.value(forKey: "resultData") as? NSDictionary {
                            
                            if let ongoingCourse = resultData.value(forKey: "ongoingCourse") as? NSArray{
                                
                                self.onGoingCource.removeAll()
                                
                                for cource in ongoingCourse {
                                    
                                    if let dict = cource as? NSDictionary{
                                        
                                        if let id = dict.value(forKey: "id") as? String{
                                            
                                            print("\n  cource -------->",self.batchID ?? "NS",id)
                                            
                                            if id == (self.batchID ?? ""){
                                                
                                                self.onGoingCource.append(OngoingCourse(object: dict))
                                            }
                                        }
                                    }
                                    
                                    //self.dashbordData = DashbordBase(object: resultData)
                                }
                                
                            }
                        }
                    }
                }
            }
            
            
            if self.onGoingCource.count == 0{
                self.tableView.backgroundView = Utility.nodataFoundView()
            }
            
            self.tableView.reloadData()
            self.tableView.endRefreshing()
            self.stopAnimating()
            
        } )
    }
}
