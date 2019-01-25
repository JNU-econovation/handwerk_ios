//
//  Slide.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 1..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class Slide: UIView {

    var shouldSetupConstraints = true
    var slides: Any = [];

    var imageView: UIImageView!
    let screenSize = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func createSlides()->[UIImageView]
    {
        let slide1 = UIImageView()
        slide1.image = UIImage(named: "max.png")
        
        let slide2 = UIImageView()
        slide2.image = UIImage(named: "eva.jpeg")
        
        let slide3 = UIImageView()
        slide3.image = UIImage(named: "wall.jpeg")
        
        return [slide1, slide2, slide3];
    }
}
