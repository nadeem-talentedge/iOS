//
//  TETourVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 05/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TETourVC: BCUIViewController {

    @IBOutlet weak var btnSkip: BCUIButton!
    
    let pageViewController:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options:nil)
    
    var indexNumber = 0
    
    let imageArr = ["image_1","image_2","image_3"]
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        self.pageViewController.dataSource = self
        
        self.pageViewController.delegate = self
        
        self.pageViewController.view.frame = self.view.bounds
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.setFirstViewController()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        let userDefault = UserDefaults.standard
        
        if userDefault.value(forKey: "isTour") != nil{
        
            self.skipButtonDidClick(sender: self.btnSkip)
            
        }else{
        
            userDefault.setValue("done", forKey: "isTour")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        
        self.btnSkip.layer.zPosition = 1;
        self.view.bringSubview(toFront: self.btnSkip)
    }

    

    @IBAction func skipButtonDidClick(sender:UIButton) {
    
        let login = TELoginVC(nibName: "TELoginVC", bundle: nil)
        self.navigationController?.pushViewController(login, animated: false)
    }
    
    func setFirstViewController() -> Void {
        
        self.pageViewController.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func getViewControllerAtIndex(_ index: NSInteger) -> TETourChildVC {
        
        let child = self.storyboard?.instantiateViewController(withIdentifier: Utility.ID_TETourChildVC) as! TETourChildVC
        
        child.view.frame = self.pageViewController.view.bounds
        child.pageIndex = index
        
        child.imageView.image = UIImage(named: self.imageArr[index])
        return child
    }
}

// MARK: UIPageViewControllerDataSource

extension TETourVC: UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        
        if (self.imageArr.count < 0)
        {return nil }
        
        let page: TETourChildVC = viewController as! TETourChildVC
        
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
        
        if (self.imageArr.count < 0)
        {return nil }
        
        let pageContent: TETourChildVC = viewController as! TETourChildVC
        var pageIndex = pageContent.pageIndex
        
        if (pageIndex == NSNotFound)
        {
            return nil;
        }
        
        pageIndex += 1;
        
        if (pageIndex == self.imageArr.count) {
            
            return nil;
        }
        return getViewControllerAtIndex(pageIndex)
    }
    
    /*func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        let pageContent: TEPDFReaderChildVC = pendingViewControllers.first! as! TEPDFReaderChildVC
        self.indexNumber = pageContent.pageIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            
            self.lblPageNumber.setText(text: "\(self.indexNumber+1)"+"/"+"\((self.viewNotesData?.note?.count)!)")
        }
    }*/
}
