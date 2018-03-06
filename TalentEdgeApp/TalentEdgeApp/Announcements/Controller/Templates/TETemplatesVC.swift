//
//  TETemplatesVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 06/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TETemplatesVC: BCUIViewController {

    @IBOutlet weak var topCollectionView: BCUICollectionView!
    @IBOutlet weak var bottomCollectionView: BCUICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.groupTableViewBackground
        self.registerCellWithTable()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- User Define
    
    func registerCellWithTable() -> Void {
        
        self.topCollectionView.registerCellWithCollection(nibName: TETemplatesTopCell.nibName, reuseIdentifier: TETemplatesTopCell.reuseIdentifier)
        
        self.bottomCollectionView.registerCellWithCollection(nibName: TETemplatesBottomCell.nibName, reuseIdentifier: TETemplatesBottomCell.reuseIdentifier)
    }
}


extension TETemplatesVC:UICollectionViewDelegate,UICollectionViewDataSource{


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.topCollectionView{
        
            return 4
            
        }else{
        
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.topCollectionView{
        
            return CGSize(width: collectionView.frame.size.width/4, height: collectionView.frame.size.height)
            
        }else{
        
            return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == topCollectionView {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TETemplatesTopCell.reuseIdentifier, for: indexPath) as! TETemplatesTopCell
            
            return cell
            
        }else{
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TETemplatesBottomCell.reuseIdentifier, for: indexPath) as! TETemplatesBottomCell
        
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == topCollectionView {
        
            self.callWebserviceForTemplates(contentID: "9")
        }
    }

}

//MARK: - Network Call

extension TETemplatesVC {
    
    func callWebserviceForTemplates(contentID:String?) {
        
        if let contentID = contentID {
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["content_id"] = contentID
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.getCommentTemplate, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("getCommentTemplate : ------> ",Utility.jsonToString(json: data) ?? "NA");
                
            })
        }
    }
}
