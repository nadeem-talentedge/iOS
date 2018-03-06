//
//  ANLiveClassCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 29/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEStudentSessionInfoCellDelegate{
    
    func didSelectMessage(indexPath:IndexPath?) -> Void
    func profileDetail(indexPath:IndexPath?) -> Void
}

class TEStudentSessionInfoCell: BCUITableViewCell {
    
    var delegate:TEStudentSessionInfoCellDelegate?
    static let reuseIdentifier = "kTEStudentSessionInfoCell"
    static let nibName = "TEStudentSessionInfoCell"
    
    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var lblName: BCUILabel!
    
    @IBOutlet weak var lblTitleTotalVisit: BCUILabel!
    @IBOutlet weak var lblTotalVisit: BCUILabel!
    
    @IBOutlet weak var lblTitleTotalTimeSpend: BCUILabel!
    @IBOutlet weak var lblTotalTimeSpend: BCUILabel!
    
    @IBOutlet weak var stackInOutView: UIStackView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.lblName.fontSize = .large
        self.lblName.fontType = .bold
        
        self.lblTitleTotalVisit.fontSize = .medium
        self.lblTitleTotalVisit.fontType = .regular
        self.lblTitleTotalVisit.setTextColor = .text_normal
        
        self.lblTotalVisit.fontSize = .medium
        self.lblTotalVisit.fontType = .bold
        self.lblTotalVisit.setTextColor = .app_button
        
        self.lblTitleTotalTimeSpend.fontSize = .medium
        self.lblTitleTotalTimeSpend.fontType = .regular
        self.lblTitleTotalTimeSpend.setTextColor = .text_normal
        
        self.lblTotalTimeSpend.fontSize = .medium
        self.lblTotalTimeSpend.fontType = .bold
        self.lblTotalTimeSpend.setTextColor = .app_button
    
    }
    
    @IBAction func profileDetail(sender:BCUIButton) -> Void{
        
        if let delegate = self.delegate {
            
            delegate.profileDetail(indexPath: self.indexPath)
        }
    }
    
    @IBAction func didSelectMessage(sender:BCUIButton) -> Void{
        
        if let delegate = self.delegate {
            
            delegate.didSelectMessage(indexPath: self.indexPath)
        }
    }
    
    func setStudentSessionData(model:StudentSessionInfoModel?) -> Void {
        
        if let model = model{
            
            self.imgLogo.setImageFromUrl(url: model.pic, placeHolder: nil)
            self.lblName.setText(text: "\(model.fname ?? "") \(model.lname ?? "")")
            self.lblTotalVisit.setText(text: "\(model.totalVisits ?? 0)")
            self.lblTotalTimeSpend.setText(text: "\(model.totalDuration ?? 0) Min")
            
             let views = self.stackInOutView.arrangedSubviews
             for view in views{
            
                self.stackInOutView.removeArrangedSubview(view)
                view.isHidden = true
                
            }
            
            for time in model.timeDetails! {
                
                let view = Bundle.main.loadNibNamed(InOutTimeView.nibName, owner: self, options: nil)?[0] as! InOutTimeView;
                
                view.lblInTime.setText(text: time.inTime)
                view.lblOutTime.setText(text: time.outTime)
                
                self.stackInOutView.addArrangedSubview(view)
            }
        }
    }
}
