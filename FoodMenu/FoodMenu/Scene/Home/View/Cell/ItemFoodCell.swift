//
//  CollectionViewCell.swift
//  TestFood
//
//  Created by Bach Nghiem on 09/10/2023.
//

import UIKit
import Reusable
import SDWebImage

final class ItemFoodCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var foodImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(food: Food) {
        nameLabel.text = food.name
        foodImageView.sd_setImage(with: URL(string: food.image), completed: nil)
    }
}
