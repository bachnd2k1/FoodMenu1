//
//  HomeNavigator.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import UIKit
import Foundation

protocol HomeNavigatorType {
    func toListFood(category: Category)
}

struct HomeNavigator: HomeNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toListFood(category: Category) {
        let viewController = FoodViewController()
        let useCase = FoodUseCase()
        let navigator = FoodNavigator(navigationController: navigationController)
        let viewModel = FoodViewModel(useCase: useCase,
                                      navigator: navigator,
                                      category: category)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
