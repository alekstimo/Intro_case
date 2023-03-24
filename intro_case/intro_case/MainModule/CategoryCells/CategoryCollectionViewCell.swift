//
//  CategoryCollectionViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    //MARK: - UIView
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    
    //MARK: -  Properties
    var title: String = "" {
        didSet {
            categoryLabel.text = title
        }
    }
    
    var categoryImage: UIImage = UIImage(named: "CarsImage")! {
        didSet {
            categoryImageView.image = categoryImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
