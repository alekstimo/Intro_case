//
//  FlashSaleCollectionViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {

    //MARK: - UIView
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
        let tapRecognaizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        flashSaleImage.isUserInteractionEnabled = true
        flashSaleImage.addGestureRecognizer(tapRecognaizer)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        flashSaleImage.image = nil
    }
    
    @objc func imageTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("toDetail"), object: Any?.self)
    }
    
    //MARK: - Configuration

    private func configure() {
        discountLabel.layer.masksToBounds = true
        discountLabel.layer.cornerRadius = 8
        
        categoryLabel.layer.masksToBounds = true
        categoryLabel.layer.cornerRadius = 10
        flashSaleImage.layer.cornerRadius = 10
        flashSaleImage?.contentMode = .scaleAspectFill
    }
}
