//
//  OrderRequest.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 13/10/2023.
//

import Foundation

struct Request: Codable{
    let name: String?
    init(name: String = "") {
        self.name = name
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}
