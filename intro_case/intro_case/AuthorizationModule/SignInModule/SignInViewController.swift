//
//  SignInViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 15.03.2023.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTexField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var signinButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet weak var signInWithAppleButton: UIButton!
    @IBOutlet weak var signinWithGoogleButton: UIButton!
    @IBAction func signinButtonTouched(_ sender: Any) {
    }
    @IBAction private func SigninWithGoogleButtonTouched(_ sender: Any) {
    }
    @IBAction private func signinWithAppleButtonTouched(_ sender: Any) {
    }
    
    @IBAction func loginButtonTouched(_ sender: Any) {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let vc = LoginViewController()
        appDelegate.window?.rootViewController = vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }

    private func configure() {
        firstNameTextField.clipsToBounds = true
        firstNameTextField.layer.cornerRadius = 12
        lastNameTexField.clipsToBounds = true
        lastNameTexField.layer.cornerRadius = 12
        emailTextField.clipsToBounds = true
        emailTextField.layer.cornerRadius = 12
        
        firstNameTextField.borderStyle = .none
        lastNameTexField.borderStyle = .none
        emailTextField.borderStyle = .none
        
        firstNameTextField.attributedPlaceholder = NSAttributedString(
            string: "First name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "textFieldColorText") ?? .black]
        )
        lastNameTexField.attributedPlaceholder = NSAttributedString(
            string: "Last name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "textFieldColorText") ?? .black]
        )
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "textFieldColorText") ?? .black]
        )
        
        
        
//        guard let montserratForSignInButton = UIFont(name: "Montserrat-SemiBold", size: 20) else {
//            fatalError("""
//                Failed to load the "Montserrat" font.
//                Make sure the font file is included in the project and the font name is spelled correctly.
//                """
//            )
//        }
//        guard let montserratForLogInButton = UIFont(name: "Montserrat", size: 12) else {
//            fatalError("""
//                Failed to load the "Montserrat" font.
//                Make sure the font file is included in the project and the font name is spelled correctly.
//                """
//            )
//        }
//
////        signinButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: montserratForSignInButton)
//        signinButton.titleLabel?.font = montserratForSignInButton
        //signinButton.titleLabel?.adjustsFontForContentSizeCategory = true
        signinButton.layer.cornerRadius = 15
        
        
//        loginButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: montserratForLogInButton)
//        loginButton.titleLabel?.adjustsFontForContentSizeCategory = true
//        
//        
//        signInWithAppleButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: montserratForLogInButton)
//        signInWithAppleButton.titleLabel?.adjustsFontForContentSizeCategory = true
//        
//        signinWithGoogleButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: montserratForLogInButton)
//        signinWithGoogleButton.titleLabel?.adjustsFontForContentSizeCategory = true
//        
    }
    

}
