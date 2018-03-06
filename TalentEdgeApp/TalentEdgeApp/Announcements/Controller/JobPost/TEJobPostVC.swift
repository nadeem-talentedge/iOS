//
//  TEJobPostVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEJobPostVC: BCUIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    
    var baseURL:String?
    
    var baseViewController:UIViewController?
    
    var arrOfAnnouncement = Array<Any>()
    
    var pageNumber = 1
    
    var pageLimit = 100
    
    var selectedContentID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //self.tableView.backgroundColor = UIColor(colorLiteralRed: 220.0/255.0, green: 238.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        self.registerCellWithTableView()
        self.callWebserviceForAnnouncementList()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK:- User Define

extension TEJobPostVC {

    func registerCellWithTableView() -> Void {
    
        self.tableView.estimatedSectionHeaderHeight = 2.0
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        self.tableView.registerCellWithTable(nibName: TEJobPostCell.nibName, reuseIdentifier: TEJobPostCell.reuseIdentifier)
    }
    
    func likePost(indexPath:IndexPath?,contentID:String?) -> Void {
        
        self.callWebserviceForLikePost(indexPath: indexPath, contentID: contentID)
    }
    
    func openCommentView(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath {
            
            let messageController = ANCommentsVC(nibName: "ANCommentsVC", bundle: nil)
            
            let model = self.arrOfAnnouncement[indexPath.row]
            
            if model is ANRecruitmentModel{
                
                if let model = model as? ANRecruitmentModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
            }
            
            if let vc = self.baseViewController{
                
                vc.navigationController?.pushViewController(messageController, animated: false)
            }
        }
    }
}

//MARK:- Tableview Delegate
extension TEJobPostVC :UITableViewDelegate,UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return self.arrOfAnnouncement.count
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            
            return UITableViewAutomaticDimension;
            
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            let view = Bundle.main.loadNibNamed(TEJobPostHeader.nibName, owner: self, options: nil)?[0] as! TEJobPostHeader;
            return view;
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEJobPostCell.reuseIdentifier, for: indexPath) as! TEJobPostCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            cell.setData(model: self.arrOfAnnouncement[indexPath.row] as? ANRecruitmentModel)
            
            return cell
        }
}

//MARK:- Recruitment Cell

extension TEJobPostVC:TEJobPostCellDelegate{
    
    func jobPostDidSelectRefer(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
        
            let model = self.arrOfAnnouncement[indexPath.row] as! ANRecruitmentModel
            self.selectedContentID = model.id
            self.actionSheetForPhoto()
        }
    }
    
    override func getImageFromImagePicker(image: UIImage, url: NSURL?) {
        
        self.callWebserviceForUploadReferDocument(docImage: image, contentId: self.selectedContentID)
    }
    
    func jobPostDidSelectMessage(indexPath:IndexPath?) -> Void{
     
        self.openCommentView(indexPath: indexPath)
    }
    
    func jobPostDidSelectLike(indexPath:IndexPath?) -> Void{
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANRecruitmentModel
            self.likePost(indexPath: indexPath,contentID: model.id)
        }
    }
    
    func jobPostDidSelectDownloadFile(indexPath:IndexPath?) -> Void{
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANRecruitmentModel
            self.callServiceForDownloadingFile(path: (self.baseURL ?? "")+(model.contentPath ?? ""))
        }
    }
}

//MARK:- Server Call

extension TEJobPostVC {
    
    func callWebserviceForUploadReferDocument(docImage : UIImage, contentId:String?) {
        
        
        if let content_id = contentId{
            
            let paramParam : NSMutableDictionary = NSMutableDictionary()
            paramParam["content_id"] = content_id
            
            let headerParam : NSMutableDictionary = NSMutableDictionary()
            
            self.startAnimating()
            
            
            NetworkManager.httpMultiPartFromRequest(.addReferral, dataParam: paramParam, requestHeader: headerParam,  userimage : docImage,completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Upload Assignment: ------> ",data ?? "Upload Assignment error");
                
                if let data = data{
                    
                    if let status = data.value(forKey: "status") as? Bool {
                        
                        if status == true{
                            
                            Utility.showAlert(message: "Refer doc uploaded successfully", title: AppName, actions: nil, controller: self)
                            
                        }else{
                            
                            if let message = data.value(forKey: "message") as? String{
                                
                                Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                            }
                            else{
                                
                                Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                            }
                        }
                        
                    }else{
                        
                        if let message = data.value(forKey: "message") as? String{
                            
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        else{
                            
                            Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                        }
                    }
                }
                self.stopAnimating()
            })
            
            
        }
        else{
            
            Utility.showAlert(message: "content id not available", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForAnnouncementList() {
        
        self.startAnimating()
        
        let body = NSMutableDictionary();
        body["content_type_id"] = "15"
        body["limit"] = String(pageLimit)
        body["page"] = String(pageNumber)
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.getAnnouncement, dataParam: body, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Announcement Data : ------> ",data ?? "Announcement Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        self.baseURL = data.value(forKey: "ASSETS_BASE_URL") as? String
                        self.pageNumber += 1
                        
                        if let resultData = data.value(forKey: "resultData") as? NSArray {
                            
                            //print("Total Record From Server ---------------->",resultData.count)
                            
                            for dict in resultData{
                                
                                if let dict = dict as? NSDictionary{
                                
                                    self.arrOfAnnouncement.append(ANRecruitmentModel(object: dict))
                                }
                            }
                        }
                    }
                }
            }
            self.tableView.reloadData()
            self.stopAnimating()
        } )
    }
    
    func callWebserviceForLikePost(indexPath:IndexPath? ,contentID:String?) {
        
        //self.startActivityAnimating()
        
        if let contentID = contentID{
            
            let param = NSMutableDictionary();
            
            let body = NSMutableDictionary();
            body["content_id"] = contentID
            
            NetworkManager.httpPostRequest(.likeContent, dataParam: body, requestHeader: param, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                if let data = data{
                    
                    if let status = data.value(forKey: "status") as? Int{
                        
                        if status == 1 {
                            
                            if let indexPath = indexPath{
                            
                                let model = self.arrOfAnnouncement[indexPath.row]
                                
                                if model is ANRecruitmentModel{
                                    
                                    if let model = model as? ANRecruitmentModel{
                                        
                                        model.selfLiked = 1
                                        self.tableView.reloadRows(at: [indexPath], with: .fade)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }
                //self.stopAnimating()
                
            } )
        }
    }
}
