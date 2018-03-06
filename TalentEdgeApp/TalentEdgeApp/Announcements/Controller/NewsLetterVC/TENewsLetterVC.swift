//
//  TENewsLetterVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 01/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TENewsLetterVC: BCUIViewController {
    
    #if ELSA
    
    let arrFilter = ["News","Job","Event"]
    
    #else
    
    let arrFilter = ["Notes","Video","Interactive Video","Assessment","Assignment","Module Planner","Live Class","Discussion","Joining","Anniversary","Birthday","Event","Celebration","Award"]
    
    #endif
    
    @IBOutlet weak var tableView: BCUITableView!
    
    var baseViewController:UIViewController?
    var arrOfAnnouncement = Array<Any>()
    var baseURL:String?
    var selectedContentID:String?
    var navTitle = ""
    var contentTypeId = "0"
    var pageNumber = 1
    var pageLimit = 100
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.setTitle(title: self.navTitle)
        
        //Register Cell With TableView
        self.registerCellWithTableView()
        
        //Server Data
        self.callWebserviceForAnnouncementList()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

//MARK:- User Define

extension TENewsLetterVC {
    
    func registerCellWithTableView() -> Void {
        
        
        //self.tableView.estimatedSectionHeaderHeight = 2.0
        
        //self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        self.tableView.registerCellWithTable(nibName: ANAnniversaryCell.nibName, reuseIdentifier: ANAnniversaryCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEAssesmentsCell.nibName, reuseIdentifier: TEAssesmentsCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEAssignmentsCell.nibName, reuseIdentifier: TEAssignmentsCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANAwardCell.nibName, reuseIdentifier: ANAwardCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANBirthdayCell.nibName, reuseIdentifier: ANBirthdayCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANEventCell.nibName, reuseIdentifier: ANEventCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANJoiningCell.nibName, reuseIdentifier: ANJoiningCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TELiveClassCell.nibName, reuseIdentifier: TELiveClassCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: ANRecruitmentCell.nibName, reuseIdentifier: ANRecruitmentCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEReferenceNotesCell.nibName, reuseIdentifier: TEReferenceNotesCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TENewsLetterCell.nibName, reuseIdentifier: TENewsLetterCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEEmptyCell.nibName, reuseIdentifier: TEEmptyCell.reuseIdentifier)
    }
    
    func likePost(indexPath:IndexPath?,contentID:String?) -> Void {
        
        self.callWebserviceForLikePost(indexPath: indexPath, contentID: contentID)
    }
    
    func openCommentView(indexPath:IndexPath?) -> Void {
        
        if let indexPath = indexPath {
            
            print("Index Path :",indexPath.row)
            
            let messageController = ANCommentsVC(nibName: "ANCommentsVC", bundle: nil)
            messageController.delegate = self
            messageController.indexPath = indexPath
            
            let model = self.arrOfAnnouncement[indexPath.row]
            
            if model is ANNotesModel{
                
                if let model = model as? ANNotesModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
                
            }else if model is ANVideoModel{
                
                if let model = model as? ANVideoModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
                
            }else if model is ANLiveClassModel{
                
                if let model = model as? ANLiveClassModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
                
            }else if model is ANAssessmentModel{
                
                if let model = model as? ANAssessmentModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
                
            }else if model is ANAssignmentModel{
                
                if let model = model as? ANAssignmentModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
                
            }else if model is ANBirthdayModel{
                
                if let model = model as? ANBirthdayModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
                
            }else if model is ANAnniversaryModel{
                
                if let model = model as? ANAnniversaryModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
            }else if model is ANJoinningModel{
                
                if let model = model as? ANJoinningModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
                
            }else if model is ANRecruitmentModel{
                
                if let model = model as? ANRecruitmentModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
            }else if model is ANAwardModel{
                
                if let model = model as? ANAwardModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
            }else if model is ANEventModel{
                
                if let model = model as? ANEventModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
            }else if model is TENewLetterModel{
                
                if let model = model as? TENewLetterModel{
                    
                    messageController.contentType = model.contentTypeId
                    messageController.contentID = model.id
                }
            }
            
            
            if let vc = self.baseViewController{
                
                vc.navigationController?.pushViewController(messageController, animated: false)
                
            }else{
            
                self.navigationController?.pushViewController(messageController, animated: true)
            }
        }
    }
    
