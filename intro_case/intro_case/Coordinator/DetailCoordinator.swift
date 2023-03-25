//
//  DetailCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 25.03.2023.
//

import Foundation
import UIKit

class DetailCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let detailViewController = DetailViewController()
        detailViewController.coordinator = self
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
   
}
