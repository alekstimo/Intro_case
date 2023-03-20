//
//  TabBarModel.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 18.03.2023.
//

import Foundation
import UIKit

enum TabBarModel {
    case main
    case cart
    case profile
    case favorite
    case message
    
    var title: String{
        switch self {
        case .main:
            return ""
        case .favorite:
            return ""
        case .cart:
            return ""
        case .message:
            return ""
        case .profile:
            return ""
        }
    }
    
    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "mainTabItem")
        case .cart:
            return UIImage(named: "basketTabItem")
        case .profile:
            return UIImage(named: "profileTabItem")
        case .favorite:
            return UIImage(named: "favoriteTabItem")
        case .message:
            return UIImage(named: "messagesTabItem")
        }
    }
    var selectedImage: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "mainSelectedTabItem")
        case .cart:
            return UIImage(named: "basketTabItem")
        case .profile:
            return UIImage(named: "profileSelectedTabItem")
        case .favorite:
            return UIImage(named: "favoriteTabItem")
        case .message:
            return UIImage(named: "messagesTabItem")
        }
    }
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size

    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height

    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }

    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
}
