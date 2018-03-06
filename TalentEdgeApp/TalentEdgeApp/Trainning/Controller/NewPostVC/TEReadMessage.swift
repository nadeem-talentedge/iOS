//
//  TENewPostVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 22/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import AssetsLibrary

class SelectedImage:NSObject{
    
    var image:UIImage?
    var imageImage:String?
}

class TENewPostVC: BCUIViewController {

    @IBOutlet weak var tableView:BCUITableView!
    let arrTags = ["Birthday","Recuitments","Assessment","Assigmenment","Other"]
    var batch  = Array<TEMultipleSelectionModel>()
    var batchUser = Array<TEMultipleSelectionModel>()
    var isContactEditable = true
    var images = Array<SelectedImage>()
    var subject:String?
    var message:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitle(title: "New Message")
        self.registerCellWithTable()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: - User Define

extension TENewPostVC{

    func registerCellWithTable() -> Void {
        
        self.tableView.backgroundColor = UIColor.white
        
        self.tableView.registerCellWithTable(nibName: TESelectContactCell.nibName, reuseIdentifier: TESelectContactCell.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEInputText.nibName, reuseIdentifier: TEInputText.reuseIdentifier)
        
        self.tableView.registerCellWithTable(nibName: TEAttachmentCell.nibName, reuseIdentifier: TEAttachmentCell.reuseIdentifier)
        
    }
}

extension TENewPostVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3+self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TESelectContactCell.reuseIdentifier, for: indexPath) as! TESelectContactCell
            
            cell.type = .batch
            cell.setData(list: self.batch)
            
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TESelectContactCell.reuseIdentifier, for: indexPath) as! TESelectContactCell
            
            cell.type = .batchUser
            cell.setData(list: self.batchUser)
            
            return cell
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TEInputText.reuseIdentifier, for: indexPath) as! TEInputText
            cell.delegate = self
            return cell
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TEAttachmentCell.reuseIdentifier, for: indexPath) as! TEAttachmentCell
            cell.indexPath = indexPath
            cell.delegate = self
            let model = self.images[indexPath.row - 3]
            cell.lblImageName.setText(text: model.imageImage)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            
            if isContactEditable == true {
            
                let vc = TEMultipleSelectionVC(nibName: "TEMultipleSelectionVC", bundle: nil)
                vc.delegate = self
                vc.type = .batch
                vc.list = self.batch
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        case 1:
            
            if isContactEditable == true {
        
                if self.isBatchSelected() == true {
                    
                    let vc = TEMultipleSelectionVC(nibName: "TEMultipleSelectionVC", bundle: nil)
                    vc.delegate = self
                    vc.type = .batchUser
                    vc.list = self.batchUser
                    vc.id = self.batch[0].id
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }else{
                    
                    Utility.showAlert(message: "Please select batch first", title: nil, actions: nil, controller: self)
                }
            }
            
        default:
            print("AAAAAA")
            
        }
    }
    
}

extension TENewPostVC:TEAttachmentCellDelegate{
    
    func deleteImage(indexPath: IndexPath?) {
        
        if let indexPath = indexPath{
            
            self.images.remove(at: indexPath.item - 3)
            self.tableView.reloadData()
        }
    }
}
extension TENewPostVC:TEMultipleSelectionVCDelegate{

    func didSelect(list: Array<TEMultipleSelectionModel>,type:Type) {
        
        switch type {
            
        case .batch:
            self.batch = list
            
        case .batchUser:
            self.batchUser = list
            
        default:
            print("OK")
        
        }
        self.tableView.reloadData()
    }
}

extension TENewPostVC {
    
    func isBatchSelected() -> Bool {
        
        if self.batch.count <= 0{
            
            return false
            
        }else{
            
            let arr = self.batch.filter() { $0.isSelected == true }
            if arr.count > 0 {
                
                return true
                
            }else{
                
               return false
            }
        }
    }
    
