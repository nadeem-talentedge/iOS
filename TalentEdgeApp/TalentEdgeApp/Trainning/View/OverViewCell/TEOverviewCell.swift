//
//  TEOverviewCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import Cosmos


class TEOverviewCell: BCUITableViewCell {

    
    @IBOutlet weak var userImage: BCUIImageView!
    @IBOutlet weak var rating: BCUILabel!
    @IBOutlet weak var name: BCUILabel!
    @IBOutlet weak var traingDetail: BCUILabel!
    @IBOutlet weak var traingName: BCUILabel!
    @IBOutlet weak var viewAverageRating: CosmosView!
    
    static let reuseIdentifier = "KTEOverviewCell"
    static let nibName = "TEOverviewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(model:OngoingCourse) -> Void {
     
        self.userImage.setImageFromUrl(url: model.bannerUrl,placeHolder: Utility.PLACEHOLDER_PROFILE)
        
        if let faculties = model.faculty {
            
            if faculties.count > 0{
                
                self.name.setText(text:"\((faculties[0].fname ?? ""))  \((faculties[0].lname ?? ""))")
            }
        }
        
        self.traingName.setText(text: model.courseName)
        
        self.traingDetail.setText(text: model.descriptionValue)
        
        self.viewAverageRating.rating = Double((model.averageRatingInCourse ?? 0))
        self.rating.setText(text: "\((model.totalBatchRating ?? 0))"+" "+"Rating")
        
    }
}
