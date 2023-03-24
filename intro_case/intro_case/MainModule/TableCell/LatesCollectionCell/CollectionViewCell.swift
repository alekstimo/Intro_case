//
//  CollectionViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var addToCartButton: UIButton!
    
    //MARK: - Properties
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var price: String = "" {
        didSet {
            priceLabel.text = "$ \(price)"
        }
    }
    var category: String = "" {
        didSet {
            categoryLabel.text =  category
        }
    }
    
    var imageUrlInString: String = "" {
        didSet {
                guard let url = URL(string: imageUrlInString) else {
                    return
                }
                productImageView.loadImage(from: url)
//            productImageView.image = resizeImage(image: productImageView.image!, targetSize: CGSize(width: 144, height: 221))
            }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    private func configure() {
        categoryLabel.layer.masksToBounds = true
        categoryLabel.layer.cornerRadius = 5
        addToCartButton.layer.cornerRadius = 10
        productImageView.layer.cornerRadius = 10
        
        
    }
}
