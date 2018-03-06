//
//  BCUIViewController.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 19/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import ASExtendedCircularMenu
import MessageUI

class BCUIViewController: UIViewController,NVActivityIndicatorViewable {
    
    var document:UIDocumentInteractionController?
    lazy var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        self.navigationController?.navigationBar.isTranslucent = false;
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = ThemeManager.setThemeColor(appColor: .navigation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Navigation Custom Title
    
    func setBootTitle(topTitle:String,bottomTitle:String) -> Void {
        
        let view = UIView(frame: CGRect(x:0, y:0, width: 200, height: 45))
        
        let top = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 20))
        top.text = topTitle
        top.backgroundColor = UIColor.clear
        top.textColor = UIColor.white
        top.textAlignment = .center
        top.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(top)
        
        let bottom = UILabel(frame: CGRect(x:0, y:20, width: 200, height: 20))
        bottom.text = bottomTitle
        bottom.backgroundColor = UIColor.clear
        bottom.textColor = UIColor.white
        bottom.textAlignment = .center
        bottom.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(bottom)
        
        self.navigationItem.titleView = view
    }
    
    func setTitle(title:String) -> Void {
        
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 45))
        titleLabel.text = title
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.navigationItem.titleView = titleLabel
    }
    
    func setTitleForULS(title:String) -> Void {
        
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:45))
        titleLabel.text = title
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        //self.navigationItem.titleView = titleLabel
    }
    
    //MARK:- Left Menu Button
    
    func navigationLeftButton(imageName:String) -> Void {
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnMessage = UIButton()
        btnMessage.addTarget(self, action: #selector(leftNavButtonDidClick), for: .touchUpInside)
        btnMessage.tag = 4
        btnMessage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnMessage.setImage(UIImage(named: imageName), for: .normal)
        
        let btn1 = UIBarButtonItem(customView: btnMessage)
        buttonsArray.append(btn1)
        
        self.navigationItem.leftBarButtonItems = buttonsArray
    }
    
    func leftNavButtonDidClick(sender:UIButton) -> Void {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    func navigationBarBaseHomeRightButtons() ->Void{
    
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnMessage = UIButton()
        btnMessage.tag = 1
        btnMessage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnMessage.setImage(UIImage(named: "message"), for: .normal)
        
        let btnNotification = UIButton()
        btnNotification.tag = 2
        btnNotification.setImage(UIImage(named: "notification"), for: .normal)
        btnNotification.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
    
        
        btnMessage.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnNotification.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        let btn1 = UIBarButtonItem(customView: btnMessage)
        btn1.tag = btnMessage.tag
        
        let btn2 = UIBarButtonItem(customView: btnNotification)
        btn2.tag = btnNotification.tag
        
        
        buttonsArray.append(btn2)
        buttonsArray.append(btn1)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
    
    }
    
    func ulsNavigationBarBaseHomeRightButtons() ->Void{
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnMessage = UIButton()
        btnMessage.tag = 1
        btnMessage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnMessage.setImage(UIImage(named: "message"), for: .normal)
        
        let btnNotification = UIButton()
        btnNotification.tag = 2
        btnNotification.setImage(UIImage(named: "notification"), for: .normal)
        btnNotification.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        let btnContact = UIButton()
        btnContact.tag = 3
        btnContact.setImage(UIImage(named: "nav_contact"), for: .normal)
        btnContact.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        let btnUser = UIButton()
        btnUser.tag = 4
        btnUser.setImage(UIImage(named: "nav_user"), for: .normal)
        btnUser.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        btnMessage.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnNotification.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnContact.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        
        btnContact.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnUser.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        let btn1 = UIBarButtonItem(customView: btnMessage)
        btn1.tag = btnMessage.tag
        
        let btn2 = UIBarButtonItem(customView: btnNotification)
        btn2.tag = btnNotification.tag
        
        //let btn3 = UIBarButtonItem(customView: btnContact)
        //btn3.tag = btnContact.tag
        
        let btn4 = UIBarButtonItem(customView: btnUser)
        btn4.tag = btnUser.tag
        
        buttonsArray.append(btn4)
        //buttonsArray.append(btn3)
        buttonsArray.append(btn2)
        buttonsArray.append(btn1)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
    }
    
    func ulsRightBarItems() ->Void{
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnMessage = UIButton()
        btnMessage.tag = 1
        btnMessage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnMessage.setImage(UIImage(named: "message"), for: .normal)
        
        let btnNotification = UIButton()
        btnNotification.tag = 2
        btnNotification.setImage(UIImage(named: "notification"), for: .normal)
        btnNotification.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        let btnContact = UIButton()
        btnContact.tag = 3
        btnContact.setImage(UIImage(named: "nav_contact"), for: .normal)
        btnContact.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        let btnUser = UIButton()
        btnUser.tag = 4
        btnUser.setImage(UIImage(named: "nav_user"), for: .normal)
        btnUser.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        btnMessage.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnNotification.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnContact.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        
        btnContact.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        btnUser.addTarget(self, action: #selector(appHomeNavigationButtonClick), for: .touchUpInside)
        
        let btn1 = UIBarButtonItem(customView: btnMessage)
        btn1.tag = btnMessage.tag
        
        let btn2 = UIBarButtonItem(customView: btnNotification)
        btn2.tag = btnNotification.tag
        
        //let btn3 = UIBarButtonItem(customView: btnContact)
        //btn3.tag = btnContact.tag
        
        let btn4 = UIBarButtonItem(customView: btnUser)
        btn4.tag = btnUser.tag
        
        buttonsArray.append(btn4)
        //buttonsArray.append(btn3)
        buttonsArray.append(btn2)
        //buttonsArray.append(btn1)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
    }
    
    func appHomeNavigationButtonClick(sender:UIButton) -> Void {
        
        /**/
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if sender.tag == 1{
            
            let msgObj = TEMessageHomeVC(nibName: "TEMessageHomeVC", bundle: nil)
            self.navigationController?.pushViewController(msgObj, animated: true)
        }
        else if sender.tag == 2{
            
            let notiObj = storyboard.instantiateViewController(withIdentifier: Utility.ID_TENotificationVC) as! TENotificationVC
            
            self.navigationController?.pushViewController(notiObj, animated: true)
        }
            
        else if sender.tag == 3{
            
            let contact = TEContactListVC(nibName: "TEContactListVC", bundle: nil)
            self.navigationController?.pushViewController(contact, animated: true)
            
        }else if sender.tag == 4{
            
            let profile = TEProfileVC(nibName: "TEProfileVC", bundle: nil)
            self.navigationController?.pushViewController(profile, animated: true)
        }
    }
    
    
    func addMessageButton() ->Void{
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnMessage = UIButton()
        btnMessage.tag = 1
        btnMessage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnMessage.setImage(UIImage(named: "message"), for: .normal)
        
        btnMessage.addTarget(self, action: #selector(createNewMessage), for: .touchUpInside)
        
        let btn1 = UIBarButtonItem(customView: btnMessage)
        btn1.tag = btnMessage.tag
        
        buttonsArray.append(btn1)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
        
    }
    
    func createNewMessage(sender:UIButton) -> Void {
    
    }
}

extension BCUIViewController {
    
    func isTeacherLogin() -> Bool {
        
        if let userRole = Utility.getLoginUserDetail()?.resultData?.user?.userRole{
            
            if userRole.lowercased() == "faculty".lowercased(){
                
                return true
            }
            
        }
        return false
    }
    
    func isStudentLogin() -> Bool {
        
        if let userRole = Utility.getLoginUserDetail()?.resultData?.user?.userRole{
            
            if userRole.lowercased() == "student".lowercased(){
                
                return true
            }
            
        }
        return false
    }
    
    func isLMS() -> Bool {
        
        if  let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let url = appInfo[0].type {
                    
                    if url == "LMS" {
                        
                        return true
                        
                    }else{
                        
                        return false
                    }
                    
                }else{
                    
                    return false
                }
                
            }else{
                
                return false
            }
            
        }else{
            
            return false
        }
    }
    
    func isULS() -> Bool {
        
        if  let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let url = appInfo[0].type {
                    
                    if url == "ULS" {
                        
                        return true
                        
                    }else{
                        
                        return false
                    }
                    
                }else{
                    
                    return false
                }
                
            }else{
                
                return false
            }
            
        }else{
            
            return false
        }
    }
    
    func isELS() -> Bool {
        
        if  let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let url = appInfo[0].type {
                    
                    if url == "ELS" {
                        
                        return true
                        
                    }else{
                        
                        return false
                    }
                    
                }else{
                    
                    return false
                }
                
            }else{
                
                return false
            }
            
        }else{
            
            return false
        }
    }
}

