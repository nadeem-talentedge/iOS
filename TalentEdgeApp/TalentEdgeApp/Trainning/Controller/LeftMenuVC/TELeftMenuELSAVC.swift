//
//  TELeftMenuVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 08/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TELeftMenuELSAVC: BCUIViewController {

    var isExpand = false
    
    @IBOutlet weak var tableview: BCUITableView!
    
    override func viewDidLoad() {
        
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

extension TELeftMenuELSAVC : UITableViewDataSource,UITableViewDelegate{
    
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
            
            if let model = AppDelegate.sharedDeleagte().appSettingModel?.menuItem {
                
                let item = model[view.sectionNumber]
                
                if let icon = item.icon, let title = item.title {
                    
                    if title == "About ELSA"{
                        
                        view.btnDownArrow.isHidden = false
                        
                    }else{
                        
                        view.btnDownArrow.isHidden = true
                    }
                    
                    view.configurecell(imageName: icon, titleValue:title)
                }
            }
            return view;
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isExpand{
        
            
            if let model = AppDelegate.sharedDeleagte().appSettingModel?.menuItem {
                
                //print("Index Number 2 -------------------------->",section-1)
                
                if (section-1) >= 0{
                
                      let item =  model[section-1]
                        
                        if let subMenu = item.submenu{
                            
                            return subMenu.count
                        }
                }
            }
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TELeftMenuCell = tableView.dequeueReusableCell(withIdentifier: TELeftMenuCell.reuseIdentifier) as! TELeftMenuCell
        
        if let model = AppDelegate.sharedDeleagte().appSettingModel?.menuItem {
        
            //print("Index Number 3 -------------------------->",indexPath.section-1)
            
            let item = model[indexPath.section-1]
            
            if let subMenu = item.submenu{
                
                cell.lblTitle.setText(text: subMenu[indexPath.row] as? String)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = TEWebView(nibName: "TEWebView", bundle: nil)
        
        if indexPath.row == 0{
        
            controller.pageType = .mission
            
        }else{
        
            controller.pageType = .executive
        }
        
        
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! BCUINavigationController
        navigationController.pushViewController(controller, animated: true)
        mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
    }
}

extension TELeftMenuELSAVC : TELeftMenuItemDelegate{
    
    func selectSection(sectionNumber: Int) {
        
        //print("Index Number -------------------------->",sectionNumber)
        
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
            
        case "ELSA Connect":
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Newsletters":
            
            let controller = TENewsLetterVC(nibName: "TENewsLetterVC", bundle: nil)
            
            controller.contentTypeId = "1"
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            navigationController.pushViewController(controller, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "Job Board":
            
            let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_TERefferalHomeELSA) as! TERefferalHomeELSA
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            
            navigationController.pushViewController(controller, animated: true)
            
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
        
        case "Help":
            
            let controller = TEWebView(nibName: "TEWebView", bundle: nil)
            controller.pageType = .help
            
            let navigationController = mainViewController.rootViewController as! BCUINavigationController
            navigationController.pushViewController(controller, animated: true)
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
            
        case "About ELSA":
            
            self.isExpand = !self.isExpand
            self.tableview.reloadData()
            
        case "Logout":
            
            self.logout()
            
        default:
            print("Wrong Selection")
        }
    }
}

extension TELeftMenuELSAVC{

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

extension TELeftMenuELSAVC : TELeftMenuHeaderDelegate{
    
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
