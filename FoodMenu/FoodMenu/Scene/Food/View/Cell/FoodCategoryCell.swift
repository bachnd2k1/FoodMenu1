//
//  FoodCategoryCell.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import UIKit
import SDWebImage
import RxCocoa
import RxSwift
import Reusable
import Then


final class FoodCategoryCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var foodImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    func config() {
        backgroundColor = .systemBackground
        let _ = CALayer().then {
            $0.shadowColor = UIColor.black.cgColor
            $0.shadowOffset = .zero
            $0.cornerRadius = Constant.Space.largeRadius
            $0.shadowOpacity = 0.1
            $0.shadowRadius = Constant.Space.marginLarge
        }
    }
    
    func configCell(food: Food) {
        nameLabel.text = food.name
        foodImageView.sd_setImage(with: URL(string: food.image), completed: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
