//
//  productData.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 23..
//  Copyright © 2019년 배성희. All rights reserved.
//

import Foundation
import UIKit

struct Product {

    var imageName : String?
    var productName : String?
    var brandName : String?
    
    init(imageName : String, productName : String, brandName : String) {
        self.imageName = imageName
        self.productName = productName
        self.brandName = brandName
    }

    
}
