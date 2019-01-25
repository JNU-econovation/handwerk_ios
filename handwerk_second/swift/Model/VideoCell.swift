//
//  VideoCell.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 24..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class BaseCell : UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class VideoCell : BaseCell {
  
    
    override func setUpViews() {
        
        backgroundColor = UIColor.gray
        
    }
    
    
}
