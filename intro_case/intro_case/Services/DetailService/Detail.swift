//
//  Detail.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 25.03.2023.
//

import Foundation

struct ImageUrls: Codable {
    let image_url: String
}
struct Colors: Codable{
    let color: String
    
}

struct DetailResponseModel: Codable {
    let name: String
    let description: String
    let rating: Double
    let number_of_reviews: Int
    let price: Double
    let colors: [String]
    let image_urls: [String]
    
    
    init(image_urls: [String],colors: [String],name: String,description: String,rating: Double, number: Int,price: Double) {
        self.image_urls = image_urls
        self.colors = colors
        self.name = name
        self.price = price
        self.description = description
        self.number_of_reviews = number
        self.rating = rating
    }
}
extension DetailResponseModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DetailCodingKeys.self)
        
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decode(String.self, forKey: .description)
        let rating = try container.decode(Double.self, forKey: .rating)
        let number = try container.decode(Int.self, forKey: .number_of_reviews)
        let price = try container.decode(Double.self, forKey: .price)
        
        var colorContainer = try container.nestedUnkeyedContainer(forKey: .colors)
        var colors: [String] = []
        while !colorContainer.isAtEnd {
            let objct = try colorContainer.decode(String.self)
            colors.append(objct)
        }
        var image_urlsContainer = try container.nestedUnkeyedContainer(forKey: .image_urls)
        var image: [String] = []
        while !image_urlsContainer.isAtEnd {
            let objct = try image_urlsContainer.decode(String.self)
            image.append(objct)
        }
      
        
        
        
        self.init(image_urls: image, colors: colors, name: name, description: description, rating: rating, number: number, price: price)
    }
}


enum DetailCodingKeys: String, CodingKey{
    case name
    case description
    case rating
    case number_of_reviews
    case price
    case colors
    case image_urls
    
}
