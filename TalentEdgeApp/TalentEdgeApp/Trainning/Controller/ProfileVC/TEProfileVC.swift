//
//  TEProfileVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 14/10/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEProfileVC: BCUIViewController {

    let editProfile = "Edit Profile"
    let settings = "Settings"
    let aboutTalentEdge = "About TalentEdge"
    let help = "Help"
    let logout = "Logout"
    
    let itmes = [["icon":"menu_edit_profile","title":"Edit Profile"],["icon":"menu_about","title":"About TalentEdge"],["icon":"menu_help","title":"Help"],["icon":"menu_logout","title":"Logout"]]
    
    @IBOutlet weak var tableview: BCUITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitle(title: "Profile")
        
        self.tableview.sectionHeaderHeight = UITableViewAutomaticDimension;
        self.tableview.estimatedSectionHeaderHeight = 200.0
        
        self.tableview.registerCellWithTable(nibName: TEProfileMenuNavigationCell.nibName, reuseIdentifier: TEProfileMenuNavigationCell.reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TEProfileVC{
    
    func logoutDidSelect() -> Void {
        
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

extension TEProfileVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.itmes.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TEProfileHeader.nibName, owner: self, options: nil)?[0] as! TEProfileHeader;

        view.userImg.setImageFromUrl(url: Utility.getLoginUserDetail()?.resultData?.user?.avtarUrl, placeHolder: nil)
        
        return view;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: TEProfileMenuNavigationCell.reuseIdentifier, for: indexPath) as! TEProfileMenuNavigationCell
        
        let dict = self.itmes[indexPath.row]
        
        cell.lblTitle.setText(text: dict["title"])
        cell.imgIcon.setImage(name: dict["icon"])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = self.itmes[indexPath.row]
        
        if let title = dict["title"]{
        
            switch title {
                
            case self.editProfile:
                
                let vc = TEUserProfileVC(nibName: "TEUserProfileVC", bundle: nil)
                vc.isEdit = true
                self.navigationController?.pushViewController(vc, animated: true)
                
                print("")
                break
                
            case self.settings:
                print("")
                break
                
            case self.aboutTalentEdge:
                
                self.navigationController?.navigationBar.isHidden = false
                let vc = TEWebView(nibName: "TEWebView", bundle: nil)
                vc.pageType = .about
                self.navigationController?.pushViewController(vc, animated: true)
                
                break
                
            case self.help:
                
                self.navigationController?.navigationBar.isHidden = false
                let vc = TEWebView(nibName: "TEWebView", bundle: nil)
                vc.pageType = .help
                self.navigationController?.pushViewController(vc, animated: true)
                
                break
                
            case self.logout:
                logoutDidSelect()
                break
                
            default:
                print("wrong selection")
                break
            }
        }
        
    }
}
