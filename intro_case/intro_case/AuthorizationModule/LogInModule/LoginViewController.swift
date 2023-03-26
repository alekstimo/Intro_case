//
//  LoginViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 15.03.2023.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    //MARK: UIView
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
   
    
    var coordinator: LogInFlow?
    var usersStorage = UserSettings.shared
    
    //MARK: show Password Button Touch Up inside
    @IBAction func showPasswordButtonTouchUp(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    
    @IBAction func logInButtonTouched(_ sender: Any) {
        guard firstNameTextField.text != "",passwordTextField.text != "" else {
            showAlert(text: "Ошибка", description: "Поля не должны быть пустыми")
            return
        }
        let firstName = firstNameTextField.text!
        let password = passwordTextField.text!
        guard usersStorage.isKeyPresentInUserDefaults(key: firstName) else {
            showAlert(text: "Ошибка", description: "Пользователя с таким именем не существует")
            return
        }
        let checkPassword = usersStorage.getPasswordFromStoredItems(key: firstName)
        guard checkPassword == password else {
            showAlert(text: "Ошибка", description: "Неверный логин или пароль")
            return
        }
        currentUser = usersStorage.getFullNameFromStoredItems(key: firstName)
        //print(firstName + " " + password)
        coordinator?.coordinateToTabBar()
    }
    
    private func showAlert(text: String, description: String){
        let alert = UIAlertController(title: text, message: description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: Configuration
    private func configure() {
        
        firstNameTextField.clipsToBounds = true
        firstNameTextField.layer.cornerRadius = 12
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.cornerRadius = 12
        
        firstNameTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
        firstNameTextField.attributedPlaceholder = NSAttributedString(
            string: "First name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "textFieldColorText") ?? .black]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "textFieldColorText") ?? .black]
        )
        
        passwordTextField.isSecureTextEntry = true
        
        let backButton = UIBarButtonItem(image: resizeImage(image: UIImage(named: "backArrow")!, targetSize: CGSize.init(width: 32, height: 32)),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
//        guard let montserrat = UIFont(name: "Montserrat-SemiBold", size: UIFont.labelFontSize) else {
//            fatalError("""
//                Failed to load the "Montserrat" font.
//                Make sure the font file is included in the project and the font name is spelled correctly.
//                """
//            )
//        }
//        loginButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: montserrat)
//        loginButton.titleLabel?.adjustsFontForContentSizeCategory = true
        loginButton.layer.cornerRadius = 15
        
    }
    
    
   

}
