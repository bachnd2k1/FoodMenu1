//
//  OrderUseCase.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 17/10/2023.
//

import Foundation
import RxSwift

protocol OrderUseCaseType {
    func getOrders() -> Observable<OrdersResponse>
}

struct OrderUseCase: OrderUseCaseType {
    func getOrders() -> Observable<OrdersResponse> {
        return OrdersRepositoryImpl().getOrders(input: OrdersRequest())
    }
}
