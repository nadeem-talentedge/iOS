//
//  ANAssignmentCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TEStudentSubmissionInfoCellDelegate {
    
    func recievedButtonDidClick(indexPath:IndexPath?) -> Void
    func openDocButtonDidClick(indexPath:IndexPath?) -> Void
    func profileButtonDidClick(indexPath:IndexPath?) -> Void
}

class TEStudentSubmissionInfoCell: BCUITableViewCell {
    
    var delegate:TEStudentSubmissionInfoCellDelegate?
    
    static let reuseIdentifier_Online_R = "kTEOnlineRCell"
    static let nibName_Online_R = "TEOnlineRCell"
    
    static let reuseIdentifier_Online_NR = "kTEOnlineNRCell"
    static let nibName_Online_NR = "TEOnlineNRCell"
    
    static let reuseIdentifier_Offline = "kTEOffline"
    static let nibName_Offline = "TEOffline"
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var lblSubmissionDate: BCUILabel!
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var lblPath: BCUILabel!
    @IBOutlet weak var btnRecieved: BCUIButton!
    
    @IBOutlet weak var lblTitleProgress: BCUILabel!
    @IBOutlet weak var progressComplete:   MBCircularProgressBarView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        if let lblSubmissionDate = self.lblSubmissionDate{
            
            lblSubmissionDate.fontSize = .medium
            lblSubmissionDate.fontType = .regular
            lblSubmissionDate.setTextColor = .text_normal
        }
        
        if let lblName = self.lblName{
            
            lblName.fontSize = .large
            lblName.fontType = .bold
            lblName.setTextColor = .text_heading
        }
        
        if let lblPath = self.lblPath{
            
            lblPath.fontSize = .tiny
            lblPath.fontType = .bold
            lblPath.setTextColor = .text_normal
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func recievedButtonDidClick() -> Void {
        
        if let delegate = self.delegate{
            
            delegate.recievedButtonDidClick(indexPath: self.indexPath)
        }
    }
    
    @IBAction func openDocButtonDidClick() -> Void {
        
        if let delegate = self.delegate{
            
            delegate.openDocButtonDidClick(indexPath: self.indexPath)
        }
    }
    
    @IBAction func profileButtonDidClick() -> Void {
        
        if let delegate = self.delegate{
            
            delegate.profileButtonDidClick(indexPath: self.indexPath)
        }
    }
    
    func isReceived(value:String?) -> Bool{
        
        if let value = value{
            
            if value.isEmpty == true{
                
                return false
            }else{
                
                if value == "1"{
                    
                    return true
                    
                }else{
                    
                    return false
                }
            }
            
        }else{
            
            return false
        }
    }
    
    func isMarkGivenByFaculty(value:String?) -> Bool{
        
        if let value = value{
            
            if value.isEmpty == true{
                
                return false
            }else{
                
                if value == "Y"{
                    
                    return true
                    
                }else{
                    
                    return false
                }
            }
            
        }else{
            
            return false
        }
    }
    
    func setOnlineData(model:StudentSubmissionInfoModel?,isGraded:Bool){
        
        if let model = model{
            
            self.imgLogo.setImageFromUrl(url: model.pic, placeHolder: nil)
            self.lblName.setText(text: "\(model.fname ?? "") \(model.lname ?? "")")
            
            if self.lblPath != nil{
            
                self.lblPath.setText(text: Utility.getLastPath(path: model.uploadPath))
            }
            
            if self.btnRecieved != nil{
                
                 self.btnRecieved.isSelected = self.isReceived(value: model.isReceived)
            }
            
            
            if isGraded == true{
                
                if self.lblTitleProgress != nil{
                
                    if self.isMarkGivenByFaculty(value: model.marksGivenByFaculty){
                        
                        if let avg = model.assignmentMarks{
                            
                            if avg.isEmpty  == false{
                                
                                let total = Float(avg)!
                                self.progressComplete.value = CGFloat(total)
                                
                            }else{
                                
                                self.progressComplete.value = 0
                            }
                        }else{
                            
                            self.progressComplete.value = 0
                        }
                        
                    }else{
                        
                        self.progressComplete.value = 0
                    }
                    self.lblTitleProgress.isHidden = false
                    self.progressComplete.isHidden = false
                }
                
                
            }else{
               
                if self.lblTitleProgress != nil{
                
                    self.lblTitleProgress.isHidden = true
                    self.progressComplete.isHidden = true
                }
                
            }
            
            if self.lblSubmissionDate != nil{
            
                if let date = model.uploadedDateFormatted{
                    
                    if date.isEmpty == false{
                        
                        self.lblSubmissionDate.setText(text:"Submitted on : \(date)")
                    }else{
                        
                        self.lblSubmissionDate.text = ""
                    }
                }else{
                    
                    self.lblSubmissionDate.text = ""
                }
            }
        }
    }
    
    func setOfflineData(model:StudentSubmissionInfoModel?,isGraded:Bool){
        
        if let model = model{
            
            self.imgLogo.setImageFromUrl(url: model.pic, placeHolder: nil)
            self.lblName.setText(text: "\(model.fname ?? "") \(model.lname ?? "")")
            
            if self.btnRecieved != nil{
                
                self.btnRecieved.isSelected = self.isReceived(value: model.isReceived)
            }
            
            if isGraded == true{
                
                if self.lblTitleProgress != nil{
                    
                    if self.isMarkGivenByFaculty(value: model.marksGivenByFaculty){
                        
                        if let avg = model.assignmentMarks{
                            
                            if avg.isEmpty  == false{
                                
                                let total = Float(avg)!
                                self.progressComplete.value = CGFloat(total)
                                
                            }else{
                                
                                self.progressComplete.value = 0
                            }
                        }else{
                            
                            self.progressComplete.value = 0
                        }
                        
                    }else{
                        
                        self.progressComplete.value = 0
                    }
                    
                    self.lblTitleProgress.isHidden = false
                    self.progressComplete.isHidden = false
                }
                
                
            }else{
                
                if self.lblTitleProgress != nil{
                    
                    self.lblTitleProgress.isHidden = true
                    self.progressComplete.isHidden = true
                }
                
            }
        }
    }
}
