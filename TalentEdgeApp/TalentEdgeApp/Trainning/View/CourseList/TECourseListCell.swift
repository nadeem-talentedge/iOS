//
//  TEActiveTrainningCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 20/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TECourseListCellDelegate {
    
    func didSelectSemester(model:Semester?,indexPath:IndexPath?) -> Void
    func didCareerstrokes(model:ExternalCourse?) -> Void
    func didSelectInfo(description:String?) -> Void
}

class TECourseListCell: BCUITableViewCell {
    
    var delegate:TECourseListCellDelegate?
    
    static let nibName = "TECourseListCell"
    static let reuseIdentifier = "mTECourseListCell"
    
    
    static let nibName_Two = "TECourseListCell_Two"
    static let reuseIdentifier_Two = "mTECourseListCell_Two"
    
    var isCellTypeTwo = false

    @IBOutlet weak var imgLogo: BCUIImageView!
    @IBOutlet weak var lblCourseName: BCUILabel!
    @IBOutlet weak var lblInstituteName: BCUILabel!
    @IBOutlet weak var lblDuration: BCUILabel!
    @IBOutlet weak var lblLearnerCounts: BCUILabel!
    @IBOutlet weak var collectionView: BCUICollectionView!
    
    var internalCourse:InternalCourse?
    var externalCourse:ExternalCourse?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.collectionView.registerCellWithCollection(nibName: TESemeterCell.nibName, reuseIdentifier: TESemeterCell.reuseIdentifier)
        
        self.collectionView.registerCellWithCollection(nibName: TESemeterCell_Two.nibName, reuseIdentifier: TESemeterCell_Two.reuseIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:-
    
    @IBAction func shareButtonDidClick(sender:BCUIButton){
    
    }
    
    @IBAction func infoButtonDidClick(sender:BCUIButton){
    
        
        if isCellTypeTwo == true {
            
            if let delegate = self.delegate {
                
                if let model = self.externalCourse{
                    
                    delegate.didSelectInfo(description: model.descriptionValue)
                }
            }
            
        }else{
            
            if let delegate = self.delegate {
                
                if let model = self.internalCourse{
                    
                    delegate.didSelectInfo(description: model.courseDescription)
                }
            }
        }
        
    }
    
    func setInternalCourse(model:InternalCourse?) -> Void {
        
        if let model = model{
            
            self.internalCourse = model
            
            if let url =  NetworkManager.getUrl(appendAPI: false){
                
                let string = String(format: "%@%@",url,model.instituteLogo ?? "")
                self.imgLogo.setImageFromUrl(url:string,placeHolder: nil)
                
            }else{
                
                self.imgLogo.image = nil
            }
            
            self.lblCourseName.setText(text: model.courseName)
            self.lblInstituteName.setText(text: model.instituteName)
            self.lblDuration.setText(text: model.sessionName)
            
            if let count = model.studentCount{
                
                self.lblLearnerCounts.setText(text: "\(count) Learners")
            }
            
            self.collectionView.reloadData()
        }
    }
    
    func setExternalCourse(model:ExternalCourse?) -> Void {
        
        if let model = model{
            
            self.externalCourse = model
            self.imgLogo.setImageFromUrl(url: model.bannerUrl, placeHolder: nil)
            
            self.lblCourseName.setText(text: model.courseName)
            self.lblInstituteName.setText(text: model.instituteName)
            self.lblDuration.setText(text: model.courseDuration)
            
            if let count = Int(model.learner ?? "0"){
                
                self.lblLearnerCounts.setText(text: "\(count) Learners")
            }
            self.collectionView.reloadData()
        }
    }
}


extension TECourseListCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    /*func numberOfSections(in collectionView: UICollectionView) -> Int {
     }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isCellTypeTwo == true {
        
            return  1
            
        }else{
            
            if let semeters = self.internalCourse?.semester{
                
                return semeters.count
                
            }else{
                
                return 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        if isCellTypeTwo == true {
        
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        }else{
        
            return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isCellTypeTwo == true {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TESemeterCell_Two.reuseIdentifier, for: indexPath) as! TESemeterCell_Two
            
            cell.imgBanner.setImageFromUrl(url: self.externalCourse?.bannerUrl, placeHolder: nil)
            
            if let model = self.externalCourse{
            
                if let progress = Float(model.completionPercentage ?? "0"){
                
                    print("External ------>",progress)
                    cell.progress.progress = progress
                    
                }else{
                    
                    cell.progress.progress = 0.0
                }
            }else{
                
                cell.progress.progress = 0.0
            }
            
            return cell
            
        }else{
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TESemeterCell.reuseIdentifier, for: indexPath) as! TESemeterCell
            
            if let semeters = self.internalCourse?.semester{
                
                let model = semeters[indexPath.item]
                
                cell.lblSemesterName.setText(text: (model.semesterName ?? "").uppercased())
                
                if let progress = model.completionPercentage{
                
                    print("Internal ------>",progress,"::",model.semesterName)
                    cell.progress.progress = progress/100
                    
                }else{
                    
                    cell.progress.progress = 0.0
                }
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isCellTypeTwo == true {
            
            if let delegate = self.delegate {
                
                if let model = self.externalCourse{
                    
                    delegate.didCareerstrokes(model: model)
                }
            }
            
        }else{
            
            if let delegate = self.delegate {
                
                if let semeters = self.internalCourse?.semester{
                
                    delegate.didSelectSemester(model: semeters[indexPath.item],indexPath: self.indexPath)
                }
            }
        }
        
    }
}
