//
//  Order.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 13/10/2023.
//

import Foundation

struct Order: Codable, Equatable, Hashable {
    let id: String
    let name: String
    let dish: Food
    
    static func == (lhs: Order, rhs: Order) -> Bool {
        return lhs.dish.id == rhs.dish.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
