//
//  FlashSaleCollectionViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var flashSaleImage: UIImageView!
    
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
            categoryLabel.text = category
        }
    }
    var imageUrlInString: String = "" {
        didSet {
                guard let url = URL(string: imageUrlInString) else {
                    return
                }
            flashSaleImage.loadImage(from: url)
//            flashSaleImage.image = resizeImage(image: flashSaleImage.image!, targetSize: CGSize(width: 114, height: 149))
            }
    }
    var discount: String = "" {
        didSet {
            discountLabel.text = "\(discount)% off"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    private func configure() {
        discountLabel.layer.masksToBounds = true
        discountLabel.layer.cornerRadius = 10
        
        categoryLabel.layer.masksToBounds = true
        categoryLabel.layer.cornerRadius = 10
        flashSaleImage.layer.cornerRadius = 10
    }
}
