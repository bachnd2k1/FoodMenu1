//
//  FoodViewModel.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct FoodViewModel {
    let useCase: FoodUseCaseType
    let navigator: FoodNavigatorType
    let category: Category
}

extension FoodViewModel: ViewModelType {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        var foodResponse: Driver<FoodListResponse>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()
        let id = category.id
        let food = input.load
            .flatMapLatest { _ -> Driver<FoodListResponse> in
                return Observable.just(id)
                    .flatMapLatest { id -> Observable<FoodListResponse> in
                        let request = FoodRequest(keyword: id)
                        return self.useCase.getFoodByID(input: request)
                            .trackActivity(indicator)
                            .asObservable()
                    }
                    .asDriver(onErrorJustReturn: FoodListResponse.getDefaultItem())
            }
        
        return Output(foodResponse: food)
    }
    
}
