//
//  FlashSale.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 24.03.2023.
//


import Foundation

struct FlashSale: Codable{
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let image_url: String
    
}

struct FlashSaleResponseModel: Codable {
    let flash_sale: [FlashSale]
    
    init(flash_sale: [FlashSale]) {
        self.flash_sale = flash_sale
    }
}
extension FlashSaleResponseModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopCodingKeys.self)
        
        var latestContaner = try container.nestedUnkeyedContainer(forKey: .flash_sale)
        var flash_sale: [FlashSale] = []
        while !latestContaner.isAtEnd {
            let objct = try latestContaner.decode(FlashSale.self)
            flash_sale.append(objct)
        }
        self.init(flash_sale: flash_sale)
    }
}



//struct FlashSaleResponse: Decodable {
////    public let page: Int
////    public let totalResults: Int
////    public let totalPages: Int
//    let flash_sale: [FlashSale]
//}
//
//struct FlashSale {
//
//    let category: String
//    let name: String
//    let price: Double
//    let discount: Int
//    let image_url: String
//
//    enum CodingKeys: String, CodingKey {
//        case category
//        case name
//        case price
//        case discount
//        case image_url
//    }
//
//}
//extension FlashSale: Codable {}
//extension FlashSale: Equatable {}
////extension FlashSale: Identifiable {}
//
//extension FlashSale {
//
//    static var previewData: [FlashSale] {
//        let previewDataURL = Bundle.main.url(forResource: "flash_sale", withExtension: "json")!
//        let data = try! Data(contentsOf: previewDataURL)
//
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.dateDecodingStrategy = .iso8601
//
//        let apiResponse = try! jsonDecoder.decode(FlashSaleResponse.self, from: data)
//        return apiResponse.flash_sale
//    }
//
//}

