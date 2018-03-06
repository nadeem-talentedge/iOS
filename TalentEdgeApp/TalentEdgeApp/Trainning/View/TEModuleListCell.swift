//
//  TEModuleListCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 17/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

protocol TEModuleListCellDelegate {
    
    func rightClickModuleList(indexPath : IndexPath?) -> Void
}
class TEModuleListCell: BCUITableViewCell {

    
    
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var btnCategory1: BCUIButton!
    @IBOutlet weak var lbldateValue: BCUIButton!
    @IBOutlet weak var lblSubHeading: BCUILabel!
    @IBOutlet weak var btTotalVideo: BCUIButton!
    @IBOutlet weak var btnTotalNotes: BCUIButton!
    @IBOutlet weak var btnTotalAssignment: BCUIButton!
    @IBOutlet weak var endDate: BCUIButton!
    @IBOutlet weak var btnRight: BCUIButton!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    var delegate : TEModuleListCellDelegate?
    
    static let reuseIdentifier = "KTEModuleListCell"
    static let nibName = "TEModuleListCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnRight_Click(_ sender: BCUIButton) {
        
        if let delegate = delegate{
            
            delegate.rightClickModuleList(indexPath: self.indexPath)
        }
    }
    
    //MARK: - Module Planner Cellconfigure
    
    func configureCell(objet : ContentListModule?) -> Void {
        
        if let objet = objet {
            
            if let title = objet.title{
                
                self.lblName.setText(text: title)
            }
            
            if let refType = objet.refType{
                self.btnCategory1.setText(text: " " + refType)
            }
            
            if let startDateValue = objet.startDateValue{
                self.lbldateValue.setText(text: " " + startDateValue)
            }
            
            if let endDateValue = objet.endDateValue{
                self.endDate.setText(text: " " + endDateValue)
            }
            
            if let totalVideo = objet.totalVideo{
                self.btTotalVideo.setText(text: " " + totalVideo)
            }
            
            if let totalNotes = objet.totalVideo{
                self.btnTotalNotes.setText(text: " " + totalNotes)
            }
            
            if let totalAssignment = objet.totalVideo{
                self.btnTotalAssignment.setText(text: " " + totalAssignment)
            }
            
            if let description = objet.descriptionValue{
                self.lblSubHeading.setText(text: description)
            }
            
            if let action = objet.action{
                self.btnRight.setText(text: action)
            }
            
            if let value = objet.completionPercentage{
                
                self.progressView.value = CGFloat(Float(value)!)
                
            }else{
                
                self.progressView.value = 0
            }
        }
    }
}
