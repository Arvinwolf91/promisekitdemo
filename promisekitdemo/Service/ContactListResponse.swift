//
//  ContactListResponse.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 26/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

struct ContactListResponse {
    var contacts = [Contact]()
    
    init(responseJSON:JSON) {
        let contactsJSON = responseJSON.dictionary!["contacts"]?.arrayValue
        
        for (_,contact) in (contactsJSON?.enumerated())! {
            contacts.append(Contact(name: contact["name"].stringValue,
                              email: contact["email"].stringValue,
                              gender: contact["gender"].stringValue))
        }
    }
}

struct Contact {
    var name:String
    var email:String
    var gender:String
}
