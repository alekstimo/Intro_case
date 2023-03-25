//
//  LatestResponseModel.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import Foundation
struct Latest: Codable{
    let category: String
    let name: String
    let price: Double
    let image_url: String
    
}

struct LatestResponseModel: Codable {
    let latest: [Latest]
    
    init(latest: [Latest]) {
        self.latest = latest
    }
}
extension LatestResponseModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopCodingKeys.self)
        
        var latestContaner = try container.nestedUnkeyedContainer(forKey: .latest)
        var latest: [Latest] = []
        while !latestContaner.isAtEnd {
            let objct = try latestContaner.decode(Latest.self)
            latest.append(objct)
        }
        self.init(latest: latest)
    }
}
enum TopCodingKeys: String, CodingKey{
    case latest
    case flash_sale
    
}
