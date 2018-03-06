//
//  TETestimonialsCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 27/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TETestimonialsCellDelegate {
    
    func showMore_Click(indexOfCell : Int,isShowMore : Bool)
}

class TETestimonialsCell: BCUITableViewCell {

    @IBOutlet weak var userImage: BCUIImageView!
    @IBOutlet weak var lblUserName: BCUILabel!
    @IBOutlet weak var lblDate: BCUILabel!
    @IBOutlet weak var imgTestimonial: BCUIImageView!
    @IBOutlet weak var lblTitleOfTestimonial: BCUILabel!
    @IBOutlet weak var lblDescription: BCUILabel!
    var delegate : TETestimonialsCellDelegate?
    @IBOutlet weak var btnShowMore: BCUIButton!
    
    
    static let reuseIdentifier = "KTETestimonialsCell"
    static let nibName = "TETestimonialsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureCell(object : TestimonialListBase) {
        
        lblUserName.setText(text: object.createdBy)
        
        lblDate.setText(text: "1 min ago")
        
        userImage.setImageFromUrl(url: object.pic,placeHolder: Utility.PLACEHOLDER_PROFILE)
        
        imgTestimonial.setImageFromUrl(url: object.uploads,placeHolder: Utility.PLACEHOLDER_PROFILE)
        
        lblDescription.setText(text: object.descriptionValue)
        
        lblTitleOfTestimonial.setText(text: object.createdByRole)
        
        if let showMore = object.showMore{
            
            if showMore == "YES"{
                
                self.btnShowMore.isSelected = true
                self.lblDescription.numberOfLines = 0
                
            }else{
                
                self.btnShowMore.isSelected = false
                self.lblDescription.numberOfLines = 3
            }
        }
        else{
            
            self.lblDescription.numberOfLines = 3
        }
    }
    
    
    
    @IBAction func showMore_Click(_ sender: BCUIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
        }
        else{
                sender.isSelected = true
        }
        
        
        if let delegate = self.delegate{
            delegate.showMore_Click(indexOfCell: self.indexOfCell, isShowMore : sender.isSelected)
        }
    }

}
