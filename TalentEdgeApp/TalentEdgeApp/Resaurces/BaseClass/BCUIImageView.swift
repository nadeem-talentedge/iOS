//
//  BCUIImageView.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import AlamofireImage

class BCUIImageView: UIImageView {
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.clear
    }

    @IBInspectable var corner: CGFloat = 0.0 {
        
        
        didSet{
        
        self.layer.cornerRadius = self.corner
        }
        
        willSet{
        
        self.layer.cornerRadius = self.corner
        }
        
        
    }
    
    @IBInspectable var clip: Bool = false {
        
        didSet{
            
            self.clipsToBounds = self.clip
        }
        
        willSet{
            self.clipsToBounds = self.clip
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet{
            
            self.layer.borderColor = self.borderColor.cgColor
        }
        
        willSet{
            
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        
        didSet{
            
            self.layer.borderWidth = self.borderWidth
        }
        
        willSet{
            
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    func setImageFromUrlAndUpdateTable(url:String?,placeHolder:String?,tableView:UITableView?,indexPath:IndexPath?) -> Void {
        
        if let url = url {
            
            var imageFrom:UIImage?
            
            if let placeHolder = placeHolder{
                
                imageFrom = UIImage(named: placeHolder)
            }
            
            if let serverUrl:URL = URL.init(string:url){
                
                if UIApplication.shared.canOpenURL(serverUrl){
                    
                    if let imageCache = UIImageView.af_sharedImageDownloader.imageCache{
                        
                        
                        if let image  =  imageCache.image(for: URLRequest(url: serverUrl), withIdentifier:nil){
                            
                            self.image = image
                            //print("----------Cache")
                            
                        }else{
                            
                            self.af_setImage(withURL: serverUrl, placeholderImage: imageFrom, filter: nil, progress: nil, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: { responce in
                                
                                if let table = tableView,let index = indexPath{
                                
                                    
                                    table.beginUpdates()
                                    table.reloadRows(at: [index], with: .fade)
                                    table.endUpdates()
                                }
                            })
                        }
                        
                    }else{
                        
                        self.af_setImage(withURL: serverUrl, placeholderImage: imageFrom, filter: nil, progress: nil, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: { responce in
                            
                            if let table = tableView,let index = indexPath{
                                
                                //print("----------Server")
                                table.beginUpdates()
                                table.reloadRows(at: [index], with: .fade)
                                table.endUpdates()
                            }
                            
                        })
                    }
                    
                }else{
                    
                    
                }
            }
            
        }else{
            
            if let placeHolder = placeHolder{
                
                self.image = UIImage(named: placeHolder)
            }
        }
    }
    
    
    func setImageFromUrl(url:String?,placeHolder:String?) -> Void {
        
        if let url = url {
        
            var imageFrom:UIImage?
            
            if let placeHolder = placeHolder{
            
                 imageFrom = UIImage(named: placeHolder)
            }
            
            
            
            if let serverUrl:URL = URL.init(string:url){
                
                if UIApplication.shared.canOpenURL(serverUrl){
                   
                    if let imageCache = UIImageView.af_sharedImageDownloader.imageCache{
                    
                        
                        if let image  =  imageCache.image(for: URLRequest(url: serverUrl), withIdentifier:nil){
                            
                            self.image = image
                        
                        }else{
                            
                            self.af_setImage(withURL: serverUrl, placeholderImage: imageFrom, filter: nil, progress: nil, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: { responce in
                                
                            })
                        }
                        
                    }else{
                    
                        self.af_setImage(withURL: serverUrl, placeholderImage: imageFrom, filter: nil, progress: nil, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: { responce in
                            
                            print("----------Server")
                        })
                    }
                    
                }else{
                    
                    
                }
            }
            
        }else{
        
            if let placeHolder = placeHolder{
                
                self.image = UIImage(named: placeHolder)
            }
        }
    }
    
    func setImageFromUrl(url:String?,placeHolder:String?,imageCompletion: @escaping (UIImage?) -> Void) -> Void {
        
        if let url = url {
            
            var imageFrom:UIImage?
            
            if let placeHolder = placeHolder{
                
                imageFrom = UIImage(named: placeHolder)
            }
            
            if let serverUrl:URL = URL.init(string:url){
                
                if UIApplication.shared.canOpenURL(serverUrl){
                    
                    self.af_setImage(withURL: serverUrl, placeholderImage: imageFrom, filter: nil, progress: nil, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: { responce in
                        
                        imageCompletion(responce.value)
                        self.layoutSubviews()
                    })
                    
                }
                else{
                
                }
            }
            
        }else{
            
            if let placeHolder = placeHolder{
                
                self.image = UIImage(named: placeHolder)
            }
            
            
        }
    }
    
    func setImage(image:UIImage?) -> Void {
        
        if let image = image {
        
            self.image = image
            
        }else{
        
            print("Nil Image")
        }
    }
    
    func setImage(name:String?) -> Void {
        
        self.image = UIImage(named: name!)
    }
}
