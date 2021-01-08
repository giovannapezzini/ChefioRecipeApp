//
//  SignInViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    var signInLabel = HeaderLabel()
    var signInDescription = BodyLabel()
    
    var textField = TextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(signInLabel)
        view.addSubview(signInDescription)
        view.addSubview(textField)
        
        signInLabel.text = "Welcome Back!"
        signInDescription.text = "Please enter your account here"

        textField.placeholder = "Email or phone number"
        
        let image = UIImage(named: "Message");
        textField.leftImage = image
        
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInDescription.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 8),
            signInDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: signInDescription.bottomAnchor, constant: 32),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
}
