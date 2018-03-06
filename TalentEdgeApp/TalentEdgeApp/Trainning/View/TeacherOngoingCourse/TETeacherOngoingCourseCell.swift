//
//  TETeacherOngoingCourseCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 19/09/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TETeacherOngoingCourseCellDelegate {
    
    func didSelectOpetions(indexNumber:Int,indexPath:IndexPath?) -> Void
}

class TETeacherOngoingCourseCell: BCUITableViewCell {

    let kOrangeColor = Utility.colorWithHexString("e86822") // Orange color
    
    var delegate:TETeacherOngoingCourseCellDelegate?
    
    @IBOutlet weak var graph: UIView!
    @IBOutlet weak var totalComplete: BCUILabel!
    
    static let nibName = "TETeacherOngoingCourseCell"
    static let reuseIdentifier = "mTETeacherOngoingCourseCell"
    
    @IBOutlet weak var imgLogon: BCUIImageView!
    @IBOutlet weak var lblInstituName: BCUILabel!
    @IBOutlet weak var lblCourseName: BCUILabel!
    @IBOutlet weak var lblDuration: BCUILabel!
    @IBOutlet weak var lblLiveClass: BCUILabel!
    @IBOutlet weak var viewAttendencePercentage: MBCircularProgressBarView!
    @IBOutlet weak var lblAssignment: BCUILabel!
    @IBOutlet weak var lblAssessment: BCUILabel!
    @IBOutlet weak var lblMyStudent: BCUILabel!
    @IBOutlet weak var lblMessage: BCUILabel!
    @IBOutlet weak var lblDiscussion: BCUILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawSemiCircle(_ end:CGPoint, ofColor lineColor: UIColor, inView view:UIView, completionPercentage : Double, courseObj : Double, id:String) {
        
        
        let width = CGFloat(20.0)
        let radius = CGFloat(40)
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width/2,y: view.frame.size.height), radius: radius, startAngle: CGFloat(M_PI), endAngle:CGFloat(0), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "\(id)_0"
        shapeLayer.path = circlePath.cgPath
        shapeLayer.lineDashPattern = [5 ,5]
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.name = "\(id)_1"
        shapeLayer1.path = circlePath.cgPath
        shapeLayer1.fillColor = UIColor.clear.cgColor
        shapeLayer1.strokeColor = UIColor.lightGray.cgColor
        shapeLayer1.lineWidth = width
        shapeLayer1.addSublayer(shapeLayer)
        
        let angle = completionPercentage * 1.8
        
