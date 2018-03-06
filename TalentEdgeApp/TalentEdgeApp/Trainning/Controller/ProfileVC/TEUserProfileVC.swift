//
//  TEUserProfileVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 01/06/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEUserProfileVC: BCUIViewController{

    @IBOutlet weak var tableview: BCUITableView!
    var isEdit = false
    var userImage : BCUIImageView?
    var profileModel : ProfileUpdate = ProfileUpdate()
    var arrItems = ["First Name","Last Name","Email","Mobile"]
    
    var fname:String?
    var lname:String?
    var email:String?
    var mobile:String?
    var image:UIImage?
    var imageURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitle(title: "User Profile")
        
        if self.isEdit == true{
        
            self.updateModel()
        }
        
        tableview.estimatedRowHeight = 50
        tableview.rowHeight = UITableViewAutomaticDimension
        
        self.tableview.registerCellWithTable(nibName: TEInputCell.nibName, reuseIdentifier: TEInputCell.reuseIdentifier)
        
        self.tableview.registerCellWithTable(nibName: TESubmitCell.nibName, reuseIdentifier: TESubmitCell.reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateModel(){
        
        self.fname = Utility.getLoginUserDetail()?.resultData?.user?.fName
        self.lname = Utility.getLoginUserDetail()?.resultData?.user?.lName
        self.email = Utility.getLoginUserDetail()?.resultData?.user?.email
        self.mobile = Utility.getLoginUserDetail()?.resultData?.user?.mobileNo
        
    }
}

extension TEUserProfileVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrItems.count+1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 200.0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed(TEProfileHeader.nibName, owner: self, options: nil)?[0] as! TEProfileHeader;
        
        view.delegate = self
        
        if isEdit == true{
            
            view.userImg.setImageFromUrl(url: Utility.getLoginUserDetail()?.resultData?.user?.avtarUrl, placeHolder: nil)
            
        }else{
        
            view.lblName.setText(text: "\(self.fname ?? "") \(self.lname ?? "")")
            view.userImg.setImageFromUrl(url: self.imageURL, placeHolder: nil)
        }
        
        
        return view;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 4{
           
            let cell = tableView.dequeueReusableCell(withIdentifier: TESubmitCell.reuseIdentifier, for: indexPath) as! TESubmitCell
            cell.delegate = self
            return cell
            
            
        }else{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TEInputCell.reuseIdentifier, for: indexPath) as! TEInputCell
        
        cell.txtInput.tag = indexPath.row
        cell.txtInput.delegate = self
        cell.lblPlaceHolder.setText(text: self.arrItems[indexPath.row])
            
        
        
        switch indexPath.row {
        
            
                case 0:
                    
                    if self.isEdit == true{
                        
                        cell.txtInput.isUserInteractionEnabled = true
                    }else{
                        
                        cell.txtInput.isUserInteractionEnabled = false
                    }
                    
                    cell.txtInput.keyboardType = .default
                    
                    if let value = self.fname{
                        
                        cell.txtInput.text = value
                    }
            
                case 1:
                    
                    if self.isEdit == true{
                        
                        cell.txtInput.isUserInteractionEnabled = true
                    }else{
                        
                        cell.txtInput.isUserInteractionEnabled = false
                    }
                    
                    cell.txtInput.keyboardType = .default
                    
                    if let value = self.lname{
                        
                        cell.txtInput.text = value
                    }
            
            
                case 2:
                    
                    cell.txtInput.isUserInteractionEnabled = false
                    if let value = self.email{
                        
                        cell.txtInput.text = value
                    }
            
                case 3:
                    
                    if self.isEdit == true{
                        
                        cell.txtInput.isUserInteractionEnabled = true
                    }else{
                        
                        cell.txtInput.isUserInteractionEnabled = false
                    }
                    
                    cell.txtInput.keyboardType = .phonePad
                    
                    if let value = self.mobile{
                        
                        cell.txtInput.text = value
                    }
            
            default:
            print("-- NONE --")
        }
            return cell
            
        }
    }
}

extension TEUserProfileVC:TEProfileHeaderDelegate,TESubmitCellDelegate{
    
    func selectImage() {
    
        if self.isEdit == true{
        
            self.actionSheetForPhoto()
        }
        
    }
    
    override func getImageFromImagePicker(image: UIImage, url: NSURL?) {
        
        self.image = image
    }
    
    func submitDidClick(sender: BCUIButton) {
        
        self.view.endEditing(true)
        
        if  self.fname == nil{
            
            Utility.showAlert(message: "Please enter first name", title: nil, actions: nil, controller: self)
            return
        }
        
        if  self.fname == nil{
            
            Utility.showAlert(message: "Please enter last name", title: nil, actions: nil, controller: self)
            return
        }
        
        if self.mobile == nil{
            
            Utility.showAlert(message: "Please enter mobile number", title: nil, actions: nil, controller: self)
            return
        }
        
        if let mobile = self.mobile{
            
            if mobile.count != 10{
            
                Utility.showAlert(message: "Please enter Valid mobile number", title: nil, actions: nil, controller: self)
                return
            }
        }
        self.callWebserviceForUpdateProfile()
    }
}

extension TEUserProfileVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("OK -------:",textField.text ?? "")
        switch textField.tag {
        
        case 0:
            
            if (textField.text?.count)! <= 0{
            
                self.fname = nil
                
            }else{
            
                self.fname = textField.text
            }
            
            
        case 1:
            
            if (textField.text?.count)! <= 0{
            
                self.lname = nil
                
            }else{
            
                self.lname = textField.text
            }
            
            
        case 3:
            
            if (textField.text?.count)! <= 0{
            
                self.mobile = nil
            }else{
                
                self.mobile = textField.text
            }
            
            
        default:
            print("-- NONE --")
        }
    }
    
}

extension TEUserProfileVC {
    
    func callWebserviceForUpdateProfile() {
        
        
        let paramParam : NSMutableDictionary = NSMutableDictionary()
        paramParam["fname"] = self.fname
        paramParam["lname"] = self.lname
        paramParam["mobile_no"] = self.mobile
        paramParam["address"] = ""
        paramParam["city_id"] = ""
        paramParam["state_id"] = ""
        paramParam["country_id"] = ""
        paramParam["qualification"] = ""
        
        let headerParam : NSMutableDictionary = NSMutableDictionary()
        
        self.startAnimating()
        
        NetworkManager.httpMultiPartFromRequest(.updateProfile, dataParam: paramParam, requestHeader: headerParam,  userimage : self.image,completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            print("Update Profile: ------> ",data ?? "Update Profile");
            
            if let data = data {
                
                if let message = data.value(forKey: "message") as? String{
                    
                    Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                }
                else{
                    
                    Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                }
            }
            self.stopAnimating()
        })
    }
}
