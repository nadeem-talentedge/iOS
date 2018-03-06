//
//  TESocialCell.swift
//  TalentEdgeApp
//
//  Created by Rohit Pareek  on 21/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
protocol TESocialCellDelegate {
    
    func like_Click() -> Void
    func commets_Click() -> Void
    func share_Click() -> Void
    
}
class TESocialCell: BCUITableViewCell {
    
    
    static let reuseIdentifier = "KTESocialCell"
    static let nibName = "TESocialCell"

    @IBOutlet weak var shareValue: BCUIButton!
    @IBOutlet weak var commentsValue: BCUIButton!
    @IBOutlet weak var likeValue: BCUIButton!
    var delegate : TESocialCellDelegate?
    
    @IBAction func like_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.like_Click()
        }
    }
    
    @IBAction func commets_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.commets_Click()
        }
    }
    
    @IBAction func share_Click(_ sender: BCUIButton) {
        
        if let delegate = self.delegate{
            delegate.share_Click()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    

}