    @IBAction func newPost() ->Void{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_TENewPostVC) as! TENewPostVC
        
        if let vc = self.baseViewController{
            
            vc.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    
}

//MARK:- TableView Delegate and DataSource

extension TENewsLetterVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.arrOfAnnouncement.count > 0{
            
            self.tableView.backgroundView = nil
            return 1
            
        }else{
            
            self.tableView.backgroundView = Utility.nodataFoundView()
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOfAnnouncement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.arrOfAnnouncement[indexPath.row]
        
        if model is TENewLetterModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TENewsLetterCell.reuseIdentifier, for: indexPath) as! TENewsLetterCell
            
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            cell.lblHeading1.numberOfLines = 3
            
            cell.setData(model: model as? TENewLetterModel,baseURL: self.baseURL)
            
            return cell
            
        }
        
        if model is ANNotesModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReferenceNotesCell.reuseIdentifier, for: indexPath) as! TEReferenceNotesCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            cell.setNotes(model: model as? ANNotesModel,baseURL: self.baseURL)
            
            return cell
            
        }else if model is ANVideoModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEReferenceNotesCell.reuseIdentifier, for: indexPath) as! TEReferenceNotesCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            cell.setVideo(model: model as? ANVideoModel,baseURL: self.baseURL)
            
            return cell
            
        }else if model is ANLiveClassModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TELiveClassCell.reuseIdentifier, for: indexPath) as! TELiveClassCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            cell.setDataAnnouncment(model: model as? ANLiveClassModel,baseURL: self.baseURL)
            
            return cell
            
        }else if model is ANAssessmentModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEAssesmentsCell.reuseIdentifier, for: indexPath) as! TEAssesmentsCell
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            cell.setDataAnnouncment(model: model as? ANAssessmentModel,baseURL: self.baseURL)
            
            return cell
            
        }else if model is ANAssignmentModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEAssignmentsCell.reuseIdentifier, for: indexPath) as! TEAssignmentsCell
            
            cell.delegate = self
            
            cell.indexPath = indexPath
            
            cell.setDataAnnouncment(model: model as? ANAssignmentModel, baseURL: self.baseURL)
            
            return cell
            
        }else if model is ANBirthdayModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANBirthdayCell.reuseIdentifier, for: indexPath) as! ANBirthdayCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.setData(model: model as? ANBirthdayModel,baseURL: self.baseURL)
            return cell
            
        }else if model is ANAnniversaryModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANAnniversaryCell.reuseIdentifier, for: indexPath) as! ANAnniversaryCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.setData(model: model as? ANAnniversaryModel,baseURL: self.baseURL)
            return cell
            
        }else if model is ANJoinningModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANJoiningCell.reuseIdentifier, for: indexPath) as! ANJoiningCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.setData(model: model as? ANJoinningModel,baseURL: self.baseURL)
            return cell
            
        }else if model is ANRecruitmentModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANRecruitmentCell.reuseIdentifier, for: indexPath) as! ANRecruitmentCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.lblHeading1.numberOfLines = 3
            cell.setData(model: model as? ANRecruitmentModel,baseURL: self.baseURL)
            return cell
            
        }else if model is ANAwardModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANAwardCell.reuseIdentifier, for: indexPath) as! ANAwardCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.setData(model: model as? ANAwardModel,baseURL: self.baseURL)
            return cell
            
        }else if model is ANEventModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANEventCell.reuseIdentifier, for: indexPath) as! ANEventCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.setData(model: model as? ANEventModel,baseURL: self.baseURL)
            
            return cell
            
        }else if model is ANCelebrationModel{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ANEventCell.reuseIdentifier, for: indexPath) as! ANEventCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            cell.setCelebrationData(model: model as? ANCelebrationModel,baseURL: self.baseURL)
            
            return cell
            
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEEmptyCell.reuseIdentifier, for: indexPath) as! TEEmptyCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let model = self.arrOfAnnouncement[indexPath.row]
        
        if model is ANNotesModel{
            
            self.referenceNotes(indexPath: indexPath)
            
        }else if model is ANVideoModel{
            
            self.referenceNotes(indexPath: indexPath)
            
        }else if model is ANLiveClassModel{
            
            self.liveClass(indexPath: indexPath)
            
        }else if model is ANAssessmentModel{
            
            self.assessment(indexPath: indexPath)
            
        }else if model is ANAssignmentModel{
            
            self.assigment(indexPath: indexPath)
            
        }else if model is ANBirthdayModel{
            
            openBirthdayDetail(indexPath: indexPath)
            
        }else if model is ANAnniversaryModel{
            
            openAnniversaryDetail(indexPath: indexPath)
            
        }else if model is ANJoinningModel{
            
            openJoinningDetail(indexPath: indexPath)
            
        }else if model is ANRecruitmentModel{
            
            openRecruitmentDetail(indexPath: indexPath)
            
        }else if model is ANAwardModel{
            
            self.openAwardDetail(indexPath: indexPath)
            
        }else if model is ANEventModel{
            
            self.openEventDetail(indexPath: indexPath)
            
        }else if model is TENewLetterModel{
            
            self.openNewsLetterDelatil(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        /*if (indexPath.row) >= (self.arrOfAnnouncement.count-1){
            
            self.callWebserviceForAnnouncementList()
        }*/
    }
    
    
}

