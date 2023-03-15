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
   
    //MARK: show Password Button Touch Up inside
    @IBAction func showPasswordButtonTouchUp(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
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
