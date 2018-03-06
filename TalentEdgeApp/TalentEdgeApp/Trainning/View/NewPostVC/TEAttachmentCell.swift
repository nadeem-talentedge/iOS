//
//  TEAttachmentCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEAttachmentCellDelegate {
    
    func deleteImage(indexPath:IndexPath?) -> Void
}

class TEAttachmentCell: BCUITableViewCell {

    var delegate:TEAttachmentCellDelegate?
    static let nibName = "TEAttachmentCell"
    static let reuseIdentifier = "kTEAttachmentCell"
    @IBOutlet weak var lblImageName:BCUILabel!
    @IBOutlet weak var btnClose:BCUIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteImage(sender:UIButton) -> Void{
        
        if let delegate = self.delegate{
            
            delegate.deleteImage(indexPath: self.indexPath)
        }
    }
}
