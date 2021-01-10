//
//  SignUpViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 10/01/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var signUpLabel = HeaderLabel(textAlignment: .center, fontSize: 22)
    var signUpDescription = BodyLabel(textAlignment: .center, fontSize: 15)
    var nameTextField = TextField()
    var emailTextField = TextField()
    var passwordTextField = TextField()
    var passwordRulesLabel = BodyLabel(textAlignment: .left, fontSize: 17)
    var moreThanSixChar = BodyLabel(textAlignment: .left, fontSize: 15)
    var containsNumber = BodyLabel(textAlignment: .left, fontSize: 15)
    var signUpButton = PrimaryButton(title: "Sign Up", backgroundColor: Colors.primaryColor)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(signUpLabel, signUpDescription, nameTextField, emailTextField, passwordTextField, signUpButton)
        signUpLabel.text = "Welcome!"
        signUpDescription.text = "Please enter your account here"
        
        let bold = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        nameTextField.leftImage = UIImage(systemName: "person", withConfiguration: bold)
        nameTextField.placeholder = "Your name"
        
        let message = Images.messageImage
        emailTextField.leftImage = message
        emailTextField.placeholder = "Email or phone number"
        
        let lock = Images.lockImage
        passwordTextField.leftImage = lock
        passwordTextField.placeholder = "Password"
                
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
