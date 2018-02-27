//
//  Contact.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 26/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class Contact: Mappable {
    
    var name = ""
    var email = ""
    var gender = ""
    var contacts = [Contact]()
    
    init(responseJSON:JSON) {
        let contactsJSON = responseJSON.dictionary!["contacts"]?.arrayObject
        contacts = Mapper<Contact>().mapArray(JSONObject: contactsJSON)!
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        gender <- map["gender"]
    }
}

