//
//  TERefferalHome.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 16/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MXSegmentedPager


class TERefferalHome: MXSegmentedPagerController {

    let arrOfItem = ["JobPost","Referral"]
    var arrOfControllers = Array<BCUIViewController>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitle(title: "Recruitments")
        
        #if ELSA
            
            segmentedPager.segmentedControl.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
            
            segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black,NSFontAttributeName:UIFont(name: "HelveticaNeue-Light", size: 18.0) ?? UIFont.systemFont(ofSize: 14.0)]
            
            segmentedPager.segmentedControl.borderType = .bottom
            
            segmentedPager.segmentedControl.isVerticalDividerEnabled = true
            
            segmentedPager.segmentedControl.selectionIndicatorLocation = .down
            
            segmentedPager.segmentedControl.selectionIndicatorHeight = 6
            
            segmentedPager.segmentedControl.selectionIndicatorColor = UIColor(patternImage: UIImage(named:"active")!)
            
            segmentedPager.segmentedControl.selectionStyle = .fullWidthStripe
            
        #else
            
            // Segmented Control customization 22 143 189
            segmentedPager.segmentedControl.selectionIndicatorHeight = 1.0
            
            segmentedPager.segmentedControl.selectionIndicatorLocation = .down
            
            segmentedPager.segmentedControl.backgroundColor = .white
            
            segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black,NSFontAttributeName:UIFont(name: "HelveticaNeue-Light", size: 18.0) ?? UIFont.systemFont(ofSize: 14.0)]
            
            segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : Utility.getColorAccordingTheme(theme: .THEME_8)]
            
            segmentedPager.segmentedControl.selectionStyle = .box
            
            segmentedPager.segmentedControl.selectionIndicatorColor = Utility.getColorAccordingTheme(theme: .THEME_8)
            
        #endif
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let jobPost = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEJobPostVC) as! TEJobPostVC
        
        jobPost.baseViewController = self
        
        self.arrOfControllers.append(jobPost)
        
        let refferal = storyboard.instantiateViewController(withIdentifier: Utility.ID_TERefferalVC) as! TERefferalVC
        
        refferal.baseViewController = self
        
        self.arrOfControllers.append(refferal)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        
        return self.arrOfItem.count
    }
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        
        return  self.arrOfItem[index]
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        
        return self.arrOfControllers[index].view
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, didScrollWith parallaxHeader: MXParallaxHeader) {
        print("progress \(parallaxHeader.progress)")
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
