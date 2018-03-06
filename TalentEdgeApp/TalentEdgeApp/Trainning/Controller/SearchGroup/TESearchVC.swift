//
//  TESearchVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 14/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TESearchVC: BCUIViewController {

    @IBOutlet weak var tableview: BCUITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Search")
        
        tableview.registerCellWithTable(nibName: TESearchCell.nibName, reuseIdentifier: TESearchCell.reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}


extension TESearchVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
   /* func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TEAttendanceView.nibName, owner: self, options: nil)?[0] as! TEAttendanceView;
        
        return view;
    }*/
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TESearchCell = tableView.dequeueReusableCell(withIdentifier: TESearchCell.reuseIdentifier) as! TESearchCell
        cell.selectionStyle = .none
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        //self.performSegue(withIdentifier: "LecturerDetailSegue", sender: nil)
    }
}