//MARK:- Delegates


//MARK:- ANCommentsVCDelegate

extension TENewsLetterVC: ANCommentsVCDelegate {
    
    func updateUI(indexPath: IndexPath?, commentCount:String) {
        
        if let indexPath = indexPath {
            
            print("Index Path :",indexPath.row)
            
            let messageController = ANCommentsVC(nibName: "ANCommentsVC", bundle: nil)
            messageController.delegate = self
            
            let model = self.arrOfAnnouncement[indexPath.row]
            
            if model is ANNotesModel{
                
                if let model = model as? ANNotesModel{
                    
                    model.commentCount = commentCount
                }
                
            }else if model is ANVideoModel{
                
                if let model = model as? ANVideoModel{
                    
                    model.commentCount = commentCount
                }
                
            }else if model is ANLiveClassModel{
                
                if let model = model as? ANLiveClassModel{
                    
                    model.commentCount = commentCount
                }
                
            }else if model is ANAssessmentModel{
                
                if let model = model as? ANAssessmentModel{
                    
                    model.commentCount = commentCount
                }
                
            }else if model is ANAssignmentModel{
                
                if let model = model as? ANAssignmentModel{
                    
                    model.commentCount = commentCount
                }
                
            }else if model is ANBirthdayModel{
                
                if let model = model as? ANBirthdayModel{
                    
                    model.commentCount = commentCount
                }
                
            }else if model is ANAnniversaryModel{
                
                if let model = model as? ANAnniversaryModel{
                    
                    model.commentCount = commentCount
                }
            }else if model is ANJoinningModel{
                
                if let model = model as? ANJoinningModel{
                    
                    model.commentCount = commentCount
                }
                
            }else if model is ANRecruitmentModel{
                
                if let model = model as? ANRecruitmentModel{
                    
                    model.commentCount = commentCount
                }
            }else if model is ANAwardModel{
                
                if let model = model as? ANAwardModel{
                    
                    model.commentCount = commentCount
                }
            }else if model is ANEventModel{
                
                if let model = model as? ANEventModel{
                    
                    model.commentCount = commentCount
                }
            }else if model is TENewLetterModel{
                
                if let model = model as? TENewLetterModel{
                    
                    model.commentCount = commentCount
                }
            }
            
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
}


//MARK:- Filter Header Cell

extension TENewsLetterVC:TEFilterHeaderDelegate{

    func didSelectFilter() -> Void{
    
    
        //Filter
        var filter = Array<TEFilterModel>()
         
         for filterName in arrFilter{
         
             let model = TEFilterModel()
             model.title = filterName
             filter.append(model)
            
         }
         
         let vc = TEFilterVC(nibName: "TEFilterVC", bundle: nil)
         vc.filter = filter
         self.presentPopupViewController(vc, animationType:MJPopupViewAnimationSlideBottomBottom)
    }
}

//MARK:- Live Class Cell

extension TENewsLetterVC:TELiveClassCellDelegate{
    
    func selectLiveClass(indexPath: IndexPath?) {
        
        self.liveClass(indexPath: indexPath)
    }
    
    func liveClass(indexPath: IndexPath?) -> Void {
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANLiveClassModel{
                
                self.callWebserviceForLiveClassURL(batchID: model.moduleId,contentId: model.id)
            }
        }
    }
}

//MARK:- Note And Video Cell

extension TENewsLetterVC:TEReferenceNotesCellDelegate{
    
