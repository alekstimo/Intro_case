//
//  ProfileCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        
        navigationController?.pushViewController(profileViewController, animated: false)
    }
   
}
