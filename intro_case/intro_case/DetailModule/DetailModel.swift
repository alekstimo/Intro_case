//
//  DetailModel.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 25.03.2023.
//

import Foundation
import UIKit
import SwiftUI

struct DetailObjectModel {
    // MARK: - Internal Properties
    let name: String
    let description: String
    let rating: String
    let number_of_reviews: String
    let price: Double
    let colors: [String]
    let image_urls: [String]
    
    

        // MARK: - Initialization
    internal init(name: String,description: String, rating: String, number_of_reviews: String, price: Double, colors: [String], image_urls: [String]) {
        self.name = name
        self.description = description
        self.rating = rating
        self.number_of_reviews = number_of_reviews
        self.price = price
        self.colors = colors
        self.image_urls = image_urls
    }
    
    static func createDefault() -> DetailObjectModel {
        .init(name: "Reebok Classic",
              description: "Shoes inspired by 80s running shoes are still relevant today",
              rating: String(4.3),
              number_of_reviews: String(4000),
              price:  24,
              colors: [
                "#ffffff",
                "#b5b5b5",
                "#000000"
              ],
              image_urls: [
                "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg",
                "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a94fbe7d8dfb4d3bbaf9ac63000135ed_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg",
                "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"
              ]
           )
        }
}


final class detailModel {
    
    //MARK: - Events
    
    var didItemsUpdated: (() -> Void)?
    
    //MARK: - Properties
    
    //let detailSe
    var item: DetailObjectModel = .createDefault() {
        didSet {
            didItemsUpdated?()
        }
    }
    
    //MARK: - Methods
    
    func loadPosts()  {
        
        let inputData = inputDetailJSON.data(using: .utf8)
        let decoder = JSONDecoder()
        //decoder.dataDecodingStrategy = .iso8601
        let data = try! decoder.decode(DetailResponseModel.self, from: inputData!)
        item = DetailObjectModel(name: data.name, description: data.description, rating: String( data.rating), number_of_reviews: String(data.number_of_reviews), price:  data.price, colors: data.colors, image_urls: data.image_urls)

        
        }
    
    func reloadData()  {
        loadPosts()
    }
    
}

private func formatter(price: Double) -> String {
    let nPrice = NSNumber(floatLiteral: price)
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 2
    formatter.decimalSeparator = ","
    formatter.groupingSeparator = ""
    formatter.numberStyle = .decimal
    return formatter.string(from: nPrice)!
}
