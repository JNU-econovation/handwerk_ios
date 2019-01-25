//
//  UIButton+Extension.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 12..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

extension UIButton {
    
    public convenience init(title : String) {
        self.init()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), .foregroundColor : UIColor.white]))
        
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor(r: 71, g: 82, b: 94)
        self.setAnchor(width: 0, height: 50)

    }
    
}
