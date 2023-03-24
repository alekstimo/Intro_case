//
//  FlashSaleModel.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import Foundation
import UIKit
import SwiftUI



struct FlashSaleObjectModel {
    // MARK: - Internal Properties
        let imageUrlInString: String
        let name: String
        let price: String
        let category: String
        let discount: String

    

        // MARK: - Initialization
    internal init(imageUrlInString: String, name: String,category: String, price: Double,discount: Int) {
            self.imageUrlInString = imageUrlInString
            self.name = name
            self.price = String(price)
            self.category = category
            self.discount = String(discount)
    }
    
    static func createDefault() -> FlashSaleObjectModel {
        .init(
            imageUrlInString: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg",
            name: "New Balance Sneakers",
            category: "Phones",
            price: 22.5,
            discount: 30
           )
        }
    
}


final class FlashSaleModel {
    
    //MARK: - Events
    
    var didItemsUpdated: (() -> Void)?
    
    //MARK: - Properties
    
    let flashSaleService = FlashSaleService.shared
    var items =  [FlashSaleObjectModel]() {
        didSet {
            didItemsUpdated?()
        }
    }
    
    //MARK: - Methods
    func loadPosts()   {
        let inputData = inputFlashSaleJSON.data(using: .utf8)
        let decoder = JSONDecoder()
        //decoder.dataDecodingStrategy = .iso8601
        let data = try! decoder.decode(FlashSaleResponseModel.self, from: inputData!)
        let flash_sale = data.flash_sale
        
        flash_sale.forEach { item in
            items.append(FlashSaleObjectModel(imageUrlInString: item.image_url, name: item.name, category: item.category, price: item.price, discount: item.discount))
        }
        
    }
        
//        flashSaleService.fetch{ [weak self] (posts) in
//            self?.items = posts.map { flashSaleModel in
//                        FlashSaleObjectModel(imageUrlInString: flashSaleModel.image_url,
//                                                         name: flashSaleModel.name,
//                                                         category: flashSaleModel.category,
//                                                         price: flashSaleModel.price,
//                                                         discount: flashSaleModel.discount)
//                                }
//            }
//        }
//                self.items = flashsale.map { flashSaleModel in
//                    FlashSaleObjectModel(imageUrlInString: flashSaleModel.image_url,
//                                         name: flashSaleModel.name,
//                                         category: flashSaleModel.category,
//                                         price: flashSaleModel.price,
//                                         discount: flashSaleModel.discount)
//                }

//            } catch {
//
//                print(error.localizedDescription)
//
//            }
       // }
    
    
    
    func reloadData()  {
        loadPosts()
    }
    
}

