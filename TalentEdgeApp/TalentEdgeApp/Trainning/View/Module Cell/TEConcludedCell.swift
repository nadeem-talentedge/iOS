//
//  TEConcludedCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 01/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar


protocol TEConcludedCellDelegate {
 
    func concluded_Click(index : Int)
}


class TEConcludedCell: BCUITableViewCell {

    
    @IBOutlet weak var contentListType: BCUIButton!
    @IBOutlet weak var lblLecturerName: BCUILabel!
    @IBOutlet weak var lectureCategory1: BCUIButton!
    @IBOutlet weak var dateValue: BCUIButton!
    @IBOutlet weak var lecturerSubHeading: BCUILabel!
    @IBOutlet weak var endDate: BCUIButton!
    @IBOutlet weak var rightButton: BCUIButton!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    var delegate : TEConcludedCellDelegate?
    
    static let reuseIdentifier = "KTEConcludedCell"
    static let nibName = "TEConcludedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func concluded(_ sender: BCUIButton) {
        
        if let delegate = self.delegate {
            delegate.concluded_Click(index: self.indexOfCell)
        }
    }
    

}



//MARK: - Cellconfigure

extension TEConcludedCell {
    
    
    //MARK: - LiveClass Cellconfigure
    func configureCell(objet : ContentListLiveClass) -> Void {
        
        
        if let title = objet.title{
            self.lblLecturerName.setText(text: title)
        }
        
        
        if let description = objet.descriptionValue{
            self.lecturerSubHeading.setText(text: description)
        }
        
        
        if let action = objet.action{
            self.rightButton.setText(text: action)
        }
        
        if let startDateValue = objet.startDate{
            self.dateValue.setText(text: " " + startDateValue)
        }
        
        if let endDateValue = objet.endDate{
            self.endDate.setText(text: " " + endDateValue)
        }
        
        
        
        
        if let value = objet.completionPercentage{
            
            self.progressView.value = CGFloat(Float(value)!)
            
        }else{
            
            self.progressView.value = 0
        }
        
        
        
        
        /*
         {
         action = Concluded;
         "allow_edit" = 0;
         "allow_view" = 0;
         "can_view" = 0;
         "completion_percentage" = 0;
         "content_duration" = 15;
         "content_duration_formated" = "15 Mins";
         "content_type_id" = 7;
         "date_label" = "Published On";
         "date_value" = "2017-05-26 11:18:00";
         description = "";
         "end_date" = "2017-05-26 11:18:00";
         id = 12;
         "likes_count" = 0;
         "live_class_type" = 1;
         "module_id" = 1;
         "module_name" = Entertainment;
         "published_by_label" = "Published By";
         "published_by_value" = "Ajay Kumar";
         "start_date" = "2017-05-26 11:03:00";
         title = "param issue ";
         "view_count" = 0;
         }
         */
    }
    
    
    //MARK: - Discussion Cellconfigure
    func configureCell(objet : ContentListDiscussion) -> Void {
        
        
        if let title = objet.title{
            self.lblLecturerName.setText(text: title)
        }
        
        
        if let description = objet.descriptionValue{
            self.lecturerSubHeading.setText(text: description)
        }
        
        
        if let action = objet.action{
            self.rightButton.setText(text: action)
        }
        
        if let startDateValue = objet.startDateValue{
            self.dateValue.setText(text: " " + startDateValue)
        }
        
        if let endDateValue = objet.endDateValue{
            self.endDate.setText(text: " " + endDateValue)
        }
        
        /*if let value = objet.completionPercentage{
            
            self.progressView.value = CGFloat(Float(value)!)
            
        }else{
            
            self.progressView.value = 0
        }*/
        
        self.progressView.value = 0.0
        
    }
    
}
