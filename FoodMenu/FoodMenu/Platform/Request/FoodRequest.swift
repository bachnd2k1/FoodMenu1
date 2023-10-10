//
//  FoodRequest.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import Foundation

final class FoodRequest: BaseRequest {
    required init(keyword: String) {
        super.init(url: Endpoint.APIFoodByCategory + keyword, requestType: .get, parameter: [:])
    }
}
