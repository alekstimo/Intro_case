//
//  ProfileCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

protocol ProfileFlow: class {
    func coordinateToSignIn()
}
class ProfileCoordinator: Coordinator, ProfileFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        
        navigationController?.pushViewController(profileViewController, animated: false)
    }
    
    func coordinateToSignIn() {
        
        let signInCoordinator = StartCoordinator(navigationController: navigationController!)
        coordinate(to: signInCoordinator)
    }
   
}
