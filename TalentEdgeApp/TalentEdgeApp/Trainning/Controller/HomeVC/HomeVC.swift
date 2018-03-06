//
//  HomeVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MXSegmentedPager

enum CourceType {
    
    case ongoing
    case completed
}

class HomeVC: MXSegmentedPagerController {
    
    
    var arrOFModule:[String]?
    var courceType = CourceType.ongoing
    var baseViewController:UIViewController?
    var batchID:String?
    var batchName:String?
    var bannerUrl:String?
    let menuFont = UIFont(name: "Helvetica", size: 18)
    var indexNumber = 0
    
    var arrOfControllers = Array<BCUIViewController>()
    
    let colorSelected = UIColor(colorLiteralRed: 22.0/255.0, green: 143.0/255.0, blue: 189.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let batchName = self.batchName{
        
            //self.title = batchName
            self.setTitle(title: batchName)
        }
        
        //Check for Ongoing Cource or Complete Cource
        if self.courceType == .ongoing{
            
            if self.isLMS() == true && self.isStudentLogin() {
            
                self.arrOFModule = ["dashboard","module","live classes","attendance","assignments","assessments","batchmates","discussion"]
                
            }else if self.isLMS() == true && self.isTeacherLogin() {
              
                self.arrOFModule = ["dashboard","module","live classes","attendance","assignments","assessments","students","discussion"]
            }
            else{
                
                self.arrOFModule = ["overview","module","live classes","attendance","assignments","assessments","learners","discussion"]
            }
            
        }else{
            
            if self.isLMS() == true && self.isStudentLogin() {
                
                self.arrOFModule = ["dashboard","module","live classes","attendance","assignments","assessments","batchmates","discussion","testimonials"]
                
            }else if self.isLMS() == true && self.isTeacherLogin() {
                
                self.arrOFModule = ["dashboard","module","live classes","attendance","assignments","assessments","students","discussion","testimonials","testimonials"]
            }
            else{
                
                self.arrOFModule = ["overview","module","live classes","attendance","assignments","assessments","learners","discussion","testimonials"]
            }
            
        }
        self.createParalaxMenu()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTitle(title:String) -> Void {
        
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 45))
        titleLabel.text = title
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.navigationItem.titleView = titleLabel
    }
    
}

extension HomeVC {
    
    func isTeacherLogin() -> Bool {
        
        if let userRole = Utility.getLoginUserDetail()?.resultData?.user?.userRole{
            
            if userRole.lowercased() == "faculty".lowercased(){
                
                return true
            }
            
        }
        return false
    }
    
    func isStudentLogin() -> Bool {
        
        if let userRole = Utility.getLoginUserDetail()?.resultData?.user?.userRole{
            
            if userRole.lowercased() == "student".lowercased(){
                
                return true
            }
            
        }
        return false
    }
    
    func isLMS() -> Bool {
        
        if  let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let url = appInfo[0].type {
                    
                    if url == "LMS" {
                        
                        return true
                        
                    }else{
                        
                        return false
                    }
                    
                }else{
                    
                    return false
                }
                
            }else{
                
                return false
            }
            
        }else{
            
            return false
        }
    }
    
    func isULS() -> Bool {
        
        if  let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let url = appInfo[0].type {
                    
                    if url == "ULS" {
                        
                        return true
                        
                    }else{
                        
                        return false
                    }
                    
                }else{
                    
                    return false
                }
                
            }else{
                
                return false
            }
            
        }else{
            
            return false
        }
    }
    
    func isELS() -> Bool {
        
        if  let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let url = appInfo[0].type {
                    
                    if url == "ELS" {
                        
                        return true
                        
                    }else{
                        
                        return false
                    }
                    
                }else{
                    
                    return false
                }
                
            }else{
                
                return false
            }
            
        }else{
            
            return false
        }
    }
}

extension HomeVC{

    func createParalaxMenu() -> Void {
     
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let headerView = Bundle.main.loadNibNamed(TEHeaderView.nibName, owner: self, options: nil)?[0] as! TEHeaderView;
        
        headerView.bannerImage.setImageFromUrl(url: self.bannerUrl, placeHolder: nil)
        
        segmentedPager.parallaxHeader.view = headerView
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.height = 160
        segmentedPager.parallaxHeader.minimumHeight = 0
        
        //SEGMENT
        segmentedPager.segmentedControl.selectionIndicatorHeight = 3.0
        
        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
        
        segmentedPager.segmentedControl.backgroundColor = UIColor(colorLiteralRed: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        
        segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray,NSFontAttributeName:UIFont(name: "HelveticaNeue-Light", size: 18.0) ?? UIFont.systemFont(ofSize: 18.0)]
        
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : self.colorSelected]
        
