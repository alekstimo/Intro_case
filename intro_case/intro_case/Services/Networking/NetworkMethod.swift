//
//  NetworkMethod.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import Foundation

enum NetworkMethod: String {
    
    case get
   
}
extension NetworkMethod {
    
    var method: String {
        rawValue.uppercased()
    }
}
