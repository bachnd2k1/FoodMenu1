//
//  UIButton.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 14/10/2023.
//

import Foundation
import UIKit

extension UIButton {
    func setRoundedFavouriteButton() {
        layer.cornerRadius = self.bounds.height / 2
        clipsToBounds = true
    }
    
    func setRounded(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func setFontSize(size: CGFloat) {
        titleLabel?.font = UIFont.systemFont(ofSize: size)
    }
}
