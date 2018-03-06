//
//  TESearchBarHeader.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 23/07/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

protocol TESearchBarHeaderDelegate {
    
    func begainEditing (searchBar: UISearchBar?)
    func endEditing (searchBar: UISearchBar?)
    func textDidChange (searchBar: UISearchBar?,searchText: String?)
    
}

class TESearchBarHeader: UIView {
    
    var delegate:TESearchBarHeaderDelegate?
    static let nibName = "TESearchBarHeader"
    

}

extension TESearchBarHeader:UISearchBarDelegate{
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = true
        
        if let delegate = self.delegate{
            
            delegate.begainEditing(searchBar: searchBar)
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = false
        
        if let delegate = self.delegate{
            
            delegate.endEditing(searchBar: searchBar)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let delegate = self.delegate{
            
            delegate.textDidChange(searchBar: searchBar, searchText: searchBar.text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let delegate = self.delegate{
            
            delegate.textDidChange(searchBar: searchBar, searchText: searchBar.text)
        }
    }
    
}