        segmentedPager.segmentedControl.selectionStyle = .textWidthStripe
        
        segmentedPager.segmentedControl.selectionIndicatorColor = self.colorSelected
        
        segmentedPager.segmentedControl.segmentWidthStyle = .dynamic
        
        //segmentedPager.segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15)
        
        
        for moduleName in self.arrOFModule!{
            
            
            if moduleName == "module"{
                
                let moduleVC = storyboard.instantiateViewController(withIdentifier: Utility.ID_ModuleVC) as! TEModuleVC
                
                moduleVC.title = moduleName.uppercased()
                
                moduleVC.batchID = self.batchID
                moduleVC.baseViewController = self
                self.arrOfControllers.append(moduleVC)
                
            }else if moduleName == "live classes"{
                
                let liveClass = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELiveClassVC) as! TELiveClassVC
                
                liveClass.title = moduleName.uppercased()
                
                liveClass.batchID = self.batchID
                liveClass.baseViewController = self
                self.arrOfControllers.append(liveClass)
                
            }else if moduleName == "attendance"{
                
                let attendanceClass = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEAttendanceVC) as! TEAttendanceVC
                
                attendanceClass.title = moduleName.uppercased()
                
                attendanceClass.batchID = self.batchID
                attendanceClass.batchName = self.batchName
                attendanceClass.baseViewController = self
                self.arrOfControllers.append(attendanceClass)
                
            }else if moduleName == "assignments"{
                
                let assignments = TEAssignmentsVC(nibName: "TEAssignmentsVC", bundle: nil)
                
                assignments.title = moduleName.uppercased()
                
                assignments.batchID = self.batchID
                
                assignments.baseViewController = self
                
                self.arrOfControllers.append(assignments)
                
            }else if moduleName == "assessments"{
                
                let assessments = TEAssesmentVC(nibName: "TEAssesmentVC", bundle: nil)
                
                assessments.title = moduleName.uppercased()
                
                assessments.batchID = self.batchID
                assessments.batchName = self.batchName
                assessments.baseViewController = self
                self.arrOfControllers.append(assessments)
                
            }else if moduleName == "learners" || moduleName == "students" || moduleName == "batchmates"{
                
                let lerners = TELernersVC(nibName: "TELernersVC", bundle: nil)   
                lerners.title = moduleName.uppercased()
                lerners.batchID = self.batchID
                lerners.baseViewController = self
                self.arrOfControllers.append(lerners)
                
                
            }else if moduleName == "discussion"{
                
                let disscusion = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEDiscussionListVC) as! TEDiscussionListVC
                
                disscusion.title = moduleName.uppercased()
                disscusion.batchID = self.batchID
                disscusion.baseViewController = self
                self.arrOfControllers.append(disscusion)
                
            }
            else if moduleName == "overview"{
                
                
                let overview = TEOverViewVC(nibName: "TEOverViewVC", bundle: nil)
                
                overview.title = moduleName.uppercased()
                overview.batchID = self.batchID
                overview.baseViewController = self
                
                self.arrOfControllers.append(overview)
                
                
            }else if moduleName == "testimonials"{
                
                let  testimonial = TETestimonialsVC(nibName: "TETestimonialsVC", bundle: nil)
                testimonial.batchID = self.batchID
                
                testimonial.title = moduleName.uppercased()
                
                testimonial.batchID = self.batchID
                
                testimonial.baseViewController = self
                
                self.arrOfControllers.append(testimonial)
                
            }else if moduleName == "dashboard"{
                
                
                let moduleVC = storyboard.instantiateViewController(withIdentifier: "TDetailDashBoardViewController") as! TDetailDashBoardViewController
                
                moduleVC.title = moduleName.uppercased()
                moduleVC.batchID = self.batchID
                self.arrOfControllers.append(moduleVC)
            }
                
            else{
                
                let vc = BCUIViewController()
                vc.title = moduleName.uppercased()
                self.arrOfControllers.append(vc)
                
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            self.segmentedPager.pager.showPage(at: self.indexNumber, animated: false)
        }
    }
    
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        
        return self.arrOFModule!.count
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        
        return  " \(self.arrOFModule![index].capitalized) "
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        
        return self.arrOfControllers[index].view
    }
}
