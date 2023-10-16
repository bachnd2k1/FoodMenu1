//
//  Order.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 13/10/2023.
//

import Foundation

struct Order: Codable{
    let id: String
    let name: String
    let dish: Food
}
