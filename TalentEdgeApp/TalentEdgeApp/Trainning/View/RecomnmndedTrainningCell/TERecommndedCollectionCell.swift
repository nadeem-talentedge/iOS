//
//  TETERecommndedCollectionCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 21/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TERecommndedCollectionCell: BCUICollectionViewCell {
    
    static let reuseIdentifier = "mTERecommndedCollectionCell"
    static let nibName = "TERecommndedCollectionCell"
    
    @IBOutlet weak var lblCourceName: BCUILabel!
    
    @IBOutlet weak var btnCourceDuration: BCUIButton!
    
    @IBOutlet weak var btnRight: BCUIButton!
    
    @IBOutlet weak var btnOpetion: BCUIButton!
    
    @IBOutlet weak var imgFaculty: BCUIImageView!
    
    @IBOutlet weak var lblFacultyName: BCUILabel!
    
    @IBOutlet weak var lblStarRating: BCUILabel!
    
    @IBOutlet weak var lblTotalRating: BCUILabel!
    
    @IBOutlet weak var btnShare: BCUIButton!
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        
    }
    
    
    func setData(data:SuggestedCourse?) -> Void {
        
        if let data = data{
            
            if let faculties = data.faculty {
                
                if faculties.count > 0{
                    
                    
                    if let starDate = data.courseStartDateFomated , let endDaete = data.courseEndDateFomated {
                        
                        self.btnCourceDuration.setText(text: "\(starDate) - \(endDaete)")
                        
                    }else{
                        
                        self.btnCourceDuration.setText(text: " - ")
                    }
                    
                    self.imgFaculty.setImageFromUrl(url: nil,placeHolder: Utility.PLACEHOLDER_PROFILE)
                    
                    
                    if let faculties = data.faculty {
                        
                        if faculties.count > 0{
                            
                            self.lblFacultyName.setText(text:"\((faculties[0].fname ?? ""))  \((faculties[0].lname ?? ""))")
                        }
                    }
                    
                    self.lblStarRating.setText(text: String(data.averageBatchRating!))
                    
                    self.lblTotalRating.setText(text: String(data.totalBatchRating!)+" Ratings")
                    
                    //self.lblFacultyName.setText(text: data.faculty?.first+" "+data.faculty?.lname!)
                    
                }
            }
        }
        
        
    }
}
