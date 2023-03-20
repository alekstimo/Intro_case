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
    
    var coordinator: StartFlow?
    
    @IBAction func signinButtonTouched(_ sender: Any) {
        guard let firstName = firstNameTextField.text, let lastName = lastNameTexField.text, let email = emailTextField.text else {
            showAlert(text: "Ошибка", description: "Поля не должны быть пустыми")
            return
        }
        guard isValidEmail(email) else {
            showAlert(text: "Ошибка", description: "Ошибка валидации Email")
            return
        }
        print(firstName + " " + lastName)
        
        coordinator?.coordinateToTabBar()
    }
    @IBAction private func SigninWithGoogleButtonTouched(_ sender: Any) {
        showAlert(text: "Вход", description:"Войти через Google")
    }
    @IBAction private func signinWithAppleButtonTouched(_ sender: Any) {
        showAlert(text: "Вход", description: "Войти через Apple")
    }
    
    @IBAction func loginButtonTouched(_ sender: Any) {
        coordinator?.coordinateToLogIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
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
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._$+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emalPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emalPred.evaluate(with: email)
    }
    private func showAlert(text: String, description: String){
        let alert = UIAlertController(title: text, message: description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
