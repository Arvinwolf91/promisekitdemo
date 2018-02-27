//
//  APIService.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 26/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit
import SwiftyJSON

enum Router {
    case getAlexGrayRepos
    case getArvinWolf91Repos
}
    
class APIService {
    
    class func request(router:Router) -> Promise<Repo> {
        
        return Promise { fulfill, reject in
            
            var PATH: String {
                switch router {
                case .getAlexGrayRepos:
                    return "mralexgray/repos"
                case .getArvinWolf91Repos:
                    return "arvinwolf91/repos"
                }
            }
            
            Alamofire.request("\(BASE_URL)\(PATH)").responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let responseJSON = JSON(value)
                    
                    let repos = Repo(responseJSON: responseJSON)
                    fulfill(repos)
                    
                case .failure(let error):
                    reject(error)
                }
            }
            
        }
    }
    
}
