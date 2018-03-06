//
//  TEPDFReaderChildVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 28/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEPDFReaderChildVC: BCUIViewController,UIScrollViewDelegate {

    
    //@IBOutlet weak var imageView: BCUIImageView!
    //@IBOutlet weak var scrollView: BCUIScrollView!
    
    var contentName:String?
    var contentID:String?
    
    var pageIndex = 0
    var note:Note?
    
    var baseUrl:String?
    
    var scrollView: BCUIScrollView!
    var imageView: BCUIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.imageView = BCUIImageView()
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.backgroundColor = UIColor.white
        
        self.scrollView = BCUIScrollView(frame: self.view.bounds)
        self.scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.scrollView.maximumZoomScale = 2;
        self.scrollView.minimumZoomScale = 1;
        self.scrollView.bounces = false;
        self.scrollView.bouncesZoom = false;
        self.scrollView.contentMode = .scaleAspectFit
        self.scrollView.backgroundColor = UIColor.white
        
        
        self.scrollView.delegate = self
        self.view.addSubview(scrollView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let note = self.note{
           
            self.callWebserviceForNotesReadStatus(notesID: note.id)
            
            if let url = note.contentPath, let baseUrl = self.baseUrl{
                
                self.imageView.setImageFromUrl(url: baseUrl+url, placeHolder: nil, imageCompletion: { image in
                    
                    if let image = image{
                        
                        print("URL ----------:",url,baseUrl)
                        
                        self.imageView.removeFromSuperview()
                        self.imageView.setImage(image: image)
                        
                        //self.scrollView.contentSize = image.size
                        
                        self.imageView.frame = self.scrollView.bounds
                        self.scrollView.addSubview(self.imageView)
                        
                        //self.scrollView.contentOffset = CGPoint(x: 1000, y: 450)
                        //self.setZoomScale()
                    }
                })
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    
    override func viewWillLayoutSubviews()
    {
        //setZoomScale()
    }
    
    func setupGestureRecognizer()
    {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(TEPDFReaderChildVC.handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(_ recognizer: UITapGestureRecognizer)
    {
        if (scrollView.zoomScale > scrollView.minimumZoomScale)
        {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
}

//MARK: - Network Call

extension TEPDFReaderChildVC {
    
    func callWebserviceForNotesReadStatus(notesID:String?) {
        
        if let contentID = self.contentID, let notesID = notesID {
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam["notes_id"] = notesID
            dicParam["content_id"] = contentID
            
            let headerParam = NSMutableDictionary()
            
            NetworkManager.httpPostRequest(.contentAccessLog, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("contentAccessLog : ------> ",data ?? "contentAccessLog Error");
                
            })
        }
    }
}
