//
//  OrdersRequest.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 17/10/2023.
//

import Foundation

final class OrdersRequest: BaseRequest {
    required init() {
        super.init(url: Endpoint.APIOrderFood, requestType: .get, parameter: [:])
    }
}
