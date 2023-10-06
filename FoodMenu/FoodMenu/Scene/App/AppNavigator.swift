//
//  AppNavigator.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMain() {
        let tabBar = TabBarController()
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
}
