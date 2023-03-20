//
//  MainViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    var coordinator: HomeFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *){
            overrideUserInterfaceStyle = .light
        }
        view.backgroundColor = .orange
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
