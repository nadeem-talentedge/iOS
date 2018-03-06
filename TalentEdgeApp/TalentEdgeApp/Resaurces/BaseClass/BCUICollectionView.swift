//
//  BCUICollectionView.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class BCUICollectionView: UICollectionView {

    
    //MARK:- Register Cell With TableView
    func registerCellWithCollection(nibName:String, reuseIdentifier:String) {
        
        self.register(UINib(nibName: nibName, bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier);
    }
}
