//
//  LernersVC.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 27/05/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class TEContactListVC: BCUIViewController {
    
    @IBOutlet weak var serachView: BCView!
    var baseViewController:UIViewController?
    var batchID:String?
    var batchName:String?
    var contactsModel:ContactsModel?
    var arrContacts = [String:[Contact]]()
    var arrSearchContacts = [String:[Contact]]()
    var allKeys = Array<String>()
    var isSearching = false
    
    
    @IBOutlet weak var tableView: BCUITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTitle(title: "Contacts")
        let view = Bundle.main.loadNibNamed(TESearchBarHeader.nibName, owner: self, options: nil)?[0] as! TESearchBarHeader
        view.delegate = self
        self.serachView.addSubview(view)
        
        if let batchName = self.batchName{
            
            self.setTitle(title: batchName)
        }
        
        self.registerCellWithTable()
        self.callWebserviceForLearnerList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func refreshTable(_ sender:AnyObject) -> Void {
        
        self.callWebserviceForLearnerList()
    }
    
    func registerCellWithTable() -> Void {
        
        self.tableView.registerCellWithTable(nibName: TEContactListCell.nibName, reuseIdentifier: TEContactListCell.reuseIdentifier)
    }
    
    func filterDataWithText(value:String?) -> Void {
        
        if let model = self.contactsModel?.contact{
            
            if self.isSearching {
                
                if let value = value {
                    
                    if value.isEmpty == false{
                        
                        let filterContact = model.filter({ ($0.firstName?.lowercased().contains(value.lowercased()))!  || ($0.lastName?.lowercased().contains(value.lowercased()))!})
                        
                        var result = [String:[Contact]]()
                        
                        self.allKeys.removeAll()
                        for letter in Utility.alphabet {
                            
                            result[letter] = []
                            let matches = filterContact.filter({ ($0.firstName?.hasPrefix(letter))! })
                            
                            if matches.count > 0 {
                                
                                self.allKeys.append(letter)
                                
                                for item in matches {
                                    
                                    result[letter]?.append(item)
                                }
                            }
                            self.arrSearchContacts = result
                        }
                        
                    }else{
                        
                        self.arrSearchContacts = self.arrContacts
                        
                    }
                    
                }else{
                    
                    self.arrSearchContacts = self.arrContacts
                }
                
                
            }else{
                
                var result = [String:[Contact]]()
                self.allKeys.removeAll()
                for letter in Utility.alphabet {
                    
                    result[letter] = []
                    let matches = model.filter({ ($0.firstName?.hasPrefix(letter))! })
                    
                    if matches.count > 0 {
                        
                        self.allKeys.append(letter)
                        
                        for item in matches {
                            
                            result[letter]?.append(item)
                        }
                    }
                    self.arrContacts = result
                }
            }
        }
    }
}

extension TEContactListVC : TEContactListCellDelegate{
    
    func mobileNumberClick(indexPath: IndexPath?){
        
        if let indexPath = indexPath{
            
            if self.isSearching == true{
                
                if let model = self.arrSearchContacts[self.allKeys[indexPath.section]]{
                    
                    self.makeCall(mobileNumber: model[indexPath.row].mobileNo)
                }
                
            
            }
            else{
                
                if let model = self.arrContacts[self.allKeys[indexPath.section]]{
                    
                    self.makeCall(mobileNumber: model[indexPath.row].mobileNo)
                    
                }
            }
            
        }
    }
    func messageClick(indexPath: IndexPath?){
        
        if let indexPath = indexPath{
            
            if self.isSearching == true{
                
                if let model = self.arrSearchContacts[self.allKeys[indexPath.section]]{
                   
                    let mobile = model[indexPath.row].mobileNo ?? ""
                    self.composeNativeMessage(recipients: [mobile], body: nil)
                }
            }else{
                
                if let model = self.arrContacts[self.allKeys[indexPath.section]]{
                    
                    let mobile = model[indexPath.row].mobileNo ?? ""
                    self.composeNativeMessage(recipients: [mobile], body: nil)
                }
            }
            
        }
    }
    func shareClick(indexPath: IndexPath?){
        
        if let indexPath = indexPath{
            
            if self.isSearching == true{
                
                if let model = self.arrSearchContacts[self.allKeys[indexPath.section]]{
                    
                    
                }
                
                
            }else{
                
                if let model = self.arrContacts[self.allKeys[indexPath.section]]{
                    
                    
                }
            }
        }
    }
}

extension TEContactListVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.allKeys.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return self.allKeys
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isSearching == true{
            
            if let model = self.arrSearchContacts[self.allKeys[section]]{
                
                return model.count
            }
            return 0
        }else{
            
            if let model = self.arrContacts[self.allKeys[section]]{
                
                return model.count
            }
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: TEContactListCell.reuseIdentifier) as! TEContactListCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        if self.isSearching == true{
            
            if let model = self.arrSearchContacts[self.allKeys[indexPath.section]]{
                
                cell.setData(model: model[indexPath.row])
            }
            
            
        }else{
            
            if let model = self.arrContacts[self.allKeys[indexPath.section]]{
                
                cell.setData(model: model[indexPath.row])
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension TEContactListVC:TESearchBarHeaderDelegate{
    
    func begainEditing (searchBar: UISearchBar?){
        
        isSearching = true
    }
    
    func endEditing (searchBar: UISearchBar?){
        
        isSearching = false
        self.tableView.reloadData()
    }
    
    func textDidChange (searchBar: UISearchBar?,searchText: String?){
        
        isSearching = true
        
        if let text = searchText{
            
            self.filterDataWithText(value: text)
        }
        self.tableView.reloadData()
    }
}

//MARK: - Network Call

extension TEContactListVC {
    
    /*
     In Header token:XXXX 
     In Data batch_id:3
     */
    
    func callWebserviceForLearnerList() {
        
        let dicParam  =  NSMutableDictionary()
        dicParam["user_group"] = "1"
        dicParam["enterprise_id"] = "2"
        
        let headerParam = NSMutableDictionary()
        
        self.startAnimating()
        
        NetworkManager.httpPostRequest(.getLearnerList, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
            
            if let data = data{
                
                //print("Learner List : ------> ",data.string() ?? "LearnerList Error");
                self.contactsModel = ContactsModel(object: data)
                self.filterDataWithText(value:"")
                
            }
            
            if self.arrContacts.count > 0 {
                
                self.tableView.backgroundView = nil
                
            }else{
                
                self.tableView.backgroundView = Utility.nodataFoundView()
            }
            self.tableView.reloadData()
            self.stopAnimating()
        })
    }
}
