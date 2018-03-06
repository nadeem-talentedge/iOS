//
//  TESubmitCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 24/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TESubmitCellDelegate {
    
    func submitDidClick(sender:BCUIButton) -> Void
}

class TESubmitCell: BCUITableViewCell {

    static let reuseIdentifier = "kTESubmitCell"
    static let nibName = "TESubmitCell"
    
    var delegate:TESubmitCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func submitDidClick(sender:BCUIButton) -> Void{
        
        if let delegate = self.delegate{
            
            delegate.submitDidClick(sender: sender)
        }
    }
    
}
