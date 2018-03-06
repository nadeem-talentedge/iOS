//
//  PieChartView2.swift
//  SemiPieChart
//
//  Created by Rohit  on 20/06/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import UIKit

class PieChartView2: UIView {
    
    override func draw(_ rect: CGRect) {
        
        drawSlice(rect: rect, startPercent: 0, endPercent: 50, color: UIColor.white)
        
       // drawSlice(rect: rect, startPercent: 20, endPercent: 35, color: UIColor.white)
        //drawSlice(rect: rect, startPercent: 35, endPercent: 50, color: UIColor.white)
    }
    
    private func drawSlice(rect: CGRect, startPercent: CGFloat, endPercent: CGFloat, color: UIColor) {
        
        let center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        let startAngle = startPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        let endAngle = endPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        color.setStroke()
        path.close()
        color.setFill()
        path.fill()
    }
}
