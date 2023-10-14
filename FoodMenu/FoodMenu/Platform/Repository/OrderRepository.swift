//
//  OrderRepository.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 12/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol OrderRepository {
    func orderFood(input: FoodRequest) -> Observable<FoodListResponse>
}

final class OrderRepositoryImpl: OrderRepository {

    func orderFood(input: FoodRequest) -> Observable<FoodListResponse> {
        return APICaller.shared.fetch(input: input)
    }
}
