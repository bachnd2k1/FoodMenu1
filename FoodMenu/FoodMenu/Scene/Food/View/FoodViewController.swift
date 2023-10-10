//
//  FoodViewController.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import Reusable
import Then

final class FoodViewController: UIViewController, Bindable {    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: FoodViewModel!
    var foods = [Food]()
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.foodCategory
        view.backgroundColor = .white
        let tableView = UITableView().then {
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.register(cellType: FoodCategoryCell.self)
        }
    }
    
    func bindViewModel() {
        let loadTrigger = Driver.just(())
        let input = FoodViewModel.Input(load: loadTrigger)
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.foodResponse
            .drive(onNext: { [weak self] food in
                self?.updateUIWithCategories(food)
            })
            .disposed(by: disposeBag)
        
    }
    
    private func updateUIWithCategories(_ foodResponse: FoodListResponse) {
        guard let data = foodResponse.data else { return }
        self.foods  = data
        tableView.reloadData()
    }
}

extension FoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FoodCategoryCell.self)
        cell.configCell(food: foods[indexPath.row])
        return cell
    }
}
