//
//  TETestimonialsVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TETestimonialsVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    var batchID:String?
    var arrOfTestimonial = Array<TestimonialListBase>()
    var baseViewController:UIViewController?
    
    @IBOutlet weak var viewAddtestimonial: BCView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableview.registerCellWithTable(nibName: TETestimonialsCell.nibName, reuseIdentifier: TETestimonialsCell.reuseIdentifier)
        
        self.tableview.addRefrehsControl(target: self)
        // Do any additional setup after loading the view.
    }

    func refreshTable(_ sender:AnyObject) -> Void {
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.callWebserviceForTestimonialList()
       // self.callWebserviceForDeleteTestimonial(indx: 0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addTestonomialButtonDidClick(_ sender: UIButton) {
        
        let  addTestimonial = TEAddTestimonialVC(nibName: "TEAddTestimonialVC", bundle: nil)
        addTestimonial.batchID = self.batchID
        
        if let vc = self.baseViewController{
            
            vc.navigationController?.pushViewController(addTestimonial, animated: true)
        }
        
    }

}


extension TETestimonialsVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfTestimonial.count
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        let object = self.arrOfTestimonial[indexPath.row]
        if object.allowDelete == 1{
            return true
        }
        else{
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            self.callWebserviceForDeleteTestimonial(indx: indexPath.row)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TETestimonialsCell = tableView.dequeueReusableCell(withIdentifier: TETestimonialsCell.reuseIdentifier) as! TETestimonialsCell
        cell.delegate = self
        cell.indexOfCell = indexPath.row
        cell.configureCell(object: arrOfTestimonial[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension TETestimonialsVC : TETestimonialsCellDelegate{
    
    func showMore_Click(indexOfCell : Int,isShowMore : Bool) {
        
        let selectobject = self.arrOfTestimonial[indexOfCell]
        
        var status : String?
        
        if isShowMore == true{
            
            status = "YES"
        }
        else{
            status = "NO"
        }
        
        self.arrOfTestimonial.filter({$0.id == selectobject.id}).forEach { $0.showMore = status }
        
        let indexpath = IndexPath(row: indexOfCell, section: 0)
        
        self.tableview.reloadRows(at: [indexpath], with: .top)
        
    }
}


//MARK: - Network Call

extension TETestimonialsVC {
    
    
    
    
    /*In Header token:XXXX
     In Data batch_id:XX*/
    
    func callWebserviceForDeleteTestimonial(indx : Int) {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.testimonialDelete, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("testimonial Delete  : ------> ",data ?? "testimonialDelete Error");
                
                if let data = data{
                    //{"status":0,"code":100,"message":"Success"}
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            self.arrOfTestimonial.remove(at: indx)
                            self.tableview.reloadData()
                        }
                        
                    }else{
                        
                        let message : String =  data.value(forKey: "message")  as! String
                        Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                    }
                    
                }
                else{
                    
                    Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                }
                
                
                if self.arrOfTestimonial.count == 0 {
                    self.tableview.isHidden = true
                }
                else{
                    self.tableview.isHidden = false
                }
                
                self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
        
        
        
        
    }
    
    
    
    
    /*
     In Header token:XXXX
     In Data batch_id:XX
     */
    
    func callWebserviceForTestimonialList() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.testimonials, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("testimonials List : ------> ",data ?? "TestimonialList Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSArray{
                                
                                self.arrOfTestimonial.removeAll()
                                
                                for dict in resultData{
                                    
                                    self.arrOfTestimonial.append(TestimonialListBase(object:dict))
                                }
                                self.tableview.reloadData()
                                
                                
                                
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
                
                
                
                if self.arrOfTestimonial.count == 0{
                    self.tableview.backgroundView = Utility.nodataFoundView()
                            self.tableview.isHidden = true
                    }
                    else{
                        self.tableview.isHidden = false
                    }
                

                
                self.tableview.endRefreshing()
                self.stopAnimating()
            })
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
        
        
        
        
        
    }
}
