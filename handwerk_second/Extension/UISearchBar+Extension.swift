
//  UISearchBar+Extension.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 23..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

extension productViewController : UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
        }else{
            isSearching = true
            filtered = products.filter({$0.productName?.range(of : searchBar.text!, options : .caseInsensitive) != nil})
        }
        
        collectionView.reloadData()
        
    }
    
}
