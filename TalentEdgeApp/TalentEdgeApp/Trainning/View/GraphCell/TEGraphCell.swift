//
//  TEGraphCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 20/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEGraphCell: BCUICollectionViewCell{
    
 
    static let reuseIdentifier = "KTEGraphCell"
    static let nibName = "TEGraphCell"
    
    @IBOutlet weak var imgIcon: BCUIImageView!
    @IBOutlet weak var lblTitle: BCUILabel!
    
    var pieChart:PieChartView?
    var pieChart2:PieChartView2?
    @IBOutlet weak var viewGraph: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .tiny
        self.lblTitle.fontType = .light
        self.lblTitle.setTextColor = .text_normal
        self.lblTitle.preferredMaxLayoutWidth = 100
        
        self.pieChart = PieChartView(frame: CGRect(x: self.viewGraph.frame.origin.x , y: 15, width: self.viewGraph.frame.size.width, height: self.viewGraph.frame.size.height))
        pieChart?.tag = 1001
        
        self.pieChart2 = PieChartView2(frame: CGRect(x: self.viewGraph.frame.origin.x + 18 , y: 18, width: self.viewGraph.frame.size.width - 36, height: self.viewGraph.frame.size.height))
        self.pieChart2?.tag = 1002
        
        self.viewGraph.addSubview(self.pieChart!)
        
        self.viewGraph.addSubview(self.pieChart2!)
        // Initialization code
        
    }
    
    func drawGraph(notStartStatus : CGFloat,completePercent : CGFloat, pendingPercent : CGFloat){
        
        
        self.pieChart?.completePercent = completePercent
        self.pieChart?.notStartStatus =  notStartStatus
        self.pieChart?.backgroundColor = UIColor.clear
        
       self.pieChart2?.backgroundColor = UIColor.clear
        
    }
    
    func configureCell(data:OngoingCourse?){
     
        
        var notStartStatus : CGFloat = 0
        var completeStatus : CGFloat = 0
        
        if let OngoingCourseData = data{
         
            
            if let total = OngoingCourseData.totalModules{
            
                var strTitle : String?
                
                if let complete = OngoingCourseData.completed {
                    
                    strTitle =  "\(complete)/\(total) " + "Complete Module"
                    
                }
             
                self.lblTitle.setText(text: strTitle?.uppercased())
                
            }
            
            if let notStartSt = OngoingCourseData.notStartedPercentage{
                
                notStartStatus = CGFloat(notStartSt)

            }
            
            
            if let completeSt = OngoingCourseData.completionPercentage{
                
                completeStatus = CGFloat(completeSt)
                
            }
            
            self.drawGraph(notStartStatus: notStartStatus, completePercent: completeStatus, pendingPercent: 0.0)
        }
    }
}
