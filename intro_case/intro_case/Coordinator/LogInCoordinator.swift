//
//  LogInCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 20.03.2023.
//

import Foundation
import UIKit

protocol LogInFlow: class {
    func coordinateToTabBar()
}

class LogInCoordinator: Coordinator, LogInFlow {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let startViewController = LoginViewController()
        startViewController.coordinator = self
        //startViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(startViewController, animated: true)
        
    }
    
    func coordinateToTabBar() {
        
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
    
}
