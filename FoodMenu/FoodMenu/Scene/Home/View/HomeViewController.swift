//
//  ViewController.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 06/10/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Alamofire

final class HomeViewController: UIViewController, Bindable {
    @IBOutlet private weak var tableView: UITableView!
    var ordersButton: UIBarButtonItem!
    var foodCategory = [Category]()
    var popularDishes = [Food]()
    var chefsSpecials = [Food]()
    var viewModel: HomeViewModel!
    var categoryResponse: CategoryResponse?
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.nameApp
        view.backgroundColor = .white
        tableView.do {
            $0.register(cellType: CategoryCell.self)
            $0.register(cellType: FoodsCell.self)
            $0.dataSource = self
            $0.delegate = self
            $0.separatorStyle = .none
        }
        ordersButton = UIBarButtonItem(image: UIImage(systemName: L10n.imageOrder), style: .plain, target: self, action: nil)
        ordersButton.tintColor = .systemRed
        navigationItem.rightBarButtonItem = ordersButton
    }
    
    func bindViewModel() {
        let loadTrigger = Driver.just(())
        let input = HomeViewModel.Input(
            load: loadTrigger,
            openTrigger: ordersButton.rx.tap.asDriver()
        )
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
        tableView.reloadData()
    }
    
    @objc func buttonTapped(){
        let viewController = OrderViewController()
        let useCase = OrderUseCase()
        let navigator = OrderNavigator()
        let viewModel = OrderViewModel(useCase: useCase,
                                       navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch indexPath.section {
        case 0: return categoryCell(tableView,indexPath: indexPath)
        case 1,2: return foodCell(tableView,indexPath: indexPath)
        default: return UITableViewCell()
        }
    }
    
    private func categoryCell(
        _ tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CategoryCell.self)
        cell.updateCellWith(categories: foodCategory)
        cell.delegate = self
        return cell
    }
    
    private func foodCell(
        _ tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FoodsCell.self)
        let sectionTitle = indexPath.section == 1 ? L10n.popular: L10n.special
        let _ = indexPath.section == 1 ? cell.updateCellWith(foods: popularDishes) : cell.updateCellWith(foods: chefsSpecials)
        let _ =  cell.setSectionTitle(sectionTitle: sectionTitle)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return Constant.Space.categoryHeight
        case 1,2: return Constant.Space.foodHeight
        default: return Constant.Space.foodHeight
        }
    }
}

extension HomeViewController: CategoryCellDelegate {
    func clickItem(category: Category) {
        let viewController = FoodViewController()
        let useCase = FoodUseCase()
        let navigator = FoodNavigator(navigationController: UINavigationController(rootViewController: viewController))
        let viewModel = FoodViewModel(useCase: useCase,
                                      navigator: navigator,
                                      category: category)
        viewController.bindViewModel(to: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

