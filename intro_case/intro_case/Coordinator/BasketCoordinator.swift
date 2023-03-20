//
//  BasketCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

protocol BasketFlow: class {
    func coordinateToDetail()
    //Поиск и пр
}

class BasketCoordinator: Coordinator, BasketFlow {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let basketViewController = BasketViewController()
        basketViewController.coordinator = self
        
        navigationController?.pushViewController(basketViewController, animated: false)
    }
    //MARK: - Flow Methods
    func coordinateToDetail() {
//        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
//        coordinate(to: detailCoordinator)
    }
}
