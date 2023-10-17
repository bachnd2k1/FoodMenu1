//
//  OrderViewModel.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 17/10/2023.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct OrderViewModel {
    let useCase: OrderUseCaseType
    let navigator: OrderNavigatorType
}

extension OrderViewModel: ViewModelType {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        var orders: Driver<[Order]>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()
        let orders = input.load
            .flatMapLatest { _ -> Driver<[Order]> in
                return self.useCase.getOrders()
                    .map { $0.data ?? [] }
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: [])
            }

        return Output(orders: orders)
    }
    
}

