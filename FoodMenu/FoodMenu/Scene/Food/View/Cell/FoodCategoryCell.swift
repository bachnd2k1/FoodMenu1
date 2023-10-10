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

final class FoodCategoryCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var foodImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 20
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        backgroundColor = .systemBackground
    }
    
    func configCell(food: Food) {
        nameLabel.text = food.name
        foodImageView.sd_setImage(with: URL(string: food.image), completed: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
