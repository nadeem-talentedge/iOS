//
//  TEMessageHomeVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 03/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MXSegmentedPager

class TEMessageHomeVC: MXSegmentedPagerController {

    let arrOfItem = ["Inbox","Sent"]
    var arrOfControllers = Array<BCUIViewController>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addMessageButton()
        
        segmentedPager.segmentedControl.selectionIndicatorHeight = 1.0
        
        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
        
        segmentedPager.segmentedControl.backgroundColor = .white
        
        segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black,NSFontAttributeName:UIFont(name: "HelveticaNeue-Light", size: 18.0) ?? UIFont.systemFont(ofSize: 14.0)]
        
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : Utility.getColorAccordingTheme(theme: .THEME_8)]
        
        segmentedPager.segmentedControl.selectionStyle = .box
        
        segmentedPager.segmentedControl.selectionIndicatorColor = Utility.getColorAccordingTheme(theme: .THEME_8)
        
        
        let recive = TEMessageVC(nibName: "TEMessageVC", bundle: nil)
        recive.messageType = .Receive
        recive.baseViewController = self
        
        let send = TEMessageVC(nibName: "TEMessageVC", bundle: nil)
        send.messageType = .Sent
        send.baseViewController = self
        
        self.arrOfControllers.append(recive)
        self.arrOfControllers.append(send)
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

}

//MARK : - UserDefine
extension TEMessageHomeVC{
    
    func addMessageButton() ->Void{
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnMessage = UIButton()
        btnMessage.tag = 1
        btnMessage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnMessage.setImage(UIImage(named: "compose"), for: .normal)
        
        btnMessage.addTarget(self, action: #selector(createNewMessage), for: .touchUpInside)
        
        let btn1 = UIBarButtonItem(customView: btnMessage)
        btn1.tag = btnMessage.tag
        
        buttonsArray.append(btn1)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
    }
    
    func createNewMessage(sender:UIButton) -> Void {
        
        let controller = TENewPostVC(nibName: "TENewPostVC", bundle: nil)
        if let vc = self.navigationController{
            
            vc.pushViewController(controller, animated: true)
        }
    }
}

