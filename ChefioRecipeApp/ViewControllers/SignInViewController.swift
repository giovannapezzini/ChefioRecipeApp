//
//  SignInViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    var signInLabel = HeaderLabel()
    var signInDescription = BodyLabel()
    var emailTextField = TextField()
    var passwordTextField = TextField()
    var forgotPasswordButton = UIButton()
    
    var stackView = UIStackView()
    var stackView2 = UIStackView()
    var stackView3 = UIStackView()
    
    var loginButton = PrimaryButton(title: "Login", backgroundColor: Colors.primaryColor)
    var textLabel = BodyLabel()
    var googleButton = PrimaryButton(title: "Google", backgroundColor: Colors.secondaryColor)
    var anyAccountLabel = BodyLabel(textAlignment: .center, fontSize: 15)
    var signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLogin()
        configureButtonsStackViews()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc func signUpButtonTapped() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc func loginTapped() {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.showError(error!.localizedDescription)
            } else {
                print("Home")
            }
        }
    }
    
    func showError(_ message: String) {
        let ac = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    func configureLogin() {
        view.addSubview(signInLabel, signInDescription, emailTextField, passwordTextField, forgotPasswordButton)
        
        signInLabel.text = "Welcome Back!"
        signInDescription.text = "Please enter your account here"
        
        let message = Images.messageImage
        emailTextField.leftImage = message
        emailTextField.placeholder = "Email address"
        
        let lock = Images.lockImage
        passwordTextField.leftImage = lock
        let show = Images.showPasswordImage
        passwordTextField.rightImage = show
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(Colors.mainTextColor, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 86),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInDescription.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 8),
            signInDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: signInDescription.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    func configureButtonsStackViews() {
        view.addSubview(stackView)
        
        textLabel.text = "or continue with"
        textLabel.textAlignment = .center
        
        anyAccountLabel.text = "Don’t have any account?"
        anyAccountLabel.textColor = Colors.mainTextColor
        anyAccountLabel.numberOfLines = 1

        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.contentHorizontalAlignment = .left
        signUpButton.setTitleColor(Colors.primaryColor, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Inter-Bold", size: 15)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(loginButton, textLabel, googleButton, stackView2)
        
        stackView2.axis = .vertical
        stackView2.distribution = .fillEqually
        stackView2.alignment = .center
        stackView2.addArrangedSubview(stackView3)
        
        stackView3.axis = .horizontal
        stackView3.alignment = .center
        stackView3.distribution = .fill
        stackView3.spacing = 5
        stackView3.addArrangedSubview(anyAccountLabel, signUpButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 260)
        ])
    }
}
