//
//  DetailViewModel.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 12/10/2023.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa
import RxSwiftUtilities

struct DetailViewModel {
    let useCase: DetailUseCaseType
    let navigator: DetailNavigatorType
    let food: Food
}

extension DetailViewModel: ViewModelType {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        let foodName: Driver<String>
        let foodImage: Driver<String>
        let calories: Driver<Int>
        let description: Driver<String>
        var isLoading: Driver<Bool>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let indicator = ActivityIndicator()

        let foodName = input.load
            .map { _ in
                return self.food.name
            }
        
        let foodImage = input.load
            .map { _ in
                return self.food.image
            }
        
        let calories = input.load
            .map { _ in
                return self.food.calories
            }
        
        let description = input.load
            .map { _ in
                return self.food.description
            }
        
        
        return Output(
            foodName: foodName,
            foodImage: foodImage,
            calories: calories,
            description: description,
            isLoading: indicator.asDriver()
        )
    }
}


