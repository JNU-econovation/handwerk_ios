//
//  UITextView+Extension.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 12..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

extension UITextView {
    
    public convenience init(title : String){
        
        self.init()
        self.text = title
        self.textColor = .white
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isScrollEnabled = false
        self.backgroundColor = .clear
        self.setAnchor(width: 0, height: 60)
        
    }
    
    
}
