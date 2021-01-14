//
//  SignUpViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 10/01/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    var firebase = Firebase()
    var validation = Validation()
    
    var signUpLabel = HeaderLabel(textAlignment: .center, fontSize: 22)
    var signUpDescription = BodyLabel(textAlignment: .center, fontSize: 15)
    
    var nameTextField = TextField()
    var emailTextField = TextField()
    var passwordTextField = TextField()
    var signUpButton = PrimaryButton(title: "Sign Up", backgroundColor: Colors.primaryColor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layoutUI()
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    func validateFields() -> Bool {
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else { return false }
                
        let isValidName = validation.validateName(name: name)
        let isValidEmail = validation.validateEmail(email: email)
        let isValidPassword = validation.validatePassword(password: password)
        
        if isValidName, isValidEmail, isValidPassword { return true } else {
            nameTextField.layer.borderColor = Colors.secondaryColor.cgColor
            emailTextField.layer.borderColor = Colors.secondaryColor.cgColor
            passwordTextField.layer.borderColor = Colors.secondaryColor.cgColor
        }
        
        if !isValidName {
            nameTextField.layer.borderColor = Colors.secondaryColor.cgColor
            presentAlertOnMainThread(title: "Error", message: "Please make sure your name length has 3 characters minimum and 18 characters maximum", buttonTitle: "Ok")
            return false
        } else { nameTextField.layer.borderColor = Colors.primaryColor.cgColor }
        
        if !isValidEmail {
            emailTextField.layer.borderColor = Colors.secondaryColor.cgColor
            presentAlertOnMainThread(title: "Error", message: "Please make sure your email is correct.", buttonTitle: "Ok")
            return false
        } else { emailTextField.layer.borderColor = Colors.primaryColor.cgColor }
        
        if !isValidPassword {
            passwordTextField.layer.borderColor = Colors.secondaryColor.cgColor
            presentAlertOnMainThread(title: "Error", message: "Please make sure your password is at least 8 characters, contains a special character and a number.", buttonTitle: "Ok")
            return false
        } else { passwordTextField.layer.borderColor = Colors.primaryColor.cgColor }
        
        return false
    }
    
    @objc func signUpButtonTapped() {
        if validateFields() {
            let name = nameTextField.text!
            let email = emailTextField.text!
            let password = passwordTextField.text!

            // Create the user
            firebase.createUser(vc: self, name: name, email: email, password: password)

            // Transition to the home screen
            transitionToHome()
        } else {
            presentAlertOnMainThread(title: "Error", message: "There's something wrong with the fields", buttonTitle: "Ok")
        }
    }
    
    func transitionToHome() {
        print("Home")
    }
    
    func layoutUI() {
        view.addSubview(signUpLabel, signUpDescription, nameTextField, emailTextField, passwordTextField, signUpButton)
        signUpLabel.text = "Welcome!"
        signUpDescription.text = "Please enter your account here"
        
        let bold = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let user = UIImage(systemName: "person", withConfiguration: bold)!.withTintColor(Colors.mainTextColor, renderingMode: .alwaysOriginal)
        nameTextField.leftImage = user
        nameTextField.placeholder = "Your name"
        
        let message = Images.messageImage
        emailTextField.leftImage = message
        emailTextField.placeholder = "Email or phone number"
        
        let lock = Images.lockImage
        passwordTextField.leftImage = lock
        let show = Images.showPasswordImage
        passwordTextField.rightImage = show
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
                
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpDescription.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 8),
            signUpDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: signUpDescription.bottomAnchor, constant: 32),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 56),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signUpButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
