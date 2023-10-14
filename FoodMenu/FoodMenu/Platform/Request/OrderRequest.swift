//
//  OrderRequest.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 12/10/2023.
//

import Foundation

final class OrderRequest: BaseRequest {
    required init(keyword: String) {
        super.init(url: Endpoint.APIFoodByCategory + keyword, requestType: .get, parameter: [:])
    }
}
