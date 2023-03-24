//
//  UIImageView+ImageLoader.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import Foundation
import UIKit

extension UIImageView {

    func loadImage(from url: URL) {
        ImageLoader().loadImage(from: url) { [weak self] result in
            if case let .success(image) = result {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }

}