//MARK:- Bottom Menu

extension BCUIViewController: ASCircularButtonDelegate {
    
    func configureBottomMenu(sender:ASCircularMenuButton) -> Void {
        
        configureDynamicCircularMenuButton(button: sender, numberOfMenuItems: 3)
        sender.menuButtonSize = .large
        
        sender.sholudMenuButtonAnimate = true
    }
    
    func buttonForIndexAt(_ menuButton: ASCircularMenuButton, indexForButton: Int) -> UIButton {
        
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor.orange
        button.setImage(UIImage(named:"index_\(indexForButton)"), for: .normal)
        return button
    }
    
    func didClickOnCircularMenuButton(_ menuButton: ASCircularMenuButton, indexForButton: Int, button: UIButton) {
        
        if indexForButton == 1{
           
            let controller = TEBatchChatList(nibName: "TEBatchChatList", bundle: nil)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        else if indexForButton == 2 {
        
            let controller = TEWebView(nibName: "TEWebView", bundle: nil)
            controller.pageType = .avatar
            self.navigationController?.pushViewController(controller, animated: true)
        }else{
            
            let vc = TENewPostVC(nibName: "TENewPostVC", bundle: nil)
            vc.isCounsellor = true
            vc.isContactEditable = false
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}

//MARK:- Call And Url Open

extension BCUIViewController {
    
    func makeCall(mobileNumber:String?) -> Void {
        
        if let mobileNumber = mobileNumber{
            
            //print("Mobile number ------------------->",mobileNumber.trim())
            
            if let url = URL(string: "tel://\(mobileNumber.trim())"), UIApplication.shared.canOpenURL(url) {
                
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
                
            }else{
                
                Utility.showAlert(message: "Call not supported on this device", title: "Call", actions: nil, controller: nil)
            }
            
        }else{
            
            Utility.showAlert(message: "Mobile number is not valid", title: "Call", actions: nil, controller: nil)
        }
        
    }
    
    func openUrl(url:String?) -> Void {
        
        if let url = url{
            
            if let url = URL(string: url) {
                
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
                
            }else{
                
                Utility.showAlert(message: "url not valid", title: "Call", actions: nil, controller: nil)
            }
            
        }else{
            
            Utility.showAlert(message: "Website not available", title: "Call", actions: nil, controller: nil)
        }
        
    }
}

extension BCUIViewController:MFMessageComposeViewControllerDelegate{
    
    func composeNativeMessage(recipients:[String],body:String?) -> Void {
        
        if MFMessageComposeViewController.canSendText() {
            
            let composeVC = MFMessageComposeViewController()
            composeVC.messageComposeDelegate = self
            
            // Configure the fields of the interface.
            composeVC.recipients = recipients
            composeVC.body = body ?? ""
            
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }else{
            
            Utility.showAlert(message: "SMS services are not available", title: "Call", actions: nil, controller: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
        controller.dismiss(animated: true, completion: nil)
        
    }
}

//MARK: - UIDocumentInteractionController Delegate

extension BCUIViewController : UIDocumentInteractionControllerDelegate{
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        
        return self
    }
    
}

extension BCUIViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func actionSheetForPhoto()
    {
        let actionSheet = UIAlertController(title: AppName, message: "Choose Option", preferredStyle: .alert)
        
        let cameraAction =  UIAlertAction(title: "Camera", style: .destructive) { (UIAlertAction) in
            self.shootPhoto()
        }
        
        let photoLibraryAction =  UIAlertAction(title: "Photo Library", style: .destructive) { (UIAlertAction) in
            self.photoFromLibrary()
        }
        
        let cancelAction =  UIAlertAction(title: "Cancel", style: .destructive) { (UIAlertAction) in
            
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    func photoFromLibrary() {
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    
    func shootPhoto() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            picker.delegate = self
            present(picker,animated: true,completion: nil)
        }
        else{
            
            Utility.showAlert(message: "Sorry, this device has no camera", title: AppName, actions: nil, controller: self)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            self.getImageFromImagePicker(image: image, url: info[UIImagePickerControllerReferenceURL] as? NSURL)
            
        }
        dismiss(animated:true, completion: nil)
    }
    
    func getImageFromImagePicker(image:UIImage,url:NSURL?){
        
        
    }
}

extension BCUIViewController {
    
    func parseData(data:Any?) -> (Any?,Any?) {
        
        //print("Data ------------------------------>",data ?? "NA")
        
        if let data = data as? NSDictionary{
            
            if let status = data.value(forKey: "status") as? Int{
                
                if status == 1 {
                    
                    if let resultData = data.value(forKey: "resultData"){
                    
                        if let baseURL = data.value(forKey: "ASSETS_BASE_URL") as? String{
                            
                            return (resultData,baseURL)
                            
                        }else{
                        
                            return (resultData,nil)
                        }
                    
                    }else{
                        
                        Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                else{
                    
                    if let message = data.value(forKey: "message") as? String{
                    
                        if message.lowercased() == "Invalid Access, Please login to access your account".lowercased(){
                            
                            if let nav = AppDelegate.sharedDeleagte().baseNavigationController{
                                
                                Utility.deleteLoginUser()
                                nav.popToRootViewController(animated: true)
                            }
                            
                        }else{
                        
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }else{
                        
                        Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                
            }else{
                
                Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
            }
            
        }else{
            
            Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
        }
        return(nil,nil)
    }
}

//MARK: - Network Call

extension BCUIViewController {
    
    func callServiceForDownloadingFile(path:String?) {
        
        if let path = path{
            
            self.startAnimating()
            
            NetworkManager.downloadFileFromUrl(fileUrl: path, progress: { progress in
                
            }, result: { data in
                
                if let data = data {
                    
                    if data is Error{
                        
                        print("Error Message : -",(data as! Error).localizedDescription)
                        
                    }else{
                        
                        let filePathURL = NSURL.fileURL(withPath: data as! String)
                        
                        DispatchQueue.main.async {
                            
                            self.document = UIDocumentInteractionController(url: filePathURL)
                            
                            if let document = self.document{
                                
                                self.document?.delegate = self
                                document.presentPreview(animated: true)
                            }
                        }
                    }
                }
                self.stopAnimating()
            })
        }
    }
}


