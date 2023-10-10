//
//  FoodListResponse.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import Foundation

struct FoodListResponse: Codable{
    let status: Int?
    let message: String?
    let data: [Food]?
    init(status: Int? = nil, message: String? = nil,  data: [Food]?) {
        self.status = status
        self.message = message
        self.data = data
    }
    
    static func getDefaultItem() -> FoodListResponse {
        return FoodListResponse(status: nil, message: "", data: nil)
    }
}
