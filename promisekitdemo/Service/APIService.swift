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
    case getContacts
}

class APIService {
    
    class func getContactList() -> Promise<Contact> {
        
        return Promise { fulfill, reject in

        
            var PATH: String {
                let router = Router.getContacts
                switch router {
                case .getContacts:
                    return "contacts/"
                }
            }
            
            Alamofire.request("\(BASE_URL)\(PATH)").responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let responseJSON = JSON(value)
                    
                    let contacts = Contact(responseJSON: responseJSON)
                    fulfill(contacts)
                    
                case .failure(let error):
                    reject(error)
                }
            }
                
            }
        }

}
