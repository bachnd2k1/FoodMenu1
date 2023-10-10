//
//  FoodRepository.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import Foundation
import Alamofire
import RxSwift

protocol FoodRepository {
    func getFoodByID(input: FoodRequest) -> Observable<FoodListResponse>
}

final class FoodRepositoryImpl: FoodRepository {

    func getFoodByID(input: FoodRequest) -> Observable<FoodListResponse> {
        return APICaller.shared.fetch(input: input)
    }
}
