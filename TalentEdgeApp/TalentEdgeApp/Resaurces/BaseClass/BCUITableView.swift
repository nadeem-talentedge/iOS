//
//  BCUITableView.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


class BCUITableView: UITableView {
    
    override func awakeFromNib() {
        
        self.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_4)
        
        self.estimatedRowHeight = 2.0
        self.rowHeight = UITableViewAutomaticDimension;
        
        self.showsVerticalScrollIndicator = false
        
        self.showsHorizontalScrollIndicator = false
        
        self.separatorStyle = .none
    }
    
    //MARK:- Register Cell With TableView
    func registerCellWithTable(nibName:String, reuseIdentifier:String) {
        
        //print("Register Cell With Class");
        self.register(UINib(nibName: nibName, bundle: Bundle.main), forCellReuseIdentifier: reuseIdentifier);
    }
    
    func addRefrehsControl(target:AnyObject) -> Void {
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(target, action: Selector(("refreshTable:")), for: UIControlEvents.valueChanged)
        
        if #available(iOS 10.0, *) {
            
            self.refreshControl = refreshControl
        } else {
            
            self.addSubview(refreshControl)
        }
    }
    
    func endRefreshing() -> Void {
        
        if #available(iOS 10.0, *) {
            
            if let refresh = self.refreshControl{
                
                if refresh.isRefreshing {
                    
                    self.refreshControl?.endRefreshing()
                }
            }
            
        } else {
            
        }
    }
    
}



extension UITableView {
    func reloadData(completion: @escaping ()->()) {
        
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
}

