//
//  Bindable.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 10/10/2023.
//

import Foundation
import UIKit
import RxSwift

public protocol Bindable: AnyObject {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }

    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    public func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}

