//
//  ANBirthdayCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TERefferalCellDelegate {
    
    func loadMoreAndLess(indexPath:IndexPath?) -> Void
}

class TERefferalCell: BCUITableViewCell {

    var delegate:TERefferalCellDelegate?
    
    static let reuseIdentifier = "kTERefferalCell"
    static let nibName = "TERefferalCell"
    
    @IBOutlet weak var imgProfile: BCUIImageView!
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblJobID: BCUILabel!
    @IBOutlet weak var lblRecruitmentStatus: BCUILabel!
    
    @IBOutlet weak var lblPostedBy: BCUILabel!
    @IBOutlet weak var btnContentType: BCUIButton!
    @IBOutlet weak var btnPostedTime: BCUIButton!
    
    @IBOutlet weak var tableView: BCUITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    static var totalCell = 1
    static var totalHeight:CGFloat = 1.0
    
    var refferal:[RFReferral]?{
    
        didSet{
        
            self.tableView.reloadData {
                
                print("DONE")
            }
        }
    }
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        
        self.tableView.registerCellWithTable(nibName: TERefferalChildCell.nibName, reuseIdentifier: TERefferalChildCell.reuseIdentifier)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        self.tableView.backgroundColor = UIColor(colorLiteralRed: 252.0/255.0, green: 252.0/255.0, blue: 252.0/255.0, alpha: 1.0)
    }
    
    func setData(model:RFReferralInfo?) -> Void {
        
        if let model = model{
        
            self.imgProfile.setImage(name: "jobboard")
            
            self.refferal = model.referral
            
            self.lblTitle.setText(text: model.content?.title)
            
            self.lblJobID.setText(text: "Job id # \((model.content?.refType ?? "NA"))")
            
            if let status = model.content?.recruitmentStatus{
            
                switch status {
                    
                case "0":
                    
                    self.lblRecruitmentStatus.textColor = UIColor(colorLiteralRed: 78.0/255.0, green: 170.0/255.0, blue: 25.0/255.0, alpha: 1.0)
                    self.lblRecruitmentStatus.setText(text: "Open")
                    
                case "1":
                    
                    self.lblRecruitmentStatus.textColor = UIColor.red
                    self.lblRecruitmentStatus.setText(text: "On hold")
                    
                case "2":
                    
                    self.lblRecruitmentStatus.textColor = UIColor.red
                    self.lblRecruitmentStatus.setText(text: "Closed")
                
                default:
                    
                    self.lblRecruitmentStatus.textColor = UIColor.red
                    self.lblRecruitmentStatus.setText(text: "NA")
                
                }
                
            }else{
            
                self.lblRecruitmentStatus.textColor = UIColor.red
                self.lblRecruitmentStatus.setText(text: "NA")
            }
            
            self.lblPostedBy.setText(text: "\((model.user?.fname ?? "")) \((model.user?.lname ?? ""))")
            
            self.btnContentType.setText(text: "Recruitment")
            
            self.btnPostedTime.setText(text: Utility.dateStringToDefaultFormatDate(dateAsString: model.content?.created))
        }
    }
}

//MARK:- Refferal Child Cell

extension TERefferalCell:TERefferalChildCellDelegate{

    func loadMoreAndLess(indexPath: IndexPath?) {
        
        if TERefferalCell.totalCell == 5{
        
            //self.tableViewHeight.constant = 1*100
            TERefferalCell.totalCell = 1
            
        }else{
        
            //self.tableViewHeight.constant = 5*100
            TERefferalCell.totalCell = 5
        }
        
        self.tableView.reloadData {
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
                 //print("Height1 -------------------->",self.tableView.contentSize.height)
                 TERefferalCell.totalHeight = self.tableView.contentSize.height
                
                if let delegate = self.delegate{
                
                    self.tableViewHeight.constant = TERefferalCell.totalHeight
                    delegate.loadMoreAndLess(indexPath: indexPath)
                
                }
            }
        }
    }
}

//MARK:- TableView Delegate and DataSource

extension TERefferalCell:UITableViewDelegate,UITableViewDataSource{

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.refferal != nil{
        
            return 1
            
        }else{
        
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let refferal = self.refferal{
        
            return refferal.count
            
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TERefferalChildCell.reuseIdentifier, for: indexPath) as! TERefferalChildCell
        
        cell.indexPath = indexPath
        cell.delegate = self
        cell.setData(model: self.refferal?[indexPath.row])
        return cell
    }
}
