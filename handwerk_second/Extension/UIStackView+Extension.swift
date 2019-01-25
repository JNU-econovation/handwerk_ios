//
//  UIStackView+Extension.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 12..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

extension UIView {
    
    func createStackView(views: [UIView], space : CGFloat)-> UIStackView{
        
        let stackView = UIStackView(arrangedSubviews: views)
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = space
        
        return stackView
        
    }
    
}
