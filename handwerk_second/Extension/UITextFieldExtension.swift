//
//  UITextFieldExtension.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 12..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit


extension UITextField {
    
    func setLeftPaddingPoints(_ space: CGFloat) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
    
}

extension UIView{
    
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right : NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat=0, height : CGFloat=0){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setAnchor(width : CGFloat, height: CGFloat) {
        
        self.setAnchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width, height: height)
        
    }
}


extension UITextField {
    
    public convenience init(placeHolder: String) {
        
        self.init()
        self.backgroundColor = .clear
        self.layer.borderColor = UIColor.grayBorderColor.cgColor
        self.layer.borderWidth = 1
        self.textColor = UIColor(white: 0.9, alpha: 0.8)
        self.font = UIFont.systemFont(ofSize: 17)
        self.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), .foregroundColor : UIColor(white: 1, alpha: 0.7)]))
        self.attributedPlaceholder = placeholder
        self.setAnchor(width: 0, height: 60)
        self.setLeftPaddingPoints(20)
        
    }
    
}
