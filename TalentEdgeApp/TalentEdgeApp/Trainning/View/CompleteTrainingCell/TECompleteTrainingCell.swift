//
//  TECompleredTrainingCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 21/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TECompleteTrainingCellDelegate {
    
    func menuButtonDidClick() -> Void
    func starButtonDidClick() -> Void
    func shareButtonDidClick() -> Void
    func chatButtonDidClick() -> Void
}

class TECompleteTrainingCell: BCUITableViewCell {

    static let reuseIdentifier = "kTECompleteTrainingCell"
    static let nibName = "TECompleteTrainingCell"
    
    var delegate:TECompleteTrainingCellDelegate?
    
    @IBOutlet weak var lblIcon: BCUIImageView!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblPeriod: BCUILabel!
    @IBOutlet weak var btnMenu: BCUIButton!
    @IBOutlet weak var lblStarRating: BCUILabel!
    @IBOutlet weak var lblRatings: BCUILabel!
    @IBOutlet weak var btnRating: BCUIButton!
    @IBOutlet weak var btnShare: BCUIButton!
    @IBOutlet weak var btnChat: BCUIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .large
        self.lblTitle.fontType = .bold
        self.lblTitle.setTextColor = .text_heading
        
        self.lblPeriod.fontSize = .small
        self.lblPeriod.fontType = .italic
        self.lblPeriod.setTextColor = .text_normal
        
        self.lblStarRating.fontSize = .tiny
        self.lblStarRating.fontType = .light
        self.lblStarRating.setTextColor = .text_app_button
        
        self.lblRatings.fontSize = .tiny
        self.lblRatings.fontType = .light
        self.lblRatings.setTextColor = .text_normal
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- IBAction 
    
    @IBAction func menuButtonDidClick(_ sender: BCUIButton) {
    
    }
    
    @IBAction func starButtonDidClick(_ sender: Any) {
    
    }
    
    @IBAction func shareButtonDidClick(_ sender: Any) {
    }
    
    @IBAction func chatButtonDidClick(_ sender: BCUIButton) {
    
    }
}


