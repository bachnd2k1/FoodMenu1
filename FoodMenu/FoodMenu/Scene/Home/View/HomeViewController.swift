//
//  ViewController.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 06/10/2023.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController, Bindable {
    var foodCategory = [Category]()
    var popularDishes = [Food]()
    var chefsSpecials = [Food]()
    
    var viewModel: HomeViewModel!
    var categoryResponse: CategoryResponse?
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func bindViewModel() {
        let loadTrigger = Driver.just(())
        let input = HomeViewModel.Input(load: loadTrigger)
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.categoryResponse
            .drive(onNext: { [weak self] category in
                self?.updateUIWithCategories(category)
            })
            .disposed(by: disposeBag)
    }
    
    private func updateUIWithCategories(_ category: CategoryResponse) {
        guard let data = category.data else { return }
        foodCategory = data.categories
        popularDishes = data.populars
        chefsSpecials = data.specials
    }
}

