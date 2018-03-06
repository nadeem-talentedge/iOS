//
//  TEQuizViewCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 24/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEQuizViewCellDelegate {
    
    func option1_Click() -> Void
    func option2_Click() -> Void
    func option3_Click() -> Void
    func option4_Click() -> Void
}
class TEQuizViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "KTEQuizViewCell"
    static let nibName = "TEQuizViewCell"
    
    @IBOutlet weak var pageCounter: BCUILabel!
    @IBOutlet weak var pointCounter: BCUILabel!
    @IBOutlet weak var question: BCUILabel!
    @IBOutlet weak var instruction: BCUILabel!
    @IBOutlet weak var option1: BCUILabel!
    @IBOutlet weak var option2: BCUILabel!
    @IBOutlet weak var option3: BCUILabel!
    @IBOutlet weak var option4: BCUILabel!
    var delegate : TEQuizViewCellDelegate?
    var strString = "lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut."
    override func awakeFromNib() {
        
        option1.setText(text: strString)
        option2.setText(text: strString)
        option3.setText(text: strString)
        option4.setText(text: strString)
        instruction.setText(text: strString)
        
       question.setText(text: strString)
    }
    
    
    func configureCell(strText : String) {
        
        pageCounter.setText(text: strText)
    }
    
    @IBAction func option1_Click(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.option1_Click()
        }
    }
    
    @IBAction func option2_Click(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.option2_Click()
        }
    }
    
    @IBAction func option3_Click(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.option3_Click()
        }
    }
    
    @IBAction func option4_Click(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.option4_Click()
        }
    }
}
