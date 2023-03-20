//
//  FavoriteCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

protocol FavoriteFlow: class {
    func coordinateToDetail()
    //Поиск и пр
}

class FavoriteCoordinator: Coordinator, FavoriteFlow {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let favoriteViewController = FavoriteViewController()
        favoriteViewController.coordinator = self
        
        navigationController?.pushViewController(favoriteViewController, animated: false)
    }
    //MARK: - Flow Methods
    func coordinateToDetail() {
//        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
//        coordinate(to: detailCoordinator)
    }
}
