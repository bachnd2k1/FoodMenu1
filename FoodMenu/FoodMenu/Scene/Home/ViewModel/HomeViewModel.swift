//
//  HomeViewModel.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct HomeViewModel {
    let useCase: HomeUseCaseType
    let navigator: HomeNavigatorType
}

extension HomeViewModel: ViewModelType {
    struct Input {
        let load: Driver<Void>
        let openTrigger: Driver<Void>
    }
    
    struct Output {
        var categoryResponse: Driver<CategoryResponse>
        var isLoading: Driver<Bool>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()
        
        input.openTrigger
            .drive(onNext: { _ in
                self.navigator.toOrderFood()
            })
            .disposed(by: disposeBag)
        
        let category = input.load
            .flatMapLatest { _ -> Driver<CategoryResponse> in
                return self.useCase.getCategories()
                    .trackActivity(indicator)
                    .asDriver(onErrorJustReturn: CategoryResponse())
            }
        return Output(categoryResponse: category, isLoading: indicator.asDriver())
    }
}

