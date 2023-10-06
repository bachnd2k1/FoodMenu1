//
//  CategoryRepository.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol CategoryRepository {
    func fetchCategory(input: CategoryRequest) -> Observable<CategoryResponse>
}

final class CategoryRepositoryImp: CategoryRepository {

    func fetchCategory(input: CategoryRequest) -> Observable<CategoryResponse> {
        return APICaller.shared.fetch(input: input)
    }
}
