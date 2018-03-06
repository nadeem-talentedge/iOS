//
//  TELecturerDetailVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

enum docmentTypeValue {
    
    case PDF
    case VIDEO
}


class TELecturerDetailVC: BCUIViewController {
    
    @IBOutlet weak var tableview: BCUITableView!
    
    var documentType : docmentTypeValue = docmentTypeValue.PDF
    var baseViewController:UIViewController?
    var moduleID:String?
    var contentId:String?
    var contentName: String?
    var contentPath: String?
    var viewNotesData:ViewNotesModel?
    var viewVideosData:ViewVideoModel?
    var contentListVideos:ContentListVideos?
    var contentListVideoInteractive:ContentListVideoInteractive?
    var stroke = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let contentName = self.contentName{
            
            self.setTitle(title: contentName)
        }
        
        self.tableview.registerCellWithTable(nibName: TEHeaderCell.nibName, reuseIdentifier: TEHeaderCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TESocialCell.nibName, reuseIdentifier: TESocialCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TECommentCell.nibName, reuseIdentifier: TECommentCell.reuseIdentifier)
        
        
        switch self.documentType {
            
        case .PDF :
            tableview.register(UINib(nibName: TEPdfDetailCell.nibName, bundle: nil), forCellReuseIdentifier: TEPdfDetailCell.reuseIdentifier)
            
            self.callWebserviceForViewNotes()
            
        case .VIDEO:
            
            tableview.register(UINib(nibName: TEVideoCell.nibName, bundle: nil), forCellReuseIdentifier: TEVideoCell.reuseIdentifier)
            
            tableview.register(UINib(nibName: TELecturerDetailCell.nibName, bundle: nil), forCellReuseIdentifier: TELecturerDetailCell.reuseIdentifier)
            
            if self.stroke == false{
            
                self.callWebserviceForViewVideos()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
}



extension TELecturerDetailVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.documentType {
        case .PDF:
           
                if self.viewNotesData != nil{
                    
                    return 2
                }
                else{
                    
                    return 0
                }
            
        case .VIDEO:
            
                
                if self.viewVideosData != nil || self.contentListVideos != nil || self.contentListVideoInteractive != nil{
                    
                    return 3
                }
                else{
                    
                    return 0
                }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch documentType {
            
        case .PDF :
            
            if indexPath.row == 0{
                
                let cell : TEHeaderCell = tableView.dequeueReusableCell(withIdentifier: TEHeaderCell.reuseIdentifier) as! TEHeaderCell
                
                if let viewNotesData = self.viewNotesData{
                    
                    cell.lblTitle.setText(text: viewNotesData.title?.capitalized)
                    cell.btnType.setText(text: "  Reference Notes")
                    cell.btnStartDate.setText(text: "  "+(viewNotesData.startDate ?? "")!)
                }
                return cell
            }
                
            else {
                
                let cell : TEPdfDetailCell = tableView.dequeueReusableCell(withIdentifier: TEPdfDetailCell.reuseIdentifier) as! TEPdfDetailCell
                cell.delegate = self
                cell.setData(model: self.viewNotesData)
                return cell
            }
                
        case .VIDEO:
            
            if indexPath.row == 0{
                
                let cell : TEHeaderCell = tableView.dequeueReusableCell(withIdentifier: TEHeaderCell.reuseIdentifier) as! TEHeaderCell
                
                if let viewVideosData = self.viewVideosData{
                    
                    cell.lblTitle.setText(text: viewVideosData.title?.capitalized)
                    cell.btnType.setText(text: "  Reference Videos")
                    cell.btnStartDate.setText(text: "  "+(viewVideosData.startDate ?? "")!)
                    
                }else if let viewVideosData = self.contentListVideos{
                    
                    cell.lblTitle.setText(text: viewVideosData.title?.capitalized)
                    cell.btnType.setText(text: "  Reference Videos")
                    cell.btnStartDate.setText(text: "  "+(viewVideosData.startDateValue ?? "")!)
                    
                }else if let viewVideosData = self.contentListVideoInteractive{
                    
                    cell.lblTitle.setText(text: viewVideosData.title?.capitalized)
                    cell.btnType.setText(text: "  Reference Videos")
                    cell.btnStartDate.setText(text: "  "+(viewVideosData.startDateValue ?? "")!)
                }
                
                return cell
            }
                
            else if indexPath.row == 1{
                
                let cell : TEVideoCell = tableView.dequeueReusableCell(withIdentifier: TEVideoCell.reuseIdentifier) as! TEVideoCell
                cell.delegate = self
                return cell
            }
                
            else {
                
                let cell : TELecturerDetailCell = tableView.dequeueReusableCell(withIdentifier: TELecturerDetailCell.reuseIdentifier) as! TELecturerDetailCell
                
                
                cell.imgUser.setImageFromUrl(url: nil,placeHolder: Utility.PLACEHOLDER_PROFILE)
                
                cell.viewAverageRating.rating = 0.0
                cell.lblTotalRating.setText(text: "0 Ratings")
                
                if let viewVideosData = self.viewVideosData{
                    
                    cell.lblDescription.setText(text: self.viewVideosData?.descriptionValue)
                    cell.lblName.setText(text: viewVideosData.createdBy)
                    cell.lblTitle.setText(text: viewVideosData.title)
                    
                }else if let viewVideosData = self.contentListVideos{
                    
                    cell.lblDescription.setText(text: self.viewVideosData?.descriptionValue)
                    cell.lblName.setText(text: viewVideosData.publishedByValue)
                    cell.lblTitle.setText(text: viewVideosData.title)
                    
                }else if let viewVideosData = self.contentListVideoInteractive{
                    
                    cell.lblDescription.setText(text: self.viewVideosData?.descriptionValue)
                    cell.lblName.setText(text: viewVideosData.publishedByValue)
                    cell.lblTitle.setText(text: viewVideosData.title)
                }
                
                
                return cell
            }
                
            /*else if indexPath.row == 3{
                
                let cell : TESocialCell = tableView.dequeueReusableCell(withIdentifier: TESocialCell.reuseIdentifier) as! TESocialCell
                cell.selectionStyle = .none
                return cell
                
            }
                
            else {
                
                let cell : TECommentCell = tableView.dequeueReusableCell(withIdentifier: TECommentCell.reuseIdentifier) as! TECommentCell
                cell.delegate = self
                return cell
            }*/
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}



//MARK: -  custom delegate of Cells
extension TELecturerDetailVC :TEVideoCellDelegate , TECommentCellDelegate,TESocialCellDelegate,TEPdfDetailCellDelegate{
    
    //MARK: - TEVideoCellDelegate
    
    func extractYoutubeIdFromLink(link: String) -> String? {
        
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        guard let regExp = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return nil
        }
        let nsLink = link as NSString
        let options = NSRegularExpression.MatchingOptions(rawValue: 0)
        let range = NSRange(location: 0, length: nsLink.length)
        let matches = regExp.matches(in: link as String, options:options, range:range)
        if let firstMatch = matches.first {
            return nsLink.substring(with: firstMatch.range)
        }
        return nil
    }
    
    func playClick() {
        
        if self.stroke == true{
            
            if let model = self.contentListVideos{
                
                if let path = model.contentPath{
                    
                    if  let link = self.extractYoutubeIdFromLink(link: path){
                        
                        let controller = YoutubePlayerVC(nibName: "YoutubePlayerVC", bundle: nil)
                        
                        controller.youtubeUrl = link
                        controller.setTitle(title: self.contentName ?? "Video")
                        
                        self.navigationController?.pushViewController(controller, animated: true)
                        
                        print("Youtube link  :---->",link)
                        
                    }else{
                        
                        let controller = TEWebView(nibName: "TEWebView", bundle: nil)
                        controller.pageType = .embedVideo
                        controller.contentId = model.id ?? "NA"//self.viewNotesData?.id
                        controller.stroke = self.stroke
                        controller.moduleID = self.moduleID
                        controller.batchName = self.contentName
                        
                        self.navigationController?.pushViewController(controller, animated: true)
                    }
                    
                    
                }else{
                    
                    Utility.showAlert(message: "video not available", title: AppName, actions: nil, controller: self)
                }

                
            }else{
              
                if let path = self.contentListVideoInteractive?.contentPath{
                    
                    if  let link = self.extractYoutubeIdFromLink(link: path){
                        
                        let controller = YoutubePlayerVC(nibName: "YoutubePlayerVC", bundle: nil)
                        
                        controller.youtubeUrl = link
                        controller.setTitle(title: self.contentName ?? "Video")
                        
                        self.navigationController?.pushViewController(controller, animated: true)
                        
                        print("Youtube link  :---->",link)
                        
                    }else{
                        
                        let controller = TEWebView(nibName: "TEWebView", bundle: nil)
                        controller.pageType = .embedVideo
                        controller.contentId = self.contentListVideoInteractive?.id ?? "NA"//self.viewNotesData?.id
                        controller.stroke = self.stroke
                        controller.moduleID = self.moduleID
                        controller.batchName = self.contentName
                        self.navigationController?.pushViewController(controller, animated: true)
                    }
                    
                    
                }else{
                    
                    Utility.showAlert(message: "video not available", title: AppName, actions: nil, controller: self)
                }

            }
            
        }else{
        
            if let path = self.viewVideosData?.contentPath{
                
                if  let link = self.extractYoutubeIdFromLink(link: path){
                    
                    let controller = YoutubePlayerVC(nibName: "YoutubePlayerVC", bundle: nil)
                    
                    controller.youtubeUrl = link
                    controller.setTitle(title: self.contentName ?? "Video")
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                    
                    print("Youtube link  :---->",link)
                    
                }else{
                    
                    let controller = TEWebView(nibName: "TEWebView", bundle: nil)
                    controller.pageType = .embedVideo
                    controller.contentId = self.viewVideosData?.id ?? "NA"
                    controller.batchName = self.contentName
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                
                
            }else{
                
                Utility.showAlert(message: "video not available", title: AppName, actions: nil, controller: self)
            }
        }
        
        
    }
    
    //MARK: - TECommentCellDelegate
    
    func rightMenu_Click() -> Void{
        
    }
    func likeComment_Click() {
        
    }
    
    func replyComment_Click() {
        
    }
    
    
    func shareComment_Click() {
        
    }
    
    //MARK: - TESocialCellDelegate
    
    
    func like_Click() -> Void{
        
    }
    func commets_Click() -> Void{
        
    }
    func share_Click() -> Void{
        
    }
    
    
    //MARK: - TEPdfDetailCellDelegate
    
    func download_Click() -> Void{
        
        self.callServiceForDownloadingFile(path: self.contentPath)
    }
    
    func readNow_Click() {
        
        let obj = TEPDFReaderVC(nibName: "TEPDFReaderVC", bundle: nil)
        
        obj.viewNotesData = self.viewNotesData
        
        obj.contentName = self.contentName
        
        obj.contentID = self.contentId
        
        if let controller = self.baseViewController{
            
            controller.navigationController?.pushViewController(obj, animated: true);
            
        }else{
        
            self.navigationController?.pushViewController(obj, animated: true);
        }
    }
    
}

//MARK: - Network Call

extension TELecturerDetailVC {
    
    func callWebserviceForVideoReadStatus() {
        
        if let contentID = self.contentId {
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["content_id"] = contentID
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.contentAccessLog, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("contentAccessLog : ------> ",data ?? "contentAccessLog Error");
                
            })
        }
    }
    
    func callWebserviceForViewNotes() {
        
        if let moduleID = self.contentId , let token = Utility.getLoginUserDetail()?.token {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            headerParam["token"] =  token
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.viewNotes, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("View Notes : ------> ",data ?? "ViewNotes Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                self.viewNotesData = ViewNotesModel(object: resultData)
                                self.tableview.reloadData()
                            }
                            
                        }else{
                            
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }
                    else{
                        
                        Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                self.stopAnimating()
            })
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForViewVideos() {
        
        if let moduleID = self.contentId , let token = Utility.getLoginUserDetail()?.token {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            headerParam["token"] =  token
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.viewVideo, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("View Video : ------> ",data ?? "view Video Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                self.viewVideosData = ViewVideoModel(object: resultData)
                                self.tableview.reloadData()
                            }
                            
                        }else{
                            
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }
                    else{
                        
                        Utility.showAlert(message:"Data not found", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                self.stopAnimating()
            })
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
}

