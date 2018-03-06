//
//  TEQuizViewSecondCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 24/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TEQuizViewSecondCellDelegate {
    
    func option1_Click() -> Void
    func option2_Click() -> Void
    func option3_Click() -> Void
    func option4_Click() -> Void
    func play_Click() -> Void
    
}

class TEQuizViewSecondCell: UICollectionViewCell {
    
    @IBOutlet weak var pageCounter: BCUILabel!
    @IBOutlet weak var pointCounter: BCUILabel!
    @IBOutlet weak var question: BCUILabel!
    @IBOutlet weak var instruction: BCUILabel!
    
    
    @IBOutlet weak var option1: BCUIButton!
    @IBOutlet weak var option2: BCUIButton!
    @IBOutlet weak var option3: BCUIButton!
    @IBOutlet weak var option4: BCUIButton!
    var delegate : TEQuizViewSecondCellDelegate?
    
    
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
    
    
    @IBAction func play_Click(_ sender: UIButton) {
    }
}
