//
//  FoodsCell.swift
//  FoodMenu
//
//  Created by Bach Nghiem on 11/10/2023.
//

import UIKit
import Reusable

class FoodsCell: UITableViewCell, NibReusable {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var subcategoryLabel: UILabel!
    
    var foods = [Food]()
    override func awakeFromNib() {
        super.awakeFromNib()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: Constant.Space.widthFoodCategory, height: Constant.Space.heightFoodCategory)
        flowLayout.minimumLineSpacing = Constant.Space.marginLarge
        flowLayout.minimumInteritemSpacing = Constant.Space.marginLarge
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: ItemFoodCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCellWith(foods: [Food]) {
        self.foods = foods
        self.collectionView.reloadData()
    }
    
    func setSectionTitle(sectionTitle: String) {
        subcategoryLabel.text = sectionTitle
    }
}

extension FoodsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ItemFoodCell.self)
        cell.configCell(food: foods[indexPath.item])
        return cell
    }
}

extension FoodsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constant.Space.marginZero, left: Constant.Space.marginMedium, bottom: Constant.Space.marginZero, right: Constant.Space.marginMedium)
    }
}

