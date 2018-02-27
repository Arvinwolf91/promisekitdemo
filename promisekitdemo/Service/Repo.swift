//
//  Repo.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 27/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class Repo: Mappable {
    
    var id = ""
    var name = ""
    var full_name = ""
    var repos = [Repo]()
    
    init(responseJSON:JSON) {
        repos = Mapper<Repo>().mapArray(JSONObject: responseJSON.arrayObject)!
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        full_name <- map["full_name"]
    }
}


