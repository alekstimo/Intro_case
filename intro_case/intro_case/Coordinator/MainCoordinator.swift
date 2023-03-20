//
//  MainCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
      
        self.window = window
        
    }
    
    func start() {
       
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
    
}
