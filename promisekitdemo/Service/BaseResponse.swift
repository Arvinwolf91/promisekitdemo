//
//  BaseResponse.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 02/03/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class BaseResponse {
    
    var reposA = [RepositoryA]()
    var reposB = [RepositoryB]()
    
    init(responseJSON:JSON, request:Request) {
        
        switch request {
        case .getAlexGrayRepos:
            reposA = Mapper<RepositoryA>().mapArray(JSONObject: responseJSON.arrayObject)!
        case .getArvinWolf91Repos:
            reposB = Mapper<RepositoryB>().mapArray(JSONObject: responseJSON.arrayObject)!
        }
    }
    
}
