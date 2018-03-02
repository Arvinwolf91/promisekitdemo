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


class APIService {
    
    class func request(request:Request) -> Promise<BaseResponse> {
        
        return Promise { fulfill, reject in
            
            Alamofire.request(request.Endpoint).responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let responseJSON = JSON(value)
                    
                    let baseResponse = BaseResponse(responseJSON: responseJSON, request:request)
                    fulfill(baseResponse)
                    
                case .failure(let error):
                    reject(error)
                }
            }
        }
    }
}
