//
//  LatestModel.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//


import Foundation
import UIKit
import SwiftUI

struct LatestObjectModel {
    // MARK: - Internal Properties
        let imageUrlInString: String
        let name: String
        let price: String
        let categoty: String
    
    

        // MARK: - Initialization
    internal init(imageUrlInString: String, name: String,category: String, price: String) {
            self.imageUrlInString = imageUrlInString
            self.name = name
            self.price = price
            self.categoty = category
    }
    
    static func createDefault() -> LatestObjectModel {
        .init(
            imageUrlInString: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg",
            name: "Samsung S10",
            category: "Phones",
            price:  "1000"
           )
        }
    
}


final class latestModel {
    
    //MARK: - Events
    
    var didItemsUpdated: (() -> Void)?
    
    //MARK: - Properties
    
    let latestService = LatestService()
    var items: [LatestObjectModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    //MARK: - Methods
    
    func loadPosts()  {
        
        let inputData = inputLatestJSON.data(using: .utf8)
        let decoder = JSONDecoder()
        //decoder.dataDecodingStrategy = .iso8601
        let data = try! decoder.decode(LatestResponseModel.self, from: inputData!)
        let latest = data.latest
        //print(latest)
        latest.forEach { item in
           // print(item)
            items.append(LatestObjectModel(imageUrlInString: item.image_url, name: item.name, category: item.category, price: formatter(price: item.price) ))
        }
//        items = latest.map { item in LatestObjectModel(imageUrlInString: item.image_url, name: item.name, category: item.category, price: item.price)
       // }
        
//        latestService.loadLatest { [weak self] result in
//                switch result {
//                case .success(let objects):
//                    self?.items = objects.map { latestModel in
//                        LatestObjectModel(imageUrlInString: latestModel.image_url,
//                                          name: latestModel.name, category: latestModel.category, price: latestModel.price
//                        )
//                    }
//
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    break
//
//                    // TODO: - Implement error state there
//
//                }
//            }
        
        }
    
    func reloadData()  {
        loadPosts()
    }
    
}

private func formatter(price: Double) -> String {
    let nPrice = NSNumber(floatLiteral: price)
    let formatter = NumberFormatter()
    formatter.groupingSeparator = ","
    formatter.numberStyle = .decimal
    return formatter.string(from: nPrice)!
}
