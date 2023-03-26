//
//  ImageCollectionViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 25.03.2023.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    //MARK: - UIView
    @IBOutlet private weak var productImageView: UIImageView!
    
    
    //MARK: - Property
    var imageUrlInString: String = "" {
        didSet {
                guard let url = URL(string: imageUrlInString) else {
                    return
                }
                productImageView.loadImage(from: url)
            }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.layer.cornerRadius = 10
        productImageView?.contentMode = .scaleAspectFill
    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        productImageView.image = nil
//    }

}
