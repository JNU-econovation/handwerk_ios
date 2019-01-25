//
//  Notice.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 20..
//  Copyright © 2019년 배성희. All rights reserved.
//

import Foundation
import Firebase

protocol DocumentSerializable {
    init?(dictionary : [String:Any])
}

struct Notice {
    
    var title : String
    var writer : String
    
    var dictionary: [String : Any] {
        return [
            "title" : title,
            "writer" : writer
            
        ]
        
    }
    
}


extension Notice :DocumentSerializable {
    init?(dictionary : [String:Any]){
        guard let title = dictionary["title"] as? String, let writer = dictionary["writer"] as? String else {return nil}
        self.init(title : title, writer : writer)
    }
}