    func selectedBatchID() -> String? {
        
        let arr = self.batch.filter() { $0.isSelected == true }
        if arr.count > 0{
            
           return arr[0].id
        }
        return nil
    }
    
    func isBatchUserSelected() -> Bool {
        
        if self.batchUser.count <= 0{
            
            return false
            
        }else{
            
            let arr = self.batchUser.filter() { $0.isSelected == true }
            if arr.count > 0 {
                
                return true
                
            }else{
                
                return false
            }
        }
    }
    
    func selectedBatchUserID() -> NSMutableArray? {
        
        let arr = self.batchUser.filter() { $0.isSelected == true }
        var arrModel = NSMutableArray()
        for model in arr{
            
            arrModel.add(model.id ?? "")
        }
        return arrModel
    }
    
}

extension TENewPostVC:TEInputTextDelegate{

    func selectSend(indexPath: IndexPath?) {
        
        self.view.endEditing(true)
        
        if self.isBatchSelected() == false{
            
            Utility.showAlert(message: "Please select batch first", title: nil, actions: nil, controller: self)
            
            return
        }
        
        if self.isBatchUserSelected() == false{
            
            Utility.showAlert(message: "Please select batch user", title: nil, actions: nil, controller: self)
            
            return
        }
        
        if self.subject == nil {
            
            Utility.showAlert(message: "Please enter subject", title: nil, actions: nil, controller: self)
            
            return
        }
        
        if self.message == nil {
            
            Utility.showAlert(message: "Please enter message", title: nil, actions: nil, controller: self)
            
            return
        }
        
        self.postMessage()
    }
    
    func selectPhoto(indexPath: IndexPath?) {
     
        self.actionSheetForPhoto()
        
    }
    
    override func getImageFromImagePicker(image: UIImage, url: NSURL?) {
     
        let model = SelectedImage()
        model.image = image
        
        if let imageURL = url {
            
            ALAssetsLibrary().asset(for: imageURL as URL!, resultBlock: { asset in
                
                if let fileName = asset?.defaultRepresentation().filename(){
                
                    model.imageImage = fileName
                    self.images.append(model)
                    self.tableView.reloadData()
                    
                }else{
                    
                    model.imageImage = "Attachment"
                    self.images.append(model)
                    self.tableView.reloadData()
                }
                
            }, failureBlock:{_ in
                
                model.imageImage = "Attachment"
                self.images.append(model)
                self.tableView.reloadData()
            })
        
            
        }else{
            
            model.imageImage = "Attachment"
            self.images.append(model)
            self.tableView.reloadData()
        }
    }
    
    func textFieldDidEndEditing(indexPath: IndexPath?, text: String?) {
     
        print("Subject ------->",text ?? "NA")
        self.subject = text
    }
    
    func textViewDidEndEditing(indexPath: IndexPath?, text: String?) {
        
        print("Message ------->",text ?? "NA")
        self.message = text
    }
    
    
}

//MARK:- Server Call

extension TENewPostVC{

    func postMessage() {
        
        
            let paramParam : NSMutableDictionary = NSMutableDictionary()
        
            paramParam.setValue(self.subject ?? "", forKey: "subject")
            paramParam.setValue(self.message ?? "", forKey: "message")
            paramParam.setValue(self.selectedBatchID() ?? "", forKey: "batch_id")
            paramParam.setValue(Utility.arrayToString(array: self.selectedBatchUserID()), forKey: "to_id")
        
            let headerParam : NSMutableDictionary = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpMultiPartFromRequest(.messageCompose, dataParam: paramParam, requestHeader: headerParam,  userimage : nil,completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Post Message: ------> ",data ?? "Upload Assignment error");
                
                if let data = data{
                    
                    if let message = data.value(forKey: "message") as? String{
                        
                        Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                    else{
                        
                        Utility.showAlert(message: "Server not responding. Please try after some time.", title: AppName, actions: nil, controller: self)
                    }
                }
                self.stopAnimating()
            })
    }
}

