//
//  AppDelegate.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 15.03.2023.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?

    
//
//    var tokenStorage: TokenStorage {
//        BaseTokenStorage()
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let viewController = SignInViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        //startApplicationProccess()
        return true
    }
    
    func startApplicationProccess() {
        
       // runLaunchScreen()
        //gotoSingUp()
        goToMain()
        
    }
//    func runLaunchScreen() {
//        let launchScreenViewController = UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()
//        window?.rootViewController = launchScreenViewController
//    }
    
    func goToMain(){
      
    
    }

    


}





