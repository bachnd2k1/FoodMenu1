//
//  OrderViewController.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 17/10/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Alamofire

final class OrderViewController: UIViewController, Bindable {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: OrderViewModel!
    private let disposeBag = DisposeBag()
    private var orders = [Order]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = L10n.orderFood
        tableView.do {
            $0.register(cellType: FoodCategoryCell.self)
            $0.dataSource = self
            $0.separatorStyle = .none
        }
    }
    
    func bindViewModel() {
        let input = OrderViewModel.Input(
            load: Driver.just(())
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.orders.drive(tableView.rx.items) { table, row, order in
            let indexPath = IndexPath(row: row, section: 0)
            let cell: FoodCategoryCell = table.dequeueReusableCell(for: indexPath)
            cell.configCell(food: order.dish)
            return cell
        }
        .disposed(by: disposeBag)
    }
    
    private func updateUIWithOrders(_ orderResponse: OrdersResponse) {
        guard let data = orderResponse.data else { return }
        tableView.reloadData()
    }
}

extension OrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FoodCategoryCell.self)
        let order = orders[indexPath.row]
        cell.configCell(food: order.dish)
        return cell
    }
}
