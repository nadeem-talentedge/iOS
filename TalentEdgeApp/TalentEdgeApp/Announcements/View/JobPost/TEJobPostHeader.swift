//
//  TEJobPostHeader.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 15/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEJobPostHeader: UIView {

    static let nibName = "TEJobPostHeader"
    
    let arrJob = ["UI/UX","IOS Developer","Android Developer","Php Devveloper","Senior Software Engeenier"]
    
    @IBOutlet weak var collectionView:BCUICollectionView!
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor(colorLiteralRed: 220.0/255.0, green: 238.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        self.collectionView.registerCellWithCollection(nibName: TEJobPostHeaderCell.nibName, reuseIdentifier: TEJobPostHeaderCell.reuseIdentifier)
    }

}

extension TEJobPostHeader:UICollectionViewDelegate,UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrJob.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        var width:CGFloat = 0.0
        
        if let font = UIFont(name: "HelveticaNeue-Light", size: 16){
        
           width  = self.arrJob[indexPath.row].widthOfString(usingFont:font)+40
        }
        return CGSize(width: width, height: collectionView.frame.size.height)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TEJobPostHeaderCell.reuseIdentifier, for: indexPath) as! TEJobPostHeaderCell
        
        cell.title.setText(text: self.arrJob[indexPath.row]) 
        return cell
    }
}
