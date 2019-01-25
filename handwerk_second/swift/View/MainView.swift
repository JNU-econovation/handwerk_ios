//
//  MainView.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 15..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class MainView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    var imageArray = [UIImage]()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mainScrollView : UIScrollView = {
        
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan

        return view
        
    }()
    
    func setupView() {
        
        addSubview(mainScrollView)
        
        imageArray = [#imageLiteral(resourceName: "background1"), #imageLiteral(resourceName: "background2"), #imageLiteral(resourceName: "splashImage")]
        
        for i in 0..<imageArray.count {
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            let xPosition = frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: frame.width, height: frame.height)
            
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
            mainScrollView.addSubview(imageView)
            
        }
        mainScrollView.setAnchor(width: self.frame.width, height: 0)
        mainScrollView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mainScrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
}
