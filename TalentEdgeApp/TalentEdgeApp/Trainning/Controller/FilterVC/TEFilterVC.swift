//
//  TEFilterVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEFilterVCDelegate {
    
    func didSelectOption(index:String) -> Void
}

class TEFilterVC: UIViewController {

    @IBOutlet weak var tableView:BCUITableView!
    @IBOutlet weak var lblTitle:BCUILabel!
    //@IBOutlet weak var btnApplyFilter:BCUIButton!
    
    var delegate:TEFilterVCDelegate?
    
    var filter = Array<TEFilterModel>(){
        
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblTitle.textColor = Utility.getColorAccordingTheme(theme: .TEXT_COLOR_1)
        
        //self.btnApplyFilter.backgroundColor = Utility.getColorAccordingTheme(theme: .THEME_2)
        
        //self.btnApplyFilter.setTitleColor(Utility.getColorAccordingTheme(theme: .TEXT_COLOR_4), for: .normal)
        
        self.registerCellWithTable()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func registerCellWithTable() -> Void {
        
        self.tableView.backgroundColor = UIColor.white
        
        self.tableView.registerCellWithTable(nibName: TEFilterCell.nibName, reuseIdentifier: TEFilterCell.reuseIdentifier)
        
    }
    
    
}

extension TEFilterVC: UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TEFilterCell.reuseIdentifier, for: indexPath) as! TEFilterCell
        
        let model = self.filter[indexPath.row]
        
        cell.lblTitle.setText(text: model.title)
        cell.btnSelection.isSelected = model.isSelected
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        for (index, model) in self.filter.enumerated(){
        
            if index == indexPath.row{
            
                model.isSelected = true
            }else{
            
                model.isSelected = false
            }
            
        }
        
        if let delegate = self.delegate{
        
            delegate.didSelectOption(index: String(indexPath.row))
        }
    
    }
}
