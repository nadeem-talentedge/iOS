//
//  TERefferal.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TERefferalVC: BCUIViewController {

    var baseViewController:UIViewController?
    
    @IBOutlet weak var tableView: BCUITableView!
    
    var refferalModel:RFRefferalModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        #if ELSA
            print("No Color")
            
        #else
            self.tableView.backgroundColor = UIColor(colorLiteralRed: 220.0/255.0, green: 238.0/255.0, blue: 240.0/255.0, alpha: 1.0)
            
        #endif
        
        
        
        self.registerCellWithTableView()
        
        self.callWebserviceRefferals()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK:- User Define
extension TERefferalVC {
    
    func registerCellWithTableView() -> Void {
        
        
        self.tableView.estimatedSectionHeaderHeight = 2.0
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        self.tableView.registerCellWithTable(nibName: TERefferalCell.nibName, reuseIdentifier: TERefferalCell.reuseIdentifier)
    }
}

//MARK:- Refferal Cell

extension TERefferalVC:TERefferalCellDelegate{
    
    func loadMoreAndLess(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
        
            self.tableView.reloadRows(at: [indexPath], with: .top)
        }
        
    }
}

#if ELSA
    
//MARK:- Tableview Delegate
extension TERefferalVC :UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let model = self.refferalModel{
            
            return (model.referralInfo?.count)!
            
        }else{
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableViewAutomaticDimension;
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TEFilterHeader.nibName, owner: self, options: nil)?[0] as! TEFilterHeader;
        return view;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TERefferalCell.reuseIdentifier, for: indexPath) as! TERefferalCell
        
        cell.indexPath = indexPath
        cell.delegate = self
        cell.setData(model: self.refferalModel?.referralInfo?[indexPath.row])
        return cell
    }
}
    
#else
    
//MARK:- Tableview Delegate
extension TERefferalVC :UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.refferalModel != nil {
            
            return 1
            
        }else{
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let model = self.refferalModel{
            
            return (model.referralInfo?.count)!
            
        }else{
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableViewAutomaticDimension;
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TERefferalHeader.nibName, owner: self, options: nil)?[0] as! TERefferalHeader;
        
        view.setDate(model: self.refferalModel?.referralCount)
        
        return view;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TERefferalCell.reuseIdentifier, for: indexPath) as! TERefferalCell
        
        cell.indexPath = indexPath
        cell.delegate = self
        cell.setData(model: self.refferalModel?.referralInfo?[indexPath.row])
        return cell
    }
}
    
#endif



//MARK:- Server Call

extension TERefferalVC {
    
    func callWebserviceRefferals() {
        
        self.startAnimating()
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.getReferralList, dataParam: nil, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Refferal Data : ------> ", data?.string() ?? "NA");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        //self.baseURL = data.value(forKey: "ASSETS_BASE_URL") as? String
                        
                        if let resultData = data.value(forKey: "resultData") {
                        
                            self.refferalModel = RFRefferalModel(object: resultData)
                        }
                    }
                }
            }
            self.tableView.reloadData()
            self.stopAnimating()
            
        } )
    }
    
}
