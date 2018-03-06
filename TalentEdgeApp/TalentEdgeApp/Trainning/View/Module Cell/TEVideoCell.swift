//
//  TEVideoCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


protocol TEVideoCellDelegate {
    func playClick() -> Void
}
class TEVideoCell: BCUITableViewCell {

    static let reuseIdentifier = "KTEVideoCell"
    static let nibName = "TEVideoCell"
    @IBOutlet weak var timer: BCUILabel!
    var delegate : TEVideoCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func play_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            
            delegate.playClick()
        }
    }

}
