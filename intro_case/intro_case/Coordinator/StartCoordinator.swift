//
//  StartCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit


protocol StartFlow: class {
    func coordinateToTabBar()
}

class StartCoordinator: Coordinator, StartFlow {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let startViewController = SignInViewController()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: false)
        
    }
    
    func coordinateToTabBar() {
        
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
}
