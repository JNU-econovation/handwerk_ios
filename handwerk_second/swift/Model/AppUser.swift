//
//  AppUser.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 16..
//  Copyright © 2019년 배성희. All rights reserved.
//

import Foundation

struct AppUser {
    
    var name : String?
    var uid : String?
    var email : String?

    init(name : String, email : String, uid : String) {
        self.name = name
        self.email = email
        self.uid = uid
    }
}
