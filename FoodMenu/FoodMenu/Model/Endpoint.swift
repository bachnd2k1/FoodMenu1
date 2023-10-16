//
//  Endpoint.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import Foundation

struct Endpoint {
    private static let baseUrl = "https://yummie.glitch.me"
    public static let APIFetchAllCategories = baseUrl + "/dish-categories"
    public static let APIFoodByCategory = baseUrl + "/dishes/"
    public static let APIOrderFood = baseUrl + "/orders/"
}
