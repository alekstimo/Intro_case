//
//  SignInViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 15.03.2023.
//

import UIKit

class SignInViewController: UIViewController {

    //MARK: - UIView
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTexField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var signinButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet weak var signInWithAppleButton: UIButton!
    @IBOutlet weak var signinWithGoogleButton: UIButton!
    
    var coordinator: StartFlow?
    var usersStorage = UserSettings.shared
    
    //MARK: - Sign in button events
    @IBAction func signinButtonTouched(_ sender: Any) {
        guard firstNameTextField.text != "", lastNameTexField.text  != "" , emailTextField.text  != "" else {
            showAlert(text: "Ошибка", description: "Поля не должны быть пустыми")
            return
        }
        let firstName = firstNameTextField.text!
        let lastName = lastNameTexField.text!
        let email = emailTextField.text!
        
        guard isValidEmail(email) else {
            showAlert(text: "Ошибка", description: "Ошибка валидации Email")
            return
        }
        guard !usersStorage.isKeyPresentInUserDefaults(key: firstName) else {
            showAlert(text: "Ошибка", description: "Пользователь с такими данными уже есть")
            return
        }
        usersStorage.appendItem(item: Users(email: email, firstname: firstName, lastname: lastName, password: "1234"))
        currentUser = firstName + " " + lastName
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
    //MARK: - Configuration
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
        
        signinButton.layer.cornerRadius = 15
       
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
