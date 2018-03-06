//
//  TECalenderEventDetailVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 06/08/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TECalenderEventDetailVC: UIViewController {

    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var lblStartDate: BCUILabel!
    @IBOutlet weak var lblEndDate: BCUILabel!
    @IBOutlet weak var lblVenue: BCUILabel!
    @IBOutlet weak var lblDescription: BCUILabel!
    
    
    var eventEntity:EventEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let model = self.eventEntity {
        
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "YYY MM, dd HH:mm:ss"
            
            self.lblTitle.textColor = Utility.getColorAccordingTheme(theme: .THEME_2)
            
            self.lblTitle.setText(text: model.title)
            
            self.lblVenue.setText(text: model.venue)
            
            if let start = model.start_date_complete{
            
                self.lblStartDate.setText(text: dateFormat.string(from: start as Date))
            }
            
            if let end = model.end_date_complete{
                
                self.lblEndDate.setText(text: dateFormat.string(from: end as Date))
            }
            
            self.lblDescription.setText(text: model.description_value)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
