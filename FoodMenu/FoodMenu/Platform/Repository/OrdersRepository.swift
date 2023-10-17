//
//  OrdersRepository.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 17/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol OrdersRepository {
    func getOrders(input: OrdersRequest) -> Observable<OrdersResponse>
}

final class OrdersRepositoryImpl: OrdersRepository {
    func getOrders(input: OrdersRequest) -> Observable<OrdersResponse> {
        return APICaller.shared.fetch(input: input)
    }
}
