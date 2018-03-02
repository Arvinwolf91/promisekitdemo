//
//  Constant.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 26/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit

enum Request {
    case getAlexGrayRepos
    case getArvinWolf91Repos
    
    var Endpoint: String {
        switch self {
        case .getAlexGrayRepos:
            return "https://api.github.com/users/mralexgray/repos"
        case .getArvinWolf91Repos:
            return "https://api.github.com/users/arvinwolf91/repos"
        }
    }
}

