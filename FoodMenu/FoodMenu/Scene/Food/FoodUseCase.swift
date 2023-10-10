//
//  FoodUseCase.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import Foundation
import RxSwift

protocol FoodUseCaseType {
    func getFoodByID(input: FoodRequest) -> Observable<FoodListResponse>
}

struct FoodUseCase: FoodUseCaseType {
    func getFoodByID(input: FoodRequest) -> Observable<FoodListResponse> {
        return FoodRepositoryImpl().getFoodByID(input: input)
    }
}
