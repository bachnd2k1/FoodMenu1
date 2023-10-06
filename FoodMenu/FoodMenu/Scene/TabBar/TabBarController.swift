//
//  TabBarController.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 06/10/2023.
//

import UIKit

final class TabBarController: UITabBarController {
    private let favouriteVC = UINavigationController(rootViewController: FavouriteViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    public func config() {
        let homeVC = UINavigationController.setUpHomeController()
        homeVC.tabBarItem.image = UIImage(systemName: L10n.homeIcon)
        favouriteVC.tabBarItem.image = UIImage(systemName: L10n.favoriteIcon)
        homeVC.title = L10n.homeTabTitle
        favouriteVC.title = L10n.favoriteTabTitle
        tabBar.barTintColor = .white
        setViewControllers([homeVC, favouriteVC], animated: true)
    }
}
