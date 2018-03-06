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
    var topMessage:TopMessage?
    var counselorData:Counsellor?
    var isCounsellor = false
    var isReply = false
    var isContactEditable = true
    var images = Array<SelectedImage>()
    var subject:String?
    var message:String?
    var raiseDoubt = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navButton()
        self.setTitle(title: "New Message")
        
        if isReply == true{
            
            let batchTemp = TEMultipleSelectionModel()
            batchTemp.id = self.topMessage?.batchId
            batchTemp.isSelected = true
            batchTemp.title = "Batch Name"
            batch.append(batchTemp)
            
            let batchUserTemp = TEMultipleSelectionModel()
            batchUserTemp.isSelected = true
            
            if let name = self.topMessage?.fromName{
            
                batchUserTemp.id = self.topMessage?.fromId
                batchUserTemp.title = name
                
            }else{
                
                batchUserTemp.id = self.topMessage?.toId
                batchUserTemp.title =  self.topMessage?.toName
            }
            batchUser.append(batchUserTemp)
        }
        
        if self.isCounsellor == true{
            
            let batchTemp = TEMultipleSelectionModel()
            batchTemp.id = "\(Utility.getLoginUserDetail()?.resultData?.counsellor?.batchId ?? 0)"
            batchTemp.isSelected = true
            batchTemp.title = "Batch Name"
            batch.append(batchTemp)
            
            let batchUserTemp = TEMultipleSelectionModel()
            batchUserTemp.id = "\(Utility.getLoginUserDetail()?.resultData?.counsellor?.id ?? "")"
            batchUserTemp.isSelected = true
            batchUserTemp.title = Utility.getLoginUserDetail()?.resultData?.counsellor?.name
            batchUser.append(batchUserTemp)
        }
        self.registerCellWithTable()
        
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
        
        self.tableView.registerCellWithTable(nibName: TEReplyCell.nibName, reuseIdentifier: TEReplyCell.reuseIdentifier)
        
    }
    
    func navButton() ->Void{
        
        var buttonsArray:[UIBarButtonItem] = [UIBarButtonItem]()
        
        let btnAttach = UIButton()
        btnAttach.tag = 1
        btnAttach.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnAttach.setImage(UIImage(named: "attachment_white"), for: .normal)
        
        let btnSend = UIButton()
        btnSend.tag = 2
        btnSend.setImage(UIImage(named: "send_white"), for: .normal)
        btnSend.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        btnAttach.addTarget(self, action: #selector(didAttach), for: .touchUpInside)
        btnSend.addTarget(self, action: #selector(didSend), for: .touchUpInside)
        
        let attach = UIBarButtonItem(customView: btnAttach)
        
        let send = UIBarButtonItem(customView: btnSend)
        
        buttonsArray.append(send)
        buttonsArray.append(attach)
        
        self.navigationItem.rightBarButtonItems = buttonsArray
        
    }
    
    func didSend(sender:UIButton) -> Void {
        
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
    
    func didAttach(sender:UIButton) -> Void {
     
        if self.images.count >= 3{
            
            Utility.showAlert(message: "Only 3 attachment allowed", title: nil, actions: nil, controller: self)
            
        }else{
            
            self.actionSheetForPhoto()
        }
        
    }
}

extension TENewPostVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isReply == true{
            
            return 4+self.images.count
            
        }else{
        
            return 3+self.images.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isReply == true{
            
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
                
                if self.isReply == true{
                    
                    cell.txtSubject.isUserInteractionEnabled = false
                    cell.txtSubject.text = "Re:\(self.topMessage?.subject ?? "")"
                    self.subject = cell.txtSubject.text
                    
                }else{
                    
                    cell.txtSubject.isUserInteractionEnabled = true
                    if let subject = self.subject{
                        
                        if subject.isEmpty == false{
                            
                            cell.txtSubject.text = subject
                        }
                    }
                }
                
                if let message = self.message{
                    
                    if message.isEmpty == false{
                        
                        cell.txtDescription.text = message
                    }
                }
                return cell
                
            case 3:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TEReplyCell.reuseIdentifier, for: indexPath) as! TEReplyCell
                
                if let topMessage = self.topMessage{
                    
                    cell.lblDetail.setText(text: "on \(topMessage.created ?? ""). \(topMessage.fromName ?? "") wrote")
                    cell.lblMessage.setText(text: topMessage.message)
                }
                
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: TEAttachmentCell.reuseIdentifier, for: indexPath) as! TEAttachmentCell
                cell.indexPath = indexPath
                cell.delegate = self
                let model = self.images[indexPath.row - 4]
                cell.lblImageName.setText(text: model.imageImage)
                return cell
            }
            
        }else{
    
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
                
                if self.isReply == true{
                    
                    cell.txtSubject.isUserInteractionEnabled = false
                    cell.txtSubject.text = "Re:\(self.topMessage?.subject ?? "")"
                    self.subject = cell.txtSubject.text
                    
                }else{
                    
                    cell.txtSubject.isUserInteractionEnabled = true
                    if let subject = self.subject{
                        
                        if subject.isEmpty == false{
                            
                            cell.txtSubject.text = subject
                        }
                    }
                }
                
                if let message = self.message{
                    
                    if message.isEmpty == false{
                        
                        cell.txtDescription.text = message
                    }
                }
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
    
    func raiseDoubtDidClick(status: Bool) {
        
        self.raiseDoubt = status
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
        
            paramParam.setValue((self.raiseDoubt) ?"1":"0", forKey: "is_doubt")
            paramParam.setValue(self.subject ?? "", forKey: "subject")
            paramParam.setValue(self.message ?? "", forKey: "message")
            paramParam.setValue(self.selectedBatchID() ?? "", forKey: "batch_id")
            paramParam.setValue(Utility.arrayToString(array: self.selectedBatchUserID()), forKey: "to_id")
        
            let headerParam : NSMutableDictionary = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpMultiPartFromRequestForMessage(.messageCompose, dataParam: paramParam, requestHeader: headerParam,  userimage : self.images,completionHandler: { (data : NSDictionary?, error : NSError?) in
                
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

