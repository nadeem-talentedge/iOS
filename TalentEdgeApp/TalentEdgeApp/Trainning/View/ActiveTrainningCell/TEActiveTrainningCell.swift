//
//  TEActiveTrainningCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 20/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import Cosmos

protocol TEActiveTrainningCellDelegate {
    
    func didSelectShareButton() -> Void
    func didSelectOpetion(indexPath:IndexPath?,key:String?) -> Void
    
}

class TEActiveTrainningCell: BCUITableViewCell {
    

    var delegate:TEActiveTrainningCellDelegate?
    var OngoingCourseData : OngoingCourse?
    
    
    static let reuseIdentifier = "mTEActiveTrainningCell"
    static let nibName = "TEActiveTrainningCell"

    var arrOpetions = [["title":"Complete Module","icon":""],
                       ["title":"live class","icon":"home_LiveClass.png"],
                       ["title":"attendance","icon":""],
                       ["title":"Assignments","icon":"home_assignment.png"],
                       ["title":"Assessments","icon":"home_assessment.png"],
                       ["title":"discussion","icon":"home_discussions.png"],
                       ["title":"learners","icon":"home_learners.png"],]
    
    @IBOutlet weak var viewTop: BCView!
    @IBOutlet weak var imgIcon: BCUIImageView!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblCurrentCource: BCUILabel!
    @IBOutlet weak var lblFacultyName: BCUILabel!
    @IBOutlet weak var viewStar: CosmosView!
    @IBOutlet weak var lblRating: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    @IBOutlet weak var collectionView: BCUICollectionView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.viewTop.backgroundColor = ThemeManager.setThemeColor(appColor: .navigation)
        self.lblTitle.fontSize = .large
        self.lblTitle.fontType = .bold
        self.lblTitle.setTextColor = .text_app_button
        
        self.lblCurrentCource.fontSize = .medium
        self.lblCurrentCource.fontType = .italic
        self.lblCurrentCource.setTextColor = .text_app_button
        
        self.lblFacultyName.fontSize = .medium
        self.lblFacultyName.fontType = .italic
        self.lblFacultyName.setTextColor = .text_app_button
        
        self.lblRating.fontSize = .small
        self.lblRating.fontType = .light
        self.lblRating.setTextColor = .text_app_button
        
        self.collectionView.registerCellWithCollection(nibName: TEGraphCell.nibName, reuseIdentifier: TEGraphCell.reuseIdentifier)
        
        
        self.collectionView.registerCellWithCollection(nibName: TEActiveTrainingOpetionCell.nibName, reuseIdentifier: TEActiveTrainingOpetionCell.reuseIdentifier)
        
        self.collectionView.registerCellWithCollection(nibName: TEActiveTrainingOpetionAttendanceCell.nibName, reuseIdentifier: TEActiveTrainingOpetionAttendanceCell.reuseIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:-
    
    @IBAction func shareButtonDidClick(sender:BCUIButton){
    
        if let delegate = self.delegate{
        
            delegate.didSelectShareButton()
        }
    }
    
    @IBAction func opetionButtonDidClick(sender:BCUIButton){
      
        /*if let delegate = self.delegate{
            
            delegate.didSelectOpetion(tag: sender.tag)
        }*/
    }
    
    func setData(data:OngoingCourse?) -> Void {
        
        
        if let data = data{
            
            OngoingCourseData = data
            
            
            self.lblTitle.setText(text: "\((data.courseName ?? "")) - \((data.name ?? ""))")
            
            self.lblCurrentCource.setText(text:data.courseDuration)
            
            if let faculty = data.faculty{
                
                if faculty.count > 0 {
                    
                    
                    self.lblFacultyName.setText(text:"By - \((faculty[0].fname ?? "")) \((faculty[0].lname ?? ""))")
                    
                }else{
                    
                    self.lblFacultyName.setText(text:"By -")
                }
                
            }else{
                
                self.lblFacultyName.setText(text:"By -")
            }
            
            //self.lblFacultyName.setText(text:data.fac)
            
            if let rating = data.totalBatchRating{
            
                self.lblRating.setText(text: "\(rating) Ratings")
                
            }else{
            
                self.lblRating.setText(text: "0 Ratings")
            }
            
            self.viewStar.rating = Double(data.averageRatingInCourse ?? 0)
            
            self.imgIcon.setImageFromUrl(url: data.logo,placeHolder: Utility.PLACEHOLDER_PROFILE)
        }
        
    }
    
}


extension TEActiveTrainningCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    /*func numberOfSections(in collectionView: UICollectionView) -> Int {
     }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  self.arrOpetions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.height+20, height: collectionView.frame.size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if indexPath.row == 0 {
            
            let cell : TEGraphCell  = collectionView.dequeueReusableCell(withReuseIdentifier: TEGraphCell.reuseIdentifier, for: indexPath) as! TEGraphCell
            
            let dict = self.arrOpetions[indexPath.row]
            
            cell.lblTitle.setText(text: dict["title"]?.uppercased())
           
            cell.configureCell(data: OngoingCourseData)
            
            return cell
            
        }
        else if indexPath.row == 2 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TEActiveTrainingOpetionAttendanceCell.reuseIdentifier, for: indexPath) as! TEActiveTrainingOpetionAttendanceCell;
            
            let dict = self.arrOpetions[indexPath.row]
            
            if let attendence = OngoingCourseData?.attendancePercentage{
            
                cell.viewAttadence.value  = CGFloat(attendence)
            }else{
            
                cell.viewAttadence.value = 0
            }
            
            cell.lblTitle.setText(text: dict["title"]?.uppercased())
        
            return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TEActiveTrainingOpetionCell.reuseIdentifier, for: indexPath) as! TEActiveTrainingOpetionCell;
            
            let dict = self.arrOpetions[indexPath.row]
            
            cell.lblTitle.setText(text: dict["title"]?.uppercased())
            cell.imgIcon.setImage(name: dict["icon"])
            
            if indexPath.row == 1{//Live Class
            
                if let liveClassDetail = OngoingCourseData?.liveClassDetails{
                
                    if liveClassDetail.count > 0 {
                
                        cell.lblCount.setText(text: OngoingCourseData?.liveClassDetails?[0].time)
                    }else{
                    
                        cell.lblCount.setText(text:" ")
                    }
                }else{
                
                    cell.lblCount.setText(text:" ")
                }
                
            }else if indexPath.row == 3{
            
                cell.lblCount.setText(text: OngoingCourseData?.assignment)
                
            }else if indexPath.row == 4{
                
                cell.lblCount.setText(text: OngoingCourseData?.assessment)
                
            }else if indexPath.row == 5{
                
                cell.lblCount.setText(text: OngoingCourseData?.discussion)
                
            }else if indexPath.row == 6{
                
                if let learnerCount = OngoingCourseData?.learner{
                
                    cell.lblCount.setText(text: "\(learnerCount)")
                    
                }else{
                
                    cell.lblCount.setText(text: "0")
                }
                
            }else{
            
                cell.lblCount.setText(text:"0")
            }
            
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let delegate = self.delegate {
        
           let dict = self.arrOpetions[indexPath.row]
           delegate.didSelectOpetion(indexPath: self.indexPath,key: dict["title"]?.lowercased())
        }
    }
}
