//
//  HomeVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import PageMenu
import MXSegmentedPager

extension Notification.Name {
    
    static let changeTab = Notification.Name(rawValue: "changeTab")
    static let UpdateProfile = Notification.Name(rawValue: "updateProfile")
}

class TEAppHomeVC : MXSegmentedPagerController {
    
    var module = ["announcements","trainings","calendar"]
    var arrOfControllers = Array<UIViewController>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setTitle(title: "announcements".capitalized)
        self.leftButton(imageName: "menu")
        self.rightButton()
        self.initialSetup()
        self.createParalaxMenu()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeTabNotification), name: Notification.Name.changeTab, object: nil)
    }
    
    func changeTabNotification(object:Notification) -> Void {
     
        if let titile = object.object as? String {
            
            if titile == "Announcements"{
             
                self.segmentedPager.pager.showPage(at: 0, animated: false)
                
            }else if titile == "Trainings"{
                
                self.segmentedPager.pager.showPage(at: 1, animated: false)
                
            }else if titile == "Calendar"{
                
                self.segmentedPager.pager.showPage(at: 2, animated: false)
            }
        }
        print("Tab -------->",object)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.callWebserviceNotificationCount()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        self.view.layoutSubviews()
    }
    
    func initialSetup() -> Void {
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        self.navigationController?.navigationBar.isTranslucent = false;
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = ThemeManager.setThemeColor(appColor: .navigation)
    }
    
    func mangeBadgeCount(message:Int,notification:Int) -> Void {
        
        print(" 1  Messahe : ---> ",message,"Notification : --->",notification)
        
        let rightBarButtons = self.navigationItem.rightBarButtonItems
        
        for button in rightBarButtons!{
            
            print("TAGE : ",button.tag)
            
            if button.tag == 1{
                
                if message == 0{
                    
                    button.removeBadge()
                    
                }else{
                    
                    button.addBadge(number: message)
                }
            }
            
            if button.tag == 2{
                
                if notification == 0{
                    
                    button.removeBadge()
                    
                }else{
                    
                    button.addBadge(number: notification)
                }
            }
        }
        
    }
}

extension TEAppHomeVC{
   
    func setTitle(title:String) -> Void {
        
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 45))
        titleLabel.text = title
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        titleLabel.font = ThemeManager.setThemeFont(fontType: .medium, fontSize: .large)
        self.navigationItem.titleView = titleLabel
    
    }
    
    func leftButton(imageName:String) -> Void {
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btn = UIButton()
        btn.addTarget(self, action: #selector(leftNavButtonDidClick), for: .touchUpInside)
        btn.tag = 4
        btn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        let btn1 = UIBarButtonItem(customView: btn)
        buttonsArray.append(btn1)
        
        self.navigationItem.leftBarButtonItems = buttonsArray
    }
    
    func leftNavButtonDidClick(sender:UIButton) -> Void {
        
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
        
    }
    
    func rightButton() ->Void{
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnMessage = UIButton()
        btnMessage.tag = 1
        btnMessage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnMessage.setImage(UIImage(named: "message"), for: .normal)
        
        let btnNotification = UIButton()
        btnNotification.tag = 2
        btnNotification.setImage(UIImage(named: "notification"), for: .normal)
        btnNotification.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        
        btnMessage.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnNotification.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
       let btn1 = UIBarButtonItem(customView: btnMessage)
        btn1.tag = btnMessage.tag
        
        let btn2 = UIBarButtonItem(customView: btnNotification)
        btn2.tag = btnNotification.tag
        
       buttonsArray.append(btn2)
        buttonsArray.append(btn1)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
    }
    
    func appHomeNavigationButtonClick(sender:UIButton) -> Void {
        
        /**/
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if sender.tag == 1{
            
            let msgObj = TEMessageHomeVC(nibName: "TEMessageHomeVC", bundle: nil)
            self.navigationController?.pushViewController(msgObj, animated: true)
        }
        else if sender.tag == 2{
            
            let notiObj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TENotificationVC) as! TENotificationVC
            
            self.navigationController?.pushViewController(notiObj, animated: true)
        }
            
        else if sender.tag == 3{
            
            let contact = TEContactListVC(nibName: "TEContactListVC", bundle: nil)
            self.navigationController?.pushViewController(contact, animated: true)
            
        }else if sender.tag == 4{
            
            let profile = TEProfileVC(nibName: "TEProfileVC", bundle: nil)
            self.navigationController?.pushViewController(profile, animated: true)
        }
    }
}

extension TEAppHomeVC{
    
    func createParalaxMenu() -> Void {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //SEGMENT
        segmentedPager.segmentedControl.selectionIndicatorHeight = 4.0
        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
        segmentedPager.segmentedControl.selectionStyle = .fullWidthStripe
        //segmentedPager.segmentedControl.selectionStyle = .box
        segmentedPager.segmentedControl.segmentWidthStyle = .fixed
        
        segmentedPager.segmentedControl.backgroundColor = ThemeManager.getHomePageMenuColor(colorTheme: .background)
        
        segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName :ThemeManager.getHomePageMenuColor(colorTheme: .normalText) ,NSFontAttributeName:ThemeManager.setThemeFont(fontType: .light, fontSize: .small)]
        
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : ThemeManager.getHomePageMenuColor(colorTheme: .selectedText)]
        
        segmentedPager.segmentedControl.selectionIndicatorColor = ThemeManager.getHomePageMenuColor(colorTheme: .indicator)
        
        let announcement = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEAnnouncementListVC) as! TEAnnouncementListVC
        
        announcement.baseViewController = self
        
        let trainning = TEDashboardVC(nibName: "TEDashboardVC", bundle: nil)
        
        trainning.baseViewController = self
        
        let event = TEEventVC()
        event.baseViewController = self
        
        announcement.title = "Announcements".uppercased()
        
        trainning.title = "Trainings".uppercased()
        
        event.title = "Events".uppercased()
        
        self.arrOfControllers.append(announcement)
        
        self.arrOfControllers.append(trainning)
        
        self.arrOfControllers.append(event)
        
        /*DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            self.segmentedPager.pager.showPage(at: self.indexNumber, animated: false)
        }*/
    }
    
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        
        return self.arrOfControllers.count
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        
        return  "\(module[index].uppercased())"
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        
        return self.arrOfControllers[index].view
    }
}

extension TEAppHomeVC {
    
    func callWebserviceNotificationCount() {
        
        let headerParam = NSMutableDictionary()
        
        NetworkManager.httpPostRequest(.unreadNotificationMessageCnt, dataParam: nil, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            if let data = data{
                
                if let message = data.value(forKey: "message") as? String{
                    
                    if message.lowercased() == "success".lowercased() {
                        
                        if let counts = data.value(forKey: "resultData") as? NSArray{
                            
                            for count in counts{
                                
                                if count is NSDictionary{
                                    
                                    let dict = count as! NSDictionary
                                    
                                    let messageCount = (dict.value(forKey: "unread_messages") as? Int) ?? 0
                                    
                                    let notificationCount = (dict.value(forKey: "unread_notifications") as? Int) ?? 0
                                    
                                    self.mangeBadgeCount(message: messageCount, notification: notificationCount)
                                }
                            }
                            
                        }
                    }
                }
                
            }
            
        })
    }
}
