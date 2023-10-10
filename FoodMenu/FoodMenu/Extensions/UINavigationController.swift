//
//  UINavigationController.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import UIKit
import Foundation

extension UINavigationController {
    static func setUpHomeController() -> UINavigationController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let viewModel = HomeViewModel(useCase: useCase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        return UINavigationController(rootViewController: viewController)
    }
}
