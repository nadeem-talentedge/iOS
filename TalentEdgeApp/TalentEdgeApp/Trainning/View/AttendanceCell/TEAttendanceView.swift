//
//  TELiveClassDetailView.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class TEAttendanceView: BCView {

    @IBOutlet weak var attendedClassValue: BCUILabel!
    @IBOutlet weak var totalClassValue: BCUILabel!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    @IBOutlet weak var lblPercentage: UILabel!
    static let reuseIdentifier = "KTEAttendanceView"
    static let nibName = "TEAttendanceView"
    
    
    func setData(object : TEAttendanceModel?){
        
        if let object = object{
            
            if let attended = object.totalAttendanceCount{
                self.attendedClassValue.setText(text: String(attended))
            }
            
            if let totalClass = object.totalClassCount{
                self.totalClassValue.setText(text: String(totalClass))
            }
            
            
            if let value = object.ownAttendacnePercentage{
                
                self.progressView.value = CGFloat(Float(value))
                
            }else{
                self.progressView.value = 0
            }
            
            
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


