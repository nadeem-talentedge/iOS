//
//  TERefferalHome.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 16/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import PageMenu


class TERefferalHomeELSA: BCUIViewController {

    var pageMenu : CAPSPageMenu?
    var arrOfControllers = Array<UIViewController>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitle(title: "Job Board")
        self.createPageMenuForELSA()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createPageMenuForELSA() -> Void {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let jobPost = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEJobPostVC) as! TEJobPostVC
        jobPost.title = "JOBS"
        
        
        self.arrOfControllers.append(jobPost)
        
        let refferal = storyboard.instantiateViewController(withIdentifier: Utility.ID_TERefferalVC) as! TERefferalVC
        refferal.title = "MY REFFERALS"
        
        self.arrOfControllers.append(refferal)
        
        let parameters: [CAPSPageMenuOption] = [
            
            //.menuItemFont(ThemeManager.menuFont!),
            
            .menuHeight(50),
            
            .scrollMenuBackgroundColor(UIColor.init(colorLiteralRed: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)),
            
            .bottomMenuHairlineColor(UIColor.lightGray),
            
            .selectionIndicatorHeight(5),
            
            .selectionIndicatorColor(UIColor(patternImage: UIImage(named:"active")!)),
            
            .menuItemSeparatorWidth(0.5),
            
            .menuItemSeparatorPercentageHeight(1),
            
            .useMenuLikeSegmentedControl(true)
        ]
        
        
        pageMenu = CAPSPageMenu(viewControllers: self.arrOfControllers, frame:CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height) , pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
    }
}
