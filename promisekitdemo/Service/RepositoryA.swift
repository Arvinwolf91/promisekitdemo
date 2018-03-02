//
//  Repo.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 27/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import ObjectMapper

class RepositoryA: Mappable {
    
    var name = ""
    var full_name = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        full_name <- map["full_name"]
    }
}
