//
//  TEDiscussionCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 09/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEDiscussionCell: BCUITableViewCell {
    
    static let reuseIdentifier = "KTEDiscussionCell"
    static let nibName = "TEDiscussionCell"
    
    @IBOutlet weak var lblCountDeatil: BCUILabel!
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var collectionView: BCUICollectionView!
    @IBOutlet weak var lblPostedDate: BCUILabel!
    @IBOutlet weak var lblTotalCount: BCUILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblTitle.fontSize = .large
        self.lblTitle.fontType = .bold
        self.lblTitle.setTextColor = .text_heading
        
        self.lblPostedDate.fontSize = .small
        self.lblPostedDate.fontType = .light
        self.lblPostedDate.setTextColor = .text_normal
        
        self.lblTotalCount.fontSize = .tiny
        self.lblTotalCount.fontType = .regular
        self.lblTotalCount.setTextColor = .text_app_button
        
        self.lblCountDeatil.fontSize = .small
        self.lblCountDeatil.fontType = .light
        self.lblCountDeatil.setTextColor = .text_normal
        
        self.collectionView.registerCellWithCollection(nibName: TEDiscussionIconCell.nibName, reuseIdentifier: TEDiscussionIconCell.reuseIdentifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    func configureCell(object : DiscussionModel?){
        
        
        if let object = object{
            
            if let moduleName = object.moduleName,let title = object.title{
                
                    self.lblTitle.setText(text: (moduleName + "," + title))
            }
            
            if let commentsCount = object.commentsCount,let publishedByValue = object.publishedByValue{
                
                self.lblCountDeatil.setText(text: (commentsCount + " post from " + publishedByValue + " & others ") )
            }
            
            
            if let startDateValue = object.startDateValue{
                
                self.lblPostedDate.setText(text: startDateValue)
            }
            
            if let commentsCount = object.commentsCount{
                
                //print("Comments Count -------------------->")
                self.lblTotalCount.setText(text: commentsCount.replacingOccurrences(of: "Comment(s)", with: ""))
            }
            
            
        }
        
        
        
        
        /*{ "module_id": "1",
         "id": "17",
         "module_name": "Modern Business Organization & Management",
         "title": "My December Discussion", "allow_reply": 1,
         Two",
         }
         "allow_view": 1,
         "start_date_label": "Published On", "start_date_value": "01 Dec 2016", "published_by_label": "Published By", "published_by_value": "Rohit Teacher Two
         "description": "Test",
         "allow_edit": 0,
         "allow_delete": 0, "comments_count": "3 Comment(s)"
         }*/
    }
    
    
    
}


extension TEDiscussionCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    /*
     - (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
     return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
     }
     
     - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
     
     return 0.0;
     }
     
     - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
     return 0.0;
     }
     */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TEDiscussionIconCell.reuseIdentifier, for: indexPath) as! TEDiscussionIconCell;
        
        return cell
    }
}
