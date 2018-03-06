//
//  TEFeaturedCourseVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 17/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEFeaturedCourseVC: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    var baseViewController:UIViewController?
    var list = Array<SuggestedCourseModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register Cell With Identifier
        self.tableView.addRefrehsControl(target: self)
        
        self.tableView.registerCellWithTable(nibName: TEFeaturedCourseCell.nibName, reuseIdentifier: TEFeaturedCourseCell.reuseIdentifier)
        
        self.getSuggestedCourseList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.getSuggestedCourseList()
    }
}


//MARK:- Tableview Delegate

extension TEFeaturedCourseVC:UITableViewDelegate, UITableViewDataSource,TEFeaturedCourseCellDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TEFeaturedCourseCell.reuseIdentifier, for: indexPath) as! TEFeaturedCourseCell
        
        cell.indexPath = indexPath
        cell.delegate = self
        let model = self.list[indexPath.row]
        cell.imgCource.setImageFromUrl(url: model.courseImage, placeHolder: nil)
        cell.lblDate.setText(text: model.courseStartDateFomated)
        cell.lblDuration.setText(text: model.duration)
        cell.lblCourseName.setText(text: model.postTitle)
        cell.lblInstituteName.setText(text: "\(model.keyPoints0 ?? "")\n\(model.keyPoints1 ?? "")")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigate(indexPath: indexPath)
    }
    
    func viewDetail(indexPath:IndexPath?) ->Void{
        
        self.navigate(indexPath: indexPath)
        
    }
    
    func navigate(indexPath:IndexPath?) ->Void{
        
        if let indexPath = indexPath {
        
            let model = self.list[indexPath.row]
            let controller = TEWebView(nibName: "TEWebView", bundle: nil)
            controller.url = model.viewUrl
            controller.pageType = .featuredCourse
            
            if let vc = self.baseViewController{
                
                vc.navigationController?.pushViewController(controller, animated: true)
                
            }else{
                
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}

//MARK:- Server Call

extension TEFeaturedCourseVC {
    
    func getSuggestedCourseList() {
        
        self.startAnimating()
        
        let dict = NSMutableDictionary()
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.suggestedCourseList, dataParam: dict, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("suggestedCourseList : ------> ",Utility.jsonToString(json: data) ?? "Dashboard Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                     
                        self.list.removeAll()
                        if let value = data.value(forKey: "resultData") as? NSArray{
                            
                            for model in value{
                                
                                self.list.append(SuggestedCourseModel(object: model))
                            }
                        }
                    }
                }
            }
            self.tableView.endRefreshing()
            self.tableView.reloadData()
            self.stopAnimating()
        } )
        
    }
}
