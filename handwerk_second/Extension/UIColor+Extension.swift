//
//  UIColor+Extension.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 12..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var grayBorderColor: UIColor = {
        return UIColor(r: 132, g: 146, b: 166)
    }()
}
