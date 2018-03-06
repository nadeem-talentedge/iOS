//
//  NavigationController.swift
//  LGSideMenuControllerDemo
//

class BCUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .white
    }

    override var shouldAutorotate : Bool {
        return true
    }
    
    override var prefersStatusBarHidden : Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == .phone
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        return sideMenuController!.isRightViewVisible ? .slide : .fade
    }

}
