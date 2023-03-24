//
//  FlashSaleService.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 24.03.2023.
//

import Foundation
import Combine

public class FlashSaleService{
    
    public static let shared = FlashSaleService()
    private init() {}
    private let apiKey = "a9ceeb6e-416d-4352-bde6-2203416576ac" //"API_KEY"
    private let baseAPIURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetch(completionHandler: @escaping ([FlashSale]) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
              print("Error with the response, unexpected status code: \(String(describing: response))")
            return
          }

          if let data = data,
            let flashSale = try? JSONDecoder().decode(FlashSaleResponseModel.self, from: data) {
              completionHandler(flashSale.flash_sale )
          }
        })
        task.resume()
      }
    
    private func generateURL() -> URL? {
        guard let urlComponents = URLComponents(string: "\(baseAPIURL)") else {
            return nil
        }
        
//        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
//        urlComponents.queryItems = queryItems
        return urlComponents.url
    }

}

