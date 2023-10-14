//
//  FoodNavigator.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol FoodNavigatorType {
    func toDetailFood(food: Food)
}

struct FoodNavigator: FoodNavigatorType {
    unowned let navigationController: UINavigationController
    func toDetailFood(food: Food)  {
        let viewController = DetailViewController()
        let useCase = DetailUseCase()
        let navigator = DetailNavigator()
        let viewModel = DetailViewModel(useCase: useCase,
                                      navigator: navigator,
                                      food: food)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
