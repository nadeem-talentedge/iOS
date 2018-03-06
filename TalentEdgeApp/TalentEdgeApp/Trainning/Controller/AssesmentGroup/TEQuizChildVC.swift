//
//  TEQuizChildVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 11/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEQuizChildVC: UIViewController {
    
    @IBOutlet weak var lblQuestion: BCUILabel!
    @IBOutlet weak var tableView: BCUITableView!
    
    var newTestQuestion:STTestQuestion?
    var reviewTestQuestion:RWTestQuestion?
    var testType = TestType.new
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerCellWithTable(nibName: TEQuizChildCell.nibName, reuseIdentifier: TEQuizChildCell.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if self.testType == .new{
        
            if let testQuestion  = self.newTestQuestion{
                
                self.lblQuestion.setText(text: testQuestion.question?.statement)
                self.tableView.reloadData()
            }
        }else{
        
            if let testQuestion  = self.reviewTestQuestion{
                
                self.lblQuestion.setText(text: testQuestion.question?.statement)
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func selectAnswerButtonDidClick(_ sender: BCUIButton) {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TEQuizChildVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.testType == .new{
        
            if let questios = self.newTestQuestion{
                
                return (questios.questionOption?.count)!
            }
            else{
                
                return 0
            }
        }else{
        
            if let questios = self.reviewTestQuestion{
                
                return (questios.questionOption?.count)!
            }
            else{
                
                return 0
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TEQuizChildCell.reuseIdentifier) as! TEQuizChildCell
        
        if self.testType == .new{
        
            let model = self.newTestQuestion?.questionOption?[indexPath.row]
            cell.setDataNew(model: model)
            
        }else{
        
            let model = self.reviewTestQuestion?.questionOption?[indexPath.row]
            cell.setDataReview(model: model,arrOfSelectedOpetion: self.reviewTestQuestion?.question?.selectedOptionId)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.testType == .new{
        
            for (index,value) in (self.newTestQuestion?.questionOption?.enumerated())! {
                
                if index == indexPath.row {
                    
                    value.isSelected = true
                }
                else{
                    
                    value.isSelected = false
                }
            }
            tableView.reloadData()
        }
    }
}
