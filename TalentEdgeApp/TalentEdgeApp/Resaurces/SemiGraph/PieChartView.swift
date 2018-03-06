//
//  PieChartView.swift
//  SemiPieChart
//
//  Created by Rohit  on 20/06/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import UIKit

class PieChartView: UIView {
    
    
   
    var notStartStatus: CGFloat?
    var completePercent: CGFloat?
    var pendingPercent: CGFloat?
    
    override func draw(_ rect: CGRect) {
        
        //For pending
        drawSlice(rect: rect, startPercent: 0, endPercent: 50, color: Utility.yelloColorCustom)
        
        
        //For not start yet
        if var notStartStatus = notStartStatus{
            
                notStartStatus = notStartStatus / 2
                let start = 50 - notStartStatus
                drawSlice(rect: rect, startPercent: start, endPercent: 50, color: Utility.grayColorCustom)
        }
        
        
        //For complete
        if var completePercent = completePercent {
            
            completePercent = completePercent / 2
            drawSlice(rect: rect, startPercent: 0, endPercent: completePercent, color: Utility.greenColorCustom)
        }
        

    }
    
    private func drawSlice(rect: CGRect, startPercent: CGFloat, endPercent: CGFloat, color: UIColor) {
        
        let center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
        
        let radius = min(rect.width, rect.height) / 2
        
        let startAngle = startPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        
        let endAngle = endPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        
        let path = UIBezierPath()
        
        path.move(to: center)
        
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.close()
        
        color.setFill()
        
        path.fill()
    }
}
