//
//  TEMyCertificateVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 30/12/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEMyCertificateVC: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    var arrOfCertificate = Array<CertificateDetailModel>()
    var issuedTo:IssuedToModel?
    var institute:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register Cell With Identifier
        
        self.setTitle(title: "My Certificates")
        
        //self.tableView.addRefrehsControl(target: self)
        
        self.tableView.registerCellWithTable(nibName: TEMyCertificateCell.nibName, reuseIdentifier: TEMyCertificateCell.reuseIdentifier)
        
        self.getCertificate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Tableview Delegate

extension TEMyCertificateVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrOfCertificate.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TEMyCertificateCell.reuseIdentifier, for: indexPath) as! TEMyCertificateCell
        
        let model = self.arrOfCertificate[indexPath.row]
        cell.lblTitleTraining.setText(text: self.institute)
        cell.lblValueTraining.setText(text: model.batchName)
        cell.lblValueIssedOn.setText(text: model.issuedOn)
        cell.lblValueAwardedBy.setText(text: model.issuedBy)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let model = self.arrOfCertificate[indexPath.row]
        
        if let path = model.certificatePath{
            
            self.callServiceForDownloadingFile(path: path)
        }
    }
}

//MARK:- Server Call

extension TEMyCertificateVC{
    
    func getCertificate() {
        
        self.startAnimating()
        
        let header = NSMutableDictionary()
        let param = NSMutableDictionary()
        
        NetworkManager.httpPostRequest(.myCertificates, dataParam: param, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("MY Certificate : ------> ",data ?? "Generate Login OTP");
            if let value = self.parseData(data: data).0 as? NSDictionary{
                
                if let issueTo = value.value(forKey: "issued_to") as? NSDictionary{
                
                    self.issuedTo = IssuedToModel(object:  issueTo)
                    
                }else{
                    
                    self.issuedTo = nil
                }
                
                self.institute = value.value(forKey: "institute") as? String
                
                if let batches = value.value(forKey: "batch") as? NSArray{
                    
                    self.arrOfCertificate.removeAll()
                    
                    for key in batches{
                        
                        self.arrOfCertificate.append(CertificateDetailModel(object: key))
                    }
                }
            }
            self.tableView.reloadData()
            self.stopAnimating()
            
        } )
    }
}
