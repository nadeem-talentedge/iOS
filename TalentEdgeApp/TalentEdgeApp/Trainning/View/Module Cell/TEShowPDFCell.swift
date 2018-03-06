//
//  TEShowPDFCell.swift
//  TalentEdgeApp
//
//  Created by Temp  on 23/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEShowPDFCell: BCUITableViewCell {
    
    
    static let reuseIdentifier = "KTEShowPDFCell"
    static let nibName = "TEShowPDFCell"
    
    @IBOutlet weak var collectionview: BCUICollectionView!
    var viewNotesData:ViewNotesModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.collectionview.registerCellWithCollection(nibName: TEPDFReaderCell.nibName, reuseIdentifier: TEPDFReaderCell.reuseIdentifier)
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension TEShowPDFCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let viewNotesData = self.viewNotesData{
            
            if let notes = viewNotesData.note{
                
                return notes.count
                
            }else{
                
                return 0
            }
        }else{
            
            return 0
        }
        
    }
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize {
        
        return self.frame.size
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : TEPDFReaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: TEPDFReaderCell.reuseIdentifier, for: indexPath) as! TEPDFReaderCell
        
        if let viewNotesData = self.viewNotesData{
            
            if let notes = viewNotesData.note{
                
                cell.setData(model:notes[indexPath.row],baseUrl: viewNotesData.basePath)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
}

