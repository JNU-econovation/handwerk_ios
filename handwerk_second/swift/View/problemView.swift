//
//  problemView.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 15..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class problemView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func setUp() {
        addSubview(imgView)
        imgView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
       
    }
    
    
    let imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "background")
        return imgView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
