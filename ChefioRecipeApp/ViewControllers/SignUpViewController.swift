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
    
    var signUpLabel = HeaderLabel(textAlignment: .center, fontSize: 22)
    var signUpDescription = BodyLabel(textAlignment: .center, fontSize: 15)
    var nameTextField = TextField()
    var emailTextField = TextField()
    var passwordTextField = TextField()
    var passwordRulesLabel = BodyLabel(textAlignment: .left, fontSize: 17)
    var moreThanSixChar = BodyLabel(textAlignment: .left, fontSize: 15)
    var containsNumber = BodyLabel(textAlignment: .left, fontSize: 15)
    var signUpButton = PrimaryButton(title: "Sign Up", backgroundColor: Colors.primaryColor)
    var errorLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layoutUI()
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    func validateFields() -> String? {
        print("validating")
        
        // Check that all fields are filled in
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            print("Please fill in all fields.")
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(password) == false {
            print("Please make sure your password is at least 8 characters, contains a special character and a number.")
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    @objc func signUpButtonTapped() {
        print("tapped")
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            // There's something wrong with the fields, show error message
            showError(error!)
        } else {
            // Create cleaned versions of the data
            let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                // Check for errors
                if error != nil {
                    // There was an error creating the user
                    self.showError("Error creating the user")
                } else {
                    // User was created successfully, now store the name
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name": name, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                }
            }
            
            // Transition to the home screen
            transitionToHome()
        }
    }
    
    func transitionToHome() {
        print("Home")
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
        
        let ac = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(action)
        present(ac, animated: true)
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
