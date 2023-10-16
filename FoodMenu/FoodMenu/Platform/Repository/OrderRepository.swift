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
    func orderFood(input: OrderRequest) -> Observable<OrderResponse>
}

final class OrderRepositoryImpl: OrderRepository {
    func orderFood(input: OrderRequest) -> Observable<OrderResponse> {
        return APICaller.shared.placeOrder(input: input)
    }
}
