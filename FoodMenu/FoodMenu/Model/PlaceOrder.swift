//
//  PlaceOrder.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 13/10/2023.
//

import Foundation

struct PlaceOrder: Codable{
    let status: Int
    let message: String
    let data: Order
}