    func selectNoteAndVideo(indexPath:IndexPath?) {
        
        self.referenceNotes(indexPath: indexPath)
    }
    
    func referenceNotes(indexPath: IndexPath?) -> Void {
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANNotesModel{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                controller.documentType = .PDF
                controller.contentId = model.id
                controller.contentName = model.title
                controller.contentPath = model.contentPath
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                    
                }else{
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                
                
            }else if let model = self.arrOfAnnouncement[indexPath.row] as? ANVideoModel {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                controller.documentType = .VIDEO
                controller.contentId = model.id
                controller.contentName = model.title
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                    
                }else{
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                
            }
            
        }
    }
}

//MARK:- Assessment Cell

extension TENewsLetterVC:TEAssesmentsCellDelegate{
    
    func selectAssessment(indexPath: IndexPath?) {
        
        self.assessment(indexPath: indexPath)
    }
    
    func assessment(indexPath: IndexPath?) -> Void {
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANAssessmentModel{
                
               let controller = TEAssessmentDetailVC(nibName: "TEAssessmentDetailVC", bundle: nil)
                
                controller.contentId = model.id
                
                controller.contentName = model.title
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                    
                }else{
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }
    }
}

//MARK:- Assigment Cell

extension TENewsLetterVC:TEAssignmentsCellDelegate{
    
    func selectAssignment(indexPath: IndexPath?) {
        
        self.assigment(indexPath: indexPath)
    }
    
    func assigment(indexPath: IndexPath?) -> Void {
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANAssignmentModel{
                
                let controller = TEAssignmentDetailVC(nibName: "TEAssignmentDetailVC", bundle: nil)
                
                controller.contentId = model.id
                
                controller.contentName = model.title
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                    
                }else{
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }
    }
}

//MARK:- Anniversary Cell

extension TENewsLetterVC:ANAnniversaryCellDelegate{
    
    func anniversaryDidSelectLike(indexPath: IndexPath?) {
        
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANAnniversaryModel
            self.likePost(indexPath: indexPath,contentID: model.id)
        }
    }
    
    func anniversaryDidSelectMessage(indexPath: IndexPath?) {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func openAnniversaryDetail(indexPath: IndexPath?){
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANAnniversaryModel{
                
                print("--",model.id ?? "NA")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_ANDetailVC) as! ANDetailVC
                
                controller.baseURL = self.baseURL
                controller.detailType = .Anniversary
                controller.model = model
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                }
            }
        }
    }
}

//MARK:- Joining Cell

extension TENewsLetterVC:ANJoiningCellDelegate{
    
    func joinningDidSelectLike(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANJoinningModel
            self.likePost(indexPath: indexPath,contentID: model.id)
        }
    }
    
    func joinningDidSelectMessage(indexPath: IndexPath?) {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func openJoinningDetail(indexPath: IndexPath?){
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANJoinningModel{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_ANDetailVC)
                    as! ANDetailVC
                
                controller.baseURL = self.baseURL
                controller.detailType = .Joinning
                controller.model = model
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                }
                
            }
        }
    }
}

//MARK:- BirthDay Cell

extension TENewsLetterVC:ANBirthdayCellDelegate{
    
    func birthdayDidSelectLike(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANBirthdayModel
            self.likePost(indexPath: indexPath,contentID: model.id)
        }
    }
    
    func birthdayDidSelectMessage(indexPath: IndexPath?) {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func openBirthdayDetail(indexPath: IndexPath?){
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANBirthdayModel{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_ANDetailVC) as! ANDetailVC
                
                controller.baseURL = self.baseURL
                controller.detailType = .BirthDay
                controller.model = model
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                }
                
            }
        }
    }
}

//MARK:- Award Cell

extension TENewsLetterVC:ANAwardCellDelegate{
    
    func awardDidSelectLike(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANAwardModel
            self.likePost(indexPath: indexPath,contentID: model.id)
        }
    }
    
    func awardDidSelectMessage(indexPath: IndexPath?) {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func openAwardDetail(indexPath: IndexPath?){
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANAwardModel{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_ANDetailVC) as! ANDetailVC
                
                controller.baseURL = self.baseURL
                controller.detailType = .Award
                controller.model = model
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                }
                
            }
        }
    }
    
}

//MARK:- Event Cell

