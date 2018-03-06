//
//  TELeftMenuVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 08/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TELeftMenuVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    
    override func viewDidLoad() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationController?.isNavigationBarHidden = true
       
        self.tableview.estimatedSectionHeaderHeight = 2.0
        
        self.tableview.sectionHeaderHeight = UITableViewAutomaticDimension
        
        self.tableview.registerCellWithTable(nibName: TELeftMenuCell.nibName, reuseIdentifier: TELeftMenuCell.reuseIdentifier)
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TELeftMenuVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let model = AppDelegate.sharedDeleagte().appSettingModel?.menuItem {
        
            return model.count+1
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableViewAutomaticDimension;
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
            
        case 0:
            let view = Bundle.main.loadNibNamed(TELeftMenuHeader.nibName, owner: self, options: nil)?[0] as! TELeftMenuHeader;
            view.delegate = self
            view.viewConfigure()
            return view;
            
        default:
            
            let view = Bundle.main.loadNibNamed(TELeftMenuItem.nibName, owner: self, options: nil)?[0] as! TELeftMenuItem;
            view.delegate = self
            view.sectionNumber = section-1
            view.btnDownArrow.isHidden = true
            
            if let model = AppDelegate.sharedDeleagte().appSettingModel?.menuItem {
                
                let item = model[section-1]
                
                if let icon = item.icon, let title = item.title {
                
                    view.configurecell(imageName: icon, titleValue:title)
                }
            }
            return view;
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

extension TELeftMenuVC : TELeftMenuItemDelegate{

    func selectSection(sectionNumber: Int) {
        
        let mainViewController = sideMenuController!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var title = ""
        
        if let model = AppDelegate.sharedDeleagte().appSettingModel?.menuItem {
            
            let item = model[sectionNumber]
            
            if let temp = item.title{
                
                title = temp
            }
        }
        
        
        switch title {
            
        case "Offline Library":
            
            let controller = TEOfflineLibrary(nibName: "TEOfflineLibrary", bundle: nil)
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            navigationController.pushViewController(controller, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Awards":
            
            let controller = TENewsLetterVC(nibName: "TENewsLetterVC", bundle: nil)
            controller.title = title
            controller.contentTypeId = "14"
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            navigationController.pushViewController(controller, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Celebrations":
            
            let controller = TENewsLetterVC(nibName: "TENewsLetterVC", bundle: nil)
            controller.title = title
            controller.contentTypeId = "13"
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            navigationController.pushViewController(controller, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Recruitments":
            
            let searchObj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TERefferalHome) as! TERefferalHome
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            navigationController.pushViewController(searchObj, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Contacts":
            
            let contactVC = TEContactListVC(nibName: "TEContactListVC", bundle: nil)
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            navigationController.pushViewController(contactVC, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Help":
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            let vc = TEWebView(nibName: "TEWebView", bundle: nil)
            vc.pageType = .help
            
            navigationController.pushViewController(vc, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "About PVR":
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            let vc = TEWebView(nibName: "TEWebView", bundle: nil)
            vc.pageType = .about
            
            navigationController.pushViewController(vc, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Profile":
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            let vc = TEUserProfileVC(nibName: "TEUserProfileVC", bundle: nil)
            navigationController.pushViewController(vc, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            break
            
        case "My Certificates":
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            let vc = TEMyCertificateVC(nibName: "TEMyCertificateVC", bundle: nil)
            navigationController.pushViewController(vc, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
            break
            
        case "Sign Out":
            self.logout()
            
        default:
            
            NotificationCenter.default.post(name: Notification.Name.changeTab, object: title)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
        }
    }
}

extension TELeftMenuVC{
    
    func logout() -> Void {
        
        let yes = UIAlertAction(title: "Yes", style: .default) { action in
            
            if let nav = AppDelegate.sharedDeleagte().baseNavigationController{
                
                Utility.deleteLoginUser()
                nav.popToRootViewController(animated: true)
            }
        }
        
        let no = UIAlertAction(title: "No", style: .cancel) { action in
            
            print("Dismiss")
        }
        
        Utility.showAlert(message: "Do you want to logout?", title: nil, actions: [yes,no], controller: self)
    }
}

extension TELeftMenuVC : TELeftMenuHeaderDelegate{
    
    func editProfile_Click(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let  userprofile : TEUserProfileVC = storyboard.instantiateViewController(withIdentifier:Utility.ID_TEUserProfileVC) as! TEUserProfileVC
        
        if let nav = AppDelegate.sharedDeleagte().baseNavigationController{
            
            nav.present(userprofile, animated: true, completion: {
                
                //TEMenuManager.sharedInstance.slidingPanel.toggleLeftSlidingPanel()
            })
        }
    }
    
}
