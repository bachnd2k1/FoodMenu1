//
//  ItemCategoryCell.swift
//  TestFood
//
//  Created by Bach Nghiem on 09/10/2023.
//

import UIKit
import SDWebImage
import Reusable

final class ItemCategoryCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .lightGray
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = Constant.Space.marginLarge
        layer.shadowOpacity = 0.1
        layer.shadowRadius = Constant.Space.marginLarge
    }
    
    func configCell(category: Category) {
        categoryLabel.text = category.name
        categoryImageView.sd_setImage(with: URL(string: category.image), completed: nil)
    }
}
