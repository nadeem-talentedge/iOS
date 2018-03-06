//
//  TEFeaturedCourseCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 17/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEFeaturedCourseCellDelegate {
    
    func viewDetail(indexPath:IndexPath?) ->Void
}

class TEFeaturedCourseCell: BCUITableViewCell {

    var delegate:TEFeaturedCourseCellDelegate?
    static let reuseIdentifier = "kTEFeaturedCourseCell"
    static let nibName = "TEFeaturedCourseCell"
    
    @IBOutlet weak var imgCource: BCUIImageView!
    @IBOutlet weak var lblDuration: BCUILabel!
    @IBOutlet weak var lblDate: BCUILabel!
    @IBOutlet weak var lblCourseName: BCUILabel!
    @IBOutlet weak var lblInstituteName: BCUILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func videDetail(sender:BCUIButton) ->Void{
        
        if let delegate = self.delegate{
            
            delegate.viewDetail(indexPath: self.indexPath)
        }
    }
}
