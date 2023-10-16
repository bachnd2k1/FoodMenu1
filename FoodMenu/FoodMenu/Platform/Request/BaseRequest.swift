//
//  BaseRequest.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import Foundation
import Alamofire
import RxSwift

class BaseRequest: NSObject {

    var url = ""
    var requestType = Alamofire.HTTPMethod.get
    var parameter: [String: Any]?
    var request = Request()

    init(url: String) {
        super.init()
        self.url = url
    }

    init(url: String, requestType: Alamofire.HTTPMethod) {
        super.init()
        self.url = url
        self.requestType = requestType
    }

    init(url: String, requestType: Alamofire.HTTPMethod, request: Request) {
        super.init()
        self.url = url
        self.requestType = requestType
        self.request = request
    }
    
    init(url: String, requestType: Alamofire.HTTPMethod, parameter: [String: Any]?) {
        super.init()
        self.url = url
        self.requestType = requestType
        self.parameter = parameter
    }

    
    var encoding: ParameterEncoding {
        switch requestType {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
