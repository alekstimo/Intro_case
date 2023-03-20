//
//  MessageCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

class MessageCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let messageViewController = MessageViewController()
        messageViewController.coordinator = self
        
        navigationController?.pushViewController(messageViewController, animated: false)
    }
   
}
