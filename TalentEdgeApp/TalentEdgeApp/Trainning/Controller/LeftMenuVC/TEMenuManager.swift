//
//  TEMenuManager.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 08/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEMenuManager: LGSideMenuController {
    
    private var type: UInt?
    
    func setup(type: UInt) {
        
        self.type = type
        
        // -----
        
        if (self.storyboard != nil) {
            // Left and Right view controllers is set in storyboard
            // Use custom segues with class "LGSideMenuSegue" and identifiers "left" and "right"
            
            // Sizes and styles is set in storybord
            // You can also find there all other properties
            
            // LGSideMenuController fully customizable from storyboard
        }
        else {
            
            #if ELSA
               
                leftViewController = TELeftMenuELSAVC(nibName: "TELeftMenuELSAVC", bundle: nil)
                
            #else
                
                let vc = TELeftMenuVC(nibName: "TELeftMenuVC", bundle: nil)
                leftViewController = vc
                
            #endif
            
            
            self.isLeftViewSwipeGestureEnabled = false
            self.isRightViewSwipeGestureEnabled = false
            
            leftViewWidth = (AppDelegate.sharedDeleagte().window?.frame.width)!-66.0;
            leftViewBackgroundImage = UIImage(named: "menu")
            leftViewBackgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            rootViewCoverColorForLeftView = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
            
        }
        
        // -----
        
        let greenCoverColor = UIColor(red: 0.0, green: 0.1, blue: 0.0, alpha: 0.3)
        let purpleCoverColor = UIColor(red: 0.1, green: 0.0, blue: 0.1, alpha: 0.3)
        let regularStyle: UIBlurEffectStyle
        
        if #available(iOS 10.0, *) {
            regularStyle = .regular
        }
        else {
            regularStyle = .light
        }
        
        // -----
        
        switch type {
        case 0:
            leftViewPresentationStyle = .scaleFromBig
            rightViewPresentationStyle = .scaleFromBig
            
            break
        case 1:
            leftViewPresentationStyle = .slideAbove
            rootViewCoverColorForLeftView = greenCoverColor
            
            rightViewPresentationStyle = .slideAbove
            rootViewCoverColorForRightView = purpleCoverColor
            
            break
        case 2:
            leftViewPresentationStyle = .slideBelow
            rightViewPresentationStyle = .slideBelow
            
            break
        case 3:
            leftViewPresentationStyle = .scaleFromLittle
            rightViewPresentationStyle = .scaleFromLittle
            
            break
        case 4:
            leftViewPresentationStyle = .scaleFromBig
            rootViewCoverBlurEffectForLeftView = UIBlurEffect(style: regularStyle)
            rootViewCoverAlphaForLeftView = 0.8
            
            rightViewPresentationStyle = .scaleFromBig
            rootViewCoverBlurEffectForRightView = UIBlurEffect(style: regularStyle)
            rootViewCoverAlphaForRightView = 0.8
            
            break
        case 5:
            leftViewPresentationStyle = .scaleFromBig
            leftViewCoverBlurEffect = UIBlurEffect(style: .dark)
            leftViewCoverColor = nil
            
            rightViewPresentationStyle = .scaleFromBig
            rightViewCoverBlurEffect = UIBlurEffect(style: .dark)
            rightViewCoverColor = nil
            
            break
        case 6:
            leftViewPresentationStyle = .slideAbove
            leftViewBackgroundBlurEffect = UIBlurEffect(style: regularStyle)
            leftViewBackgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.05)
            rootViewCoverColorForLeftView = greenCoverColor
            
            rightViewPresentationStyle = .slideAbove
            rightViewBackgroundBlurEffect = UIBlurEffect(style: regularStyle)
            rightViewBackgroundColor = UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 0.05)
            rootViewCoverColorForRightView = purpleCoverColor
            
            break
        case 7:
            leftViewPresentationStyle = .slideAbove
            rootViewCoverColorForLeftView = greenCoverColor
            
            rightViewPresentationStyle = .slideBelow
            rightViewAlwaysVisibleOptions = [.onPhoneLandscape, .onPadLandscape]
            
            break
        case 8:
            leftViewPresentationStyle = .scaleFromBig
            leftViewStatusBarStyle = .lightContent
            
            rightViewPresentationStyle = .scaleFromBig
            rightViewStatusBarStyle = .lightContent
            
            break
        case 9:
            swipeGestureArea = .full
            
            leftViewPresentationStyle = .scaleFromBig
            rightViewPresentationStyle = .scaleFromBig
            
            break
        case 10:
            leftViewPresentationStyle = .scaleFromBig
            rightViewPresentationStyle = .scaleFromBig
            
            break
        case 11:
            rootViewLayerBorderWidth = 5.0
            rootViewLayerBorderColor = .white
            rootViewLayerShadowRadius = 10.0
            
            leftViewSwipeGestureRange = LGSideMenuSwipeGestureRangeMake(0.0, 88.0)
            leftViewPresentationStyle = .scaleFromBig
            leftViewAnimationDuration = 1.0
            leftViewBackgroundColor = UIColor(red: 0.5, green: 0.75, blue: 0.5, alpha: 1.0)
            leftViewBackgroundImageInitialScale = 1.5
            leftViewInitialOffsetX = -200.0
            leftViewInitialScale = 1.5
            leftViewCoverBlurEffect = UIBlurEffect(style: .dark)
            leftViewBackgroundImage = nil;
            
            rootViewScaleForLeftView = 0.6
            rootViewCoverColorForLeftView = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.3)
            rootViewCoverBlurEffectForLeftView = UIBlurEffect(style: regularStyle)
            rootViewCoverAlphaForLeftView = 0.9
            
            rightViewSwipeGestureRange = LGSideMenuSwipeGestureRangeMake(88.0, 0.0)
            rightViewPresentationStyle = .slideAbove
            rightViewAnimationDuration = 0.25
            rightViewBackgroundColor = UIColor(red: 0.75, green: 0.5, blue: 0.75, alpha: 1.0)
            rightViewLayerBorderWidth = 3.0
            rightViewLayerBorderColor = .black
            rightViewLayerShadowRadius = 10.0
            
            rootViewCoverColorForRightView = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 0.3)
            rootViewCoverBlurEffectForRightView = UIBlurEffect(style: regularStyle)
            rootViewCoverAlphaForRightView = 0.9
            
            break
        default:
            break
        }
    }
    
    override func leftViewWillLayoutSubviews(with size: CGSize) {
        super.leftViewWillLayoutSubviews(with: size)
        
        if !isLeftViewStatusBarHidden {
            leftView?.frame = CGRect(x: 0.0, y: 20.0, width: size.width, height: size.height - 20.0)
        }
    }
    
    override func rightViewWillLayoutSubviews(with size: CGSize) {
        super.rightViewWillLayoutSubviews(with: size)
        
        if (!isRightViewStatusBarHidden ||
            (rightViewAlwaysVisibleOptions.contains(.onPadLandscape) &&
                UI_USER_INTERFACE_IDIOM() == .pad &&
                UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation))) {
            rightView?.frame = CGRect(x: 0.0, y: 20.0, width: size.width, height: size.height - 20.0)
        }
    }
    
    override var isLeftViewStatusBarHidden: Bool {
        get {
            if (type == 8) {
                return UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == .phone
            }
            
            return super.isLeftViewStatusBarHidden
        }
        
        set {
            super.isLeftViewStatusBarHidden = newValue
        }
    }
    
    override var isRightViewStatusBarHidden: Bool {
        get {
            if (type == 8) {
                return UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == .phone
            }
            
            return super.isRightViewStatusBarHidden
        }
        
        set {
            super.isRightViewStatusBarHidden = newValue
        }
    }
    
    deinit {
        print("MainViewController deinitialized")
    }
    
}