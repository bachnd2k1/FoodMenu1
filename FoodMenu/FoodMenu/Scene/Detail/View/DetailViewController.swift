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
            load: Driver.just(())
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.foodImage
            .drive(avatarBinding)
            .disposed(by: disposeBag)
        
        output.foodName
            .drive(nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.description
            .drive(descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.calories
            .drive(caloriesBinding)
            .disposed(by: disposeBag)
    }
}

extension DetailViewController {
    var avatarBinding: Binder<String> {
        return Binder(self) { viewController, imageUrl in
            let url = URL(string: imageUrl)
            viewController.thumnailImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    var caloriesBinding: Binder<Int> {
        return Binder(self) { viewController, calories in
            viewController.caloryLabel.text = String(calories) + " " + L10n.calories
        }
    }
    
    var descriptionBinding: Binder<String> {
        return Binder(self) { viewController, description in
            viewController.descriptionLabel.text = description
        }
    }
}
