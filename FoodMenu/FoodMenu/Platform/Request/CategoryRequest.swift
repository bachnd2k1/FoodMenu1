//
//  CategoryRequest.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import Foundation

final class CategoryRequest: BaseRequest {
    required init() {
        super.init(url: Endpoint.APIFetchAllCategories,
                   requestType: .get,
                   parameter: [:])
    }
}
