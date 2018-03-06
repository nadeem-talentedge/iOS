//
//  TEJobPostHeader.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TERefferalHeader: UIView {

    static let nibName = "TERefferalHeader"
    
    @IBOutlet weak var lblMonth:BCUILabel!
    @IBOutlet weak var lblYear:BCUILabel!
    
    @IBOutlet weak var lblEarned:BCUILabel!
    
    var referralCount:RFReferralCount?{
    
        didSet{
        
            self.collectionView.reloadData()
        }
    }
    
    /*
 
     "not_viewed" : "0",
     "selected" : "1",
     "viewed" : "1",
     "rejected" : "1",
     "shortlisted" : "1",
     "not_relevant" : "0"
     
    */
    
    let arrRefferalType = ["not viewed","selected","viewed","rejected","shortlisted","not relevant"]
    
    @IBOutlet weak var collectionView:BCUICollectionView!
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor(colorLiteralRed: 220.0/255.0, green: 238.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        self.collectionView.registerCellWithCollection(nibName: TERefferalHeaderCell.nibName, reuseIdentifier: TERefferalHeaderCell.reuseIdentifier)
    }

}

//MARK:- UserDefine

extension TERefferalHeader{

    func setDate(model:RFReferralCount?) -> Void {
     
        if let model = model{
        
            self.referralCount = model
            if let earned = model.earned{
            
                self.lblEarned.setText(text:Utility.RUPEE_SYMBOL+"\(earned)")
            }
            
        }
    }
}

//MARK:- CollectionView Delegate DataSaurce

extension TERefferalHeader:UICollectionViewDelegate,UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrRefferalType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        /*var width:CGFloat = 0.0
        
        if let font = UIFont(name: "HelveticaNeue-Medium", size: 16){
        
           width  = self.arrJob[indexPath.row].widthOfString(usingFont:font)+40
         
        }*/
        
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TERefferalHeaderCell.reuseIdentifier, for: indexPath) as! TERefferalHeaderCell
        
        switch self.arrRefferalType[indexPath.row] {
            
        case "not viewed":
            cell.lblTitle.setText(text: self.arrRefferalType[indexPath.row].capitalized)
            cell.lblCount.setText(text: self.referralCount?.statusCount?.notViewed)
            
        case "selected":
            cell.lblTitle.setText(text: self.arrRefferalType[indexPath.row].capitalized)
            cell.lblCount.setText(text: self.referralCount?.statusCount?.selected)
            
        case "viewed":
            cell.lblTitle.setText(text: self.arrRefferalType[indexPath.row].capitalized)
            cell.lblCount.setText(text: self.referralCount?.statusCount?.viewed)
            
        case "rejected":
            cell.lblTitle.setText(text: self.arrRefferalType[indexPath.row].capitalized)
            cell.lblCount.setText(text: self.referralCount?.statusCount?.rejected)
            
        case "shortlisted":
            cell.lblTitle.setText(text: self.arrRefferalType[indexPath.row].capitalized)
            cell.lblCount.setText(text: self.referralCount?.statusCount?.shortlisted)
            
        case "not relevant":
            cell.lblTitle.setText(text: self.arrRefferalType[indexPath.row].capitalized)
            cell.lblCount.setText(text: self.referralCount?.statusCount?.notRelevant)
            
        default:
        
            cell.lblTitle.setText(text: "NA")
            cell.lblCount.setText(text: "0")
        }
        
        return cell
    }
}
