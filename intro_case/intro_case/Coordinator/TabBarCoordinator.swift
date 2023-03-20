//
//  TabBarCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    // MARK: - Private property
    private let allTab: [TabBarModel] = [.main, .favorite, .cart, .message, .profile]
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
//        let homeNavigationController = UINavigationController()
//        homeNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "mainTabItem"), selectedImage: UIImage(named: "mainSelectedTabItem")!)
//        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
//
//        let favoriteNavigationController = UINavigationController()
//        favoriteNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "favoriteTabItem"), selectedImage: UIImage(named: "favoriteTabItem"))
//        let favoriteCoordinator = FavoriteCoordinator(navigationController: favoriteNavigationController)
//
//        let basketNavigationController = UINavigationController()
//        basketNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "basketTabItem"), selectedImage: UIImage(named: "basketTabItem"))
//        let basketCoordinator = BasketCoordinator(navigationController: basketNavigationController)
//
//        let messageNavigationController = UINavigationController()
//        messageNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "messagesTabItem"), selectedImage: UIImage(named: "messagesTabItem"))
//        let messageCoordinator = MessageCoordinator(navigationController: messageNavigationController)
//
//        let profileNavigationController = UINavigationController()
//        profileNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profileTabItem"), selectedImage: UIImage(named: "profileSelectedTabItem"))
//        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
//
//        tabBarController.viewControllers = [homeNavigationController,
//                                            favoriteNavigationController,
//                                            basketNavigationController,
//                                            messageNavigationController,
//                                            profileNavigationController]
//
//
        tabBarController.viewControllers = getControllers()
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: false)
        
        
//        coordinate(to: homeCoordinator)
//        coordinate(to: favoriteCoordinator)
//        coordinate(to: basketCoordinator)
//        coordinate(to: messageCoordinator)
//        coordinate(to: profileCoordinator)
        
    }
    
    
    func getControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        
        allTab.forEach { tab in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            navigationController.tabBarItem = tabBarItem
           let tabBarCoordinator = getCurrenCoordinator(tab: tab, navigationController: navigationController)
            viewControllers.append(navigationController)
            coordinate(to: tabBarCoordinator)
        }
        

        return viewControllers
    }
    func getCurrenCoordinator (tab: TabBarModel, navigationController: UINavigationController) -> Coordinator {
        switch tab {
        case .main:
            return HomeCoordinator(navigationController: navigationController)
        case .cart:
            return BasketCoordinator(navigationController: navigationController)
        case .profile:
            return ProfileCoordinator(navigationController: navigationController)
            
        case .favorite:
            return FavoriteCoordinator(navigationController: navigationController)
        case .message:
            return MessageCoordinator(navigationController: navigationController)
        }
    }
    
    
}
