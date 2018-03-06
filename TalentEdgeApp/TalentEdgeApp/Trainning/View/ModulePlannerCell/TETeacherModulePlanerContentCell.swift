//
//  TEModuleListCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 17/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TETeacherModulePlanerContentCellDelegate {
    
    func rightClickModuleList(indexPath : IndexPath?) -> Void
}
class TETeacherModulePlanerContentCell: BCUITableViewCell {

    
    
    @IBOutlet weak var lblName: BCUILabel!
    @IBOutlet weak var btnCategory1: BCUIButton!
    @IBOutlet weak var lbldateValue: BCUIButton!
    @IBOutlet weak var lblSubHeading: BCUILabel!
    @IBOutlet weak var btTotalVideo: BCUIButton!
    @IBOutlet weak var btnTotalNotes: BCUIButton!
    @IBOutlet weak var btnTotalAssignment: BCUIButton!
    @IBOutlet weak var endDate: BCUIButton!
    @IBOutlet weak var btnRight: BCUIButton!
    
    
    var delegate : TETeacherModulePlanerContentCellDelegate?
    
    static let reuseIdentifier = "kTETeacherModulePlanerContentCell"
    static let nibName = "TETeacherModulePlanerContentCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
