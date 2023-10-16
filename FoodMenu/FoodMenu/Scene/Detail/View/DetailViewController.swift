//
//  DetailViewController.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 12/10/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Alamofire
import Then

final class DetailViewController: UIViewController, Bindable {
    @IBOutlet private weak var favouriteButton: UIButton!
    @IBOutlet private weak var orderButton: UIButton!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var caloryLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var thumnailImageView: UIImageView!
    
    var viewModel: DetailViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        title = L10n.detailFood
        favouriteButton.setRoundedFavouriteButton()
        orderButton.then {
            $0.setRounded(radius: Constant.Space.normalRadius)
            $0.setFontSize(size: Constant.Space.textSizeNormal)
        }
    }
    
    func bindViewModel() {
        let input = DetailViewModel.Input (
            load: Driver.just(()),
            name: nameTextField.rx.text.orEmpty.asDriver(),
            orderTrigger: orderButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.order.drive(onNext: { [weak self] food in
            self?.then { viewController in
                viewController.showAlert(title: L10n.thanks, message: L10n.orderSuccess, buttonTitle: L10n.ok)
                viewController.nameTextField.text = ""
            }
        })
        .disposed(by: disposeBag)
        
        output.food
            .drive(foodBinding)
            .disposed(by: disposeBag)
    }
}

extension DetailViewController {
    var foodBinding: Binder<Food> {
        return Binder(self) { viewController, food in
            let url = URL(string: food.image)
            viewController.then {
                $0.thumnailImageView.sd_setImage(with: url, completed: nil)
                $0.caloryLabel.text = String(food.calories) + " " + L10n.calories
                $0.descriptionLabel.text = food.description
                $0.nameLabel.text = food.name
            }
        }
    }
}
