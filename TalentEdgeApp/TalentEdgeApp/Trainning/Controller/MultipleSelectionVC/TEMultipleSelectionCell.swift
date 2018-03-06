//
//  TEFilterCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEMultipleSelectionCellDelegate {
    
    func checkBoxDidClick(indexPath:IndexPath?) -> Void
}

class TEMultipleSelectionCell: BCUITableViewCell {

    static let nibName = "TEMultipleSelectionCell"
    static let reuseIdentifier = "kTEMultipleSelectionCell"

    var delegate:TEMultipleSelectionCellDelegate?
    
    @IBOutlet weak var lblTitle:BCUILabel!
    @IBOutlet weak var btnCheckBox:BCUIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBoxDidClick(sender:BCUIButton) -> Void{
    
        if let delegate = self.delegate{
        
            delegate.checkBoxDidClick(indexPath: self.indexPath)
        }
        
    }
}


