//
//  UIViewController .swift
//  FoodMenu
//
//  Created by Bach Nghiem on 16/10/2023.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, buttonTitle: String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .default)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true)
    }
}
