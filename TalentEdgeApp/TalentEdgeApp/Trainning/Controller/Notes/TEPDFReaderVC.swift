//
//  TEPDFReaderVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 23/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit


class TEPDFReaderVC: BCUIViewController {
    
    @IBOutlet weak var baseViewTop: BCView!
    @IBOutlet weak var baseViewBottom: BCView!
    
    @IBOutlet weak var lblPageNumber: BCUILabel!
    @IBOutlet weak var btnShare: BCUIButton!
    
    let pageViewController:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options:nil)
    
    var contentName:String?
    var contentID:String?
    
    var indexNumber = 0
    
    var viewNotesData:ViewNotesModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let contentName = self.contentName{
            
            self.setTitle(title: contentName)
        }
        
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        
        self.addChildViewController(self.pageViewController)
        self.baseViewTop.addSubview(self.pageViewController.view)
        
        self.lblPageNumber.setText(text: "\(self.indexNumber+1)/ \((self.viewNotesData?.note?.count ?? 0))")
        
        self.setFirstViewController()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFirstViewController() -> Void {
        
        self.pageViewController.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func getViewControllerAtIndex(_ index: NSInteger) -> TEPDFReaderChildVC {
        
        let child = TEPDFReaderChildVC(nibName: "TEPDFReaderChildVC", bundle: nil)
        
        child.view.frame = self.pageViewController.view.frame
        child.pageIndex = index
        child.note = self.viewNotesData?.note?[index]
        child.baseUrl = self.viewNotesData?.basePath
        child.contentName = self.contentName
        child.contentID = self.contentID
        
        return child
    }
}

// MARK: UIPageViewControllerDataSource

extension TEPDFReaderVC: UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        
        if ((self.viewNotesData?.note?.count)! < 0)
        {return nil }
        
        let page: TEPDFReaderChildVC = viewController as! TEPDFReaderChildVC
        var pageIndex = page.pageIndex
        
        if ((pageIndex == 0) || (pageIndex == NSNotFound))
        {
            return nil
        }
        pageIndex -= 1;
        return getViewControllerAtIndex(pageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        
        if ((self.viewNotesData?.note?.count)! < 0)
        {
            return nil
            
        }
        
        let pageContent: TEPDFReaderChildVC = viewController as! TEPDFReaderChildVC
        
        var pageIndex = pageContent.pageIndex
        
        if (pageIndex == NSNotFound)
        {
            return nil;
        }
        
        pageIndex += 1;
        
        if (pageIndex == self.viewNotesData?.note?.count) {
            
            return nil;
        }
        
        return getViewControllerAtIndex(pageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        let pageContent: TEPDFReaderChildVC = pendingViewControllers.first! as! TEPDFReaderChildVC
        self.indexNumber = pageContent.pageIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            
            self.lblPageNumber.setText(text: "\(self.indexNumber+1)"+"/"+"\((self.viewNotesData?.note?.count)!)")
        }
    }
}