extension TENewsLetterVC:ANEventCellDelegate{
    
    func eventTableReloadDelegate(indexPath: IndexPath?) {
        
        /*if let indexPath = indexPath{
         
         let cells = self.tableView.indexPathsForVisibleRows
         
         if (cells?.contains(indexPath))!{
         
         self.tableView.reloadRows(at: [indexPath], with: .none)
         }
         }*/
    }
    
    func eventDidSelectLike(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANEventModel
            self.likePost(indexPath: indexPath,contentID: model.id)
        }
        
    }
    
    func eventDidSelectMessage(indexPath: IndexPath?) {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func openEventDetail(indexPath: IndexPath?){
        
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? ANEventModel{
                
                print("Index Path :",indexPath.row)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_ANEventDetailVC) as! ANEventDetailVC
                
                controller.baseURL = self.baseURL
                controller.eventModel = model
                
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                }
            }
        }
    }
}

//MARK:- News Letter Delegate

extension TENewsLetterVC: TENewsLetterCellDelegate {
    
    func openNewsLetterDelatil(indexPath: IndexPath?){
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row]
            
            if model is  TENewLetterModel{
                
                let vc = TENewsLetterDetailVC(nibName:"TENewsLetterDetailVC", bundle: nil)
                vc.newsLetterModel = model as? TENewLetterModel
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    func newsletterDidSelectMessage(indexPath:IndexPath?) -> Void {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func newsletterDidSelectLike(indexPath:IndexPath?) -> Void{
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! TENewLetterModel
            
            if let like = model.selfLiked{
                
                if like == 0{
                    
                    self.likePost(indexPath: indexPath,contentID: model.id)
                }
            }
            
        }
    }
    
    func newsSelectNoteAndVideo(indexPath : IndexPath?) -> Void{
        
        if let indexPath  = indexPath{
            
            if let model = self.arrOfAnnouncement[indexPath.row] as? TENewLetterModel{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_TELecturerDetailVC) as! TELecturerDetailVC
                
                controller.documentType = .PDF
                controller.contentId = model.id
                controller.contentName = model.title
                controller.contentPath = model.contentPath
                
                if let vc = self.baseViewController{
                    
                    vc.navigationController?.pushViewController(controller, animated: false)
                    
                }else{
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }
    }
}

//MARK:- Recruitment Cell

extension TENewsLetterVC:ANRecruitmentCellDelegate{
    
    
    func recruitmentDidSelectRefer(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANRecruitmentModel
            self.selectedContentID = model.id
            self.actionSheetForPhoto()
        }
    }
    
    override func getImageFromImagePicker(image: UIImage, url: NSURL?) {
        
        self.callWebserviceForUploadReferDocument(docImage: image, contentId: self.selectedContentID)
    }
    
    func recruitmentDidSelectLike(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANRecruitmentModel
            self.likePost(indexPath: indexPath,contentID: model.id)
        }
    }
    
    func recruitmentDidSelectMessage(indexPath: IndexPath?) {
        
        self.openCommentView(indexPath: indexPath)
    }
    
    func recruitmentDidSelectDownloadFile(indexPath:IndexPath?) -> Void{
        
        if let indexPath = indexPath{
            
            let model = self.arrOfAnnouncement[indexPath.row] as! ANRecruitmentModel
            
            self.callServiceForDownloadingFile(path: (self.baseURL ?? "")+(model.contentPath ?? ""))
        }
    }
    
    func openRecruitmentDetail(indexPath: IndexPath?){
        
        /*if let indexPath  = indexPath{
         
         if let model = self.arrOfAnnouncement[indexPath.row] as? ANAnniversaryModel{
         
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let controller = storyboard.instantiateViewController(withIdentifier: Utility.ID_ANDetailVC) as! ANDetailVC
         
         if let vc = self.baseViewController{
         
         vc.navigationController?.pushViewController(controller, animated: false)
         }
         
         }
         }*/
    }
    
}

//MARK:- Server Call

extension TENewsLetterVC {
    
