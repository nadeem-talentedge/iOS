//
//  TEOfflineLibrary.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 23/12/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEOfflineLibrary: UIViewController {

    @IBOutlet weak var tableView: BCUITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register Cell With Identifier
        self.tableView.addRefrehsControl(target: self)
        
        self.tableView.registerCellWithTable(nibName: TEOfflineLibraryCell.nibName, reuseIdentifier: TEOfflineLibraryCell.reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Tableview Delegate

extension TEOfflineLibrary:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TEOfflineLibraryCell.reuseIdentifier, for: indexPath) as! TEOfflineLibraryCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}
