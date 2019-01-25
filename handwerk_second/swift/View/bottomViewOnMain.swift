//
//  bottomViewOnMain.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 19..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class bottomViewOnMain : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        
        let stackView = createStackView( views : [handticeLabel, handticeTableView], space: 35)
        addSubview(stackView)
        
        stackView.setAnchor(width: self.frame.width - 60, height: 0)
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("bla bla")
    }
    
    let handticeLabel : UILabel = {
        let ul = UILabel()
        ul.text = "Hand-tice"
        ul.font = UIFont(name: "Lato-Regular", size: 40)
        return ul
    }()
    
    let handticeTableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
}
