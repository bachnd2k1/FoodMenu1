//
//  DetailUseCase.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 12/10/2023.
//

import Foundation
import RxSwift

protocol DetailUseCaseType {
    func placeOrder(input: OrderRequest) -> Observable<OrderResponse>
}

struct DetailUseCase: DetailUseCaseType {
    func placeOrder(input: OrderRequest) -> Observable<OrderResponse> {
        return OrderRepositoryImpl().orderFood(input: input)
    }
}


