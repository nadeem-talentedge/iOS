//
//  TERecommndedTrainingCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 21/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TERecommndedTrainingCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: BCUICollectionView!
    @IBOutlet weak var pageControl: BCUIPageControl!
    
    static let reuseIdentifier = "mTERecommndedTrainingCell"
    static let nibName = "TERecommndedTrainingCell"
    
    var recomndedData:[SuggestedCourse]? {
    
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.collectionView.registerCellWithCollection(nibName: TERecommndedCollectionCell.nibName, reuseIdentifier: TERecommndedCollectionCell.reuseIdentifier)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TERecommndedTrainingCell:UICollectionViewDelegate,UICollectionViewDataSource{

    /*func numberOfSections(in collectionView: UICollectionView) -> Int {
    }*/

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let data = self.recomndedData{
            
            self.pageControl.numberOfPages = data.count
            return data.count
            
        }else{
            
            self.pageControl.numberOfPages = 0
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width-10, height: collectionView.frame.size.height-5)
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TERecommndedCollectionCell.reuseIdentifier, for: indexPath) as! TERecommndedCollectionCell;
        
        cell.setData(data: (self.recomndedData?[indexPath.row])!)
        
        return cell
    }
}

