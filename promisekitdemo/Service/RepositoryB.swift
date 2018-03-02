//
//  RepositoryB.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 02/03/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import ObjectMapper

class RepositoryB: Mappable {
    
    var name = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}

