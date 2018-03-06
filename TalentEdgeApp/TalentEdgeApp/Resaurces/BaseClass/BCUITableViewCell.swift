//
//  BCTableViewCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 20/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import MBCircularProgressBar


class BCUITableViewCell: UITableViewCell {

    
    var indexOfCell : Int = 0
    var indexPath:IndexPath?
    var superCalssRef:BCUITableView?
    
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        self.selectionStyle = .none
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableViewObject() -> BCUITableView? {
        
        var viewOrNil: UIView? = self
        
        while let view = viewOrNil {
            if let tableView = view as? BCUITableView {
                
                print("---------------------------------------- Get Table object")
                return tableView
                
            }
            viewOrNil = view.superview
        }
        
        print("---------------------------------------- NIL")
        return nil
    }
}