    func callWebserviceForUploadReferDocument(docImage : UIImage, contentId:String?) {
        
        if let content_id = contentId{
            
            let paramParam : NSMutableDictionary = NSMutableDictionary()
            paramParam["content_id"] = content_id
            
            let headerParam : NSMutableDictionary = NSMutableDictionary()
            
            self.startAnimating()
            
            
            NetworkManager.httpMultiPartFromRequest(.addReferral, dataParam: paramParam, requestHeader: headerParam,  userimage : docImage,completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Upload Assignment: ------> ",data ?? "Upload Assignment error");
                
                if let data = data{
                    
                    if let message = data.value(forKey: "message") as? String{
                        
                        Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                    }
                    else{
                        
                        Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
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
        
        body["content_type_id"] = self.contentTypeId
        body["limit"] = String(pageLimit)
        body["page"] = String(pageNumber)
        
        let header = NSMutableDictionary();
        
        NetworkManager.httpPostRequest(.getAnnouncement, dataParam: body, requestHeader: header, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            //print("Announcement Data : ------> ",data ?? "Announcement Error");
            
            if let data = data{
                
                if let status = data.value(forKey: "status") as? Int{
                    
                    if status == 1 {
                        
                        self.pageNumber += 1
                        
                        self.baseURL = data.value(forKey: "ASSETS_BASE_URL") as? String
                        
                        if let resultData = data.value(forKey: "resultData") as? NSArray {
                            
                            //print("Total Record From Server ---------------->",resultData.count)
                            
                            for dict in resultData{
                                
                                if let dict = dict as? NSDictionary{
                                    
                                    
                                    if let contentTypeID = dict.value(forKey: "content_type_id"){
                                        
                                        var contentTypeTemp = -1
                                        
                                        if contentTypeID is String{
                                            
                                            contentTypeTemp = Int(contentTypeID as! String)!
                                            contentTypeTemp -= 1
                                        }
                                        
                                        if contentTypeID is Int{
                                            
                                            contentTypeTemp = contentTypeID as! Int
                                            contentTypeTemp -= 1
                                            
                                        }
                                        
                                        #if ELSA
                                        self.parseDataForELSA(dict: dict, contentTypeTemp: contentTypeTemp)
                                            
                                        #else
                                            self.parseDataForAll(dict: dict, contentTypeTemp: contentTypeTemp)
                                        
                                        #endif
                                        
                                        
                                    }
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
    
    func parseDataForAll(dict:NSDictionary,contentTypeTemp:Int) -> Void {
        
        switch contentTypeTemp {
            
        case CONTENT_TYPE.NOTES.hashValue:
            self.arrOfAnnouncement.append(ANNotesModel(object: dict))
            break
            
        case CONTENT_TYPE.VIDEO.hashValue:
            self.arrOfAnnouncement.append(ANVideoModel(object: dict))
            break
            
        case CONTENT_TYPE.INTERACTIVE_VIDEO.hashValue:
            //self.arrOfAnnouncement.append(ANNotesModel(object: dict)
            break
            
        case CONTENT_TYPE.ASSESSMENT.hashValue:
            self.arrOfAnnouncement.append(ANAssessmentModel(object: dict))
            break
            
        case CONTENT_TYPE.ASSIGNMENT.hashValue:
            self.arrOfAnnouncement.append(ANAssignmentModel(object: dict))
            break
            
        case CONTENT_TYPE.MODULE_PLANNER.hashValue:
            //self.arrOfAnnouncement.append(ANModu(object: dict))
            break
            
        case CONTENT_TYPE.LIVE_CLASS.hashValue:
            self.arrOfAnnouncement.append(ANLiveClassModel(object: dict))
            break
            
        case CONTENT_TYPE.DISCUSSION.hashValue:
            //self.arrOfAnnouncement.append(ANAssignmentModel(object: dict))
            break
            
        case CONTENT_TYPE.JOINING.hashValue:
            self.arrOfAnnouncement.append(ANJoinningModel(object: dict))
            break
            
        case CONTENT_TYPE.ANNIVERSARY.hashValue:
            self.arrOfAnnouncement.append(ANAnniversaryModel(object: dict))
            break
            
        case CONTENT_TYPE.BIRTHDAY.hashValue:
            self.arrOfAnnouncement.append(ANBirthdayModel(object: dict))
            break
            
        case CONTENT_TYPE.EVENT.hashValue:
            
            self.arrOfAnnouncement.append(ANEventModel(object: dict))
            break
            
        case CONTENT_TYPE.CELEBRATION.hashValue:
            self.arrOfAnnouncement.append(ANCelebrationModel(object: dict))
            break
            
        case CONTENT_TYPE.AWARD.hashValue:
            self.arrOfAnnouncement.append(ANAwardModel(object: dict))
            break
            
        case CONTENT_TYPE.RECRUITMENT.hashValue:
            
            //print("String JSON :",Utility.jsonToString(json: dict) ?? "Error","\n")
            self.arrOfAnnouncement.append(ANRecruitmentModel(object: dict))
            break
            
        default:
            break
        }
    }
    
    func parseDataForELSA(dict:NSDictionary,contentTypeTemp:Int) -> Void {
        
        print("Content ID ---------------->",contentTypeTemp)
        
        switch contentTypeTemp {
        
        case CONTENT_TYPE.NOTES.hashValue:
        
            self.arrOfAnnouncement.append(TENewLetterModel(object: dict))
            
            break
            
        case CONTENT_TYPE.EVENT.hashValue:
            
            self.arrOfAnnouncement.append(ANEventModel(object: dict))
            break
            
        case CONTENT_TYPE.RECRUITMENT.hashValue:
            
            //print("RECRUITMENT -----------------> :",Utility.jsonToString(json: dict) ?? "Error","\n\n\n")
            
            self.arrOfAnnouncement.append(ANRecruitmentModel(object: dict))
            break
            
        default:
            break
        }
    }
    
    
    func callWebserviceForLikePost(indexPath:IndexPath? ,contentID:String?) {
        
        //self.startActivityAnimating()
        
        if let contentID = contentID{
            
            let param = NSMutableDictionary();
            
            let body = NSMutableDictionary();
            body["content_id"] = contentID
            
            NetworkManager.httpPostRequest(.likeContent, dataParam: body, requestHeader: param, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                //print("Like Content  : ------> ",Utility.jsonToString(json: data) ?? "NA");
                
                if let data = data{
                    
                    if let status = data.value(forKey: "status") as? Int{
                        
                        if status == 1 {
                            
                            if let indexPath = indexPath{
                                
                                let model = self.arrOfAnnouncement[indexPath.row]
                                
                                if model is ANBirthdayModel{
                                    
                                    if let model = model as? ANBirthdayModel{
                                        
                                        model.selfLiked = 1
                                    }
                                    
                                }else if model is ANAnniversaryModel{
                                    
                                    if let model = model as? ANAnniversaryModel{
                                        
                                        model.selfLiked = 1
                                    }
                                    
                                }else if model is ANJoinningModel{
                                    
                                    if let model = model as? ANJoinningModel{
                                        
                                        model.selfLiked = 1
                                    }
                                    
                                    
                                }else if model is ANRecruitmentModel{
                                    
                                    if let model = model as? ANRecruitmentModel{
                                        
                                        model.selfLiked = 1
                                    }
                                    
                                }else if model is ANAwardModel{
                                    
                                    if let model = model as? ANAwardModel{
                                        
                                        model.selfLiked = 1
                                    }
                                    
                                }else if model is ANEventModel{
                                    
                                    if let model = model as? ANEventModel{
                                        
                                        model.selfLiked = 1
                                    }
                                }
                                self.tableView.reloadRows(at: [indexPath], with: .fade)
                            }
                        }
                    }
                }
                
                //self.stopActivityAnimating()
            } )
        }
    }
    
    func callWebserviceForLiveClassURL(batchID:String?,contentId:String?) {
        
        if let batchID = batchID, let contentId = contentId {
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["batch_id"] = batchID
            dicParam["content_id"] = contentId
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.joinLiveClass, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                //print("Live Class URL : ------> ",data ?? "Live Class Eorrr");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                
                                if let url = resultData.value(forKey: "URL") as? String{
                                    
                                    if let urlServer = URL(string: url){
                                        
                                        if UIApplication.shared.canOpenURL(urlServer){
                                            
                                            UIApplication.shared.openURL(urlServer)
                                            
                                        }else{
                                            
                                            Utility.showAlert(message: "Invalid Url", title: AppName, actions: nil, controller: self)
                                        }
                                        
                                    }else{
                                        
                                        Utility.showAlert(message: "Invalid Url", title: AppName, actions: nil, controller: self)
                                    }
                                    
                                }else{
                                    
                                    Utility.showAlert(message: "Invalid Url", title: AppName, actions: nil, controller: self)
                                }
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
            
        }else{
            
            Utility.showAlert(message: "Batch id or user name not available", title: AppName, actions: nil, controller: self)
        }
    }
    
    
}
