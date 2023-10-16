//
//  PlaceOrder.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 13/10/2023.
//

import Foundation

struct OrderResponse: Codable {
    let status: Int?
    let message: String?
    let data: Order?
    
    init(status: Int = 0, message: String = "", data: Order? = nil) {
        self.status = status
        self.message = message
        self.data = data
    }
    
    private enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
}
