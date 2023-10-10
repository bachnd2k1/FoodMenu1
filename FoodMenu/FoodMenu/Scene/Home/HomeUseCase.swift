//
//  HomeUseCase.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import Foundation
import RxSwift

protocol HomeUseCaseType {
    func getCategories() -> Observable<CategoryResponse>
}

struct HomeUseCase: HomeUseCaseType {
    func getCategories() -> Observable<CategoryResponse> {
        return CategoryRepositoryImp().fetchCategory(input: CategoryRequest())
    }
}