        let circlePath1 = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width/2,y: view.frame.size.height), radius: radius, startAngle: CGFloat(M_PI), endAngle:CGFloat(((180 + angle)/180)*M_PI), clockwise: true)
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.name = "\(id)_2"
        shapeLayer2.path = circlePath1.cgPath
        shapeLayer2.lineDashPattern = [5 ,5]
        shapeLayer2.fillColor = UIColor.clear.cgColor
        shapeLayer2.strokeColor = UIColor.white.cgColor
        shapeLayer2.lineWidth = 1.0
        
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.name = "\(id)_3"
        shapeLayer3.path = circlePath1.cgPath
        shapeLayer3.fillColor = UIColor.clear.cgColor
        shapeLayer3.strokeColor = kOrangeColor.cgColor
        shapeLayer3.lineWidth = width
        shapeLayer3.addSublayer(shapeLayer2)
        view.layer.addSublayer(shapeLayer1)
        view.layer.addSublayer(shapeLayer3)
        
        let angle1 = abs(courseObj ) * 1.8
        
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width/2,y: view.frame.size.height), radius: radius, startAngle: CGFloat(M_PI), endAngle:CGFloat(((180 + angle1)/180)*M_PI), clockwise: true)
        
        let shapeLayer4 = CAShapeLayer()
        shapeLayer4.name = "\(id)_4"
        shapeLayer4.path = circlePath2.cgPath
        shapeLayer4.lineDashPattern = [5 ,5]
        shapeLayer4.fillColor = UIColor.clear.cgColor
        shapeLayer4.strokeColor = UIColor.white.cgColor
        shapeLayer4.lineWidth = 1.0
        
        
        let shapeLayer5 = CAShapeLayer()
        shapeLayer5.name = "\(id)_5"
        shapeLayer5.path = circlePath2.cgPath
        shapeLayer5.fillColor = UIColor.clear.cgColor
        shapeLayer5.strokeColor = Utility.colorWithHexString("3bab14").cgColor
        shapeLayer5.lineWidth = width
        shapeLayer5.addSublayer(shapeLayer4)
        view.layer.addSublayer(shapeLayer5)
    }
    
    @IBAction func didSelectOpetions(sender:BCUIButton) -> Void{
        
        if let delegate = self.delegate {
            
            delegate.didSelectOpetions(indexNumber: sender.tag,indexPath:self.indexPath)
        }
    }
    
    func setOngoingCourse(model:FacultyOngoingCourse?) -> Void {
        
        if let model = model{
        
            self.imgLogon.setImageFromUrl(url: model.logo, placeHolder: nil)
            self.lblInstituName.setText(text: model.instituteName)
            self.lblCourseName.setText(text: model.courseName)
            self.lblDuration.setText(text: model.courseDuration)
            
            self.viewAttendencePercentage.value = CGFloat(model.classParticipationPercentage ?? 0)
            self.lblLiveClass.setText(text: "")
            self.lblAssignment.setText(text: model.assignment)
            self.lblAssessment.setText(text: model.assessment)
            self.lblMyStudent.setText(text: model.learner)
            self.lblMessage.setText(text: model.draft)
            self.lblDiscussion.setText(text: model.discussion)
            
            if let layers = self.graph.layer.sublayers{
                
                for layer in layers {
                    
                    if let id = model.id{
                    
                        if layer.name == "\(id)_0" || layer.name == "\(id)_1" || layer.name == "\(id)_2" || layer.name == "\(id)_3" || layer.name == "\(id)_4" || layer.name == "\(id)_5"{
                            
                            layer.removeFromSuperlayer()
                        }
                    }
                }
            }
            
            self.totalComplete.setText(text: String(format: "%@/%d Module Completed", model.completed ?? "0", model.totalModules ?? 0))
            
            drawSemiCircle(CGPoint(x: self.graph.frame.origin.x, y: 00.0), ofColor: Utility.colorWithHexString("3bab14"), inView: self.graph, completionPercentage: abs(Double(model.pendingPercentage ?? 0.0)),courseObj:Double(model.completionPercentage ?? 0.0),id: model.id ?? "0")
        }
    }
    
    func setCompletedCourse(model:FacultyCompletedCourse?) -> Void {
     
        if let model = model{
            
            self.imgLogon.setImageFromUrl(url: model.logo, placeHolder: nil)
            self.lblInstituName.setText(text: model.instituteName)
            self.lblCourseName.setText(text: model.courseName)
            self.lblDuration.setText(text: model.courseDuration)
            
            self.viewAttendencePercentage.value = CGFloat(model.classParticipationPercentage ?? 0)
            self.lblLiveClass.setText(text: "")
            self.lblAssignment.setText(text: model.assignment)
            self.lblAssessment.setText(text: model.assessment)
            self.lblMyStudent.setText(text: model.learner)
            self.lblMessage.setText(text: "\(model.draft ?? 0)")
            self.lblDiscussion.setText(text: model.discussion)
            
            if let layers = self.graph.layer.sublayers{
                
                for layer in layers {
                    
                    if let id = model.id{
                        
                        if layer.name == "\(id)_0" || layer.name == "\(id)_1" || layer.name == "\(id)_2" || layer.name == "\(id)_3" || layer.name == "\(id)_4" || layer.name == "\(id)_5"{
                            
                            layer.removeFromSuperlayer()
                        }
                    }
                }
            }
            
            self.totalComplete.setText(text: "\(model.completed ?? "0")/\(model.totalModules ?? 0) Module Completed")
            
            drawSemiCircle(CGPoint(x: self.graph.frame.origin.x, y: 20.0), ofColor: Utility.colorWithHexString("3bab14"), inView: self.graph, completionPercentage: abs(Double(model.pendingPercentage ?? 0)),courseObj:Double(model.completionPercentage ?? 0),id: model.id ?? "0")
        }
    }
    
    
}
