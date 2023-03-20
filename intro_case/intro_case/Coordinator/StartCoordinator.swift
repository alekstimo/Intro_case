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
    func coordinateToLogIn()
}

class StartCoordinator: Coordinator, StartFlow {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let startViewController = SignInViewController()
        startViewController.coordinator = self
        navigationController.setViewControllers([startViewController], animated: false)
       // navigationController.pushViewController(startViewController, animated: false)
        
    }
    
    func coordinateToTabBar() {
        
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
    func coordinateToLogIn() {
        let logInCoordinator = LogInCoordinator(navigationController: navigationController)
        coordinate(to: logInCoordinator)
    }
    
}
