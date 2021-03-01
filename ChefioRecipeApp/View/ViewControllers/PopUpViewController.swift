//
//  PopUpViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 28/02/21.
//

import UIKit

class PopUpViewController: UIViewController {
    
    let containerView = UIView()
    let titleLabel = HeaderLabel(textAlignment: .center, fontSize: 22)
    let bodyLabel = BodyLabel(textAlignment: .center, fontSize: 15)
    let dismissButton = PrimaryButton(title: "Back to Home", backgroundColor: Colors.primaryColor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        view.addSubview(containerView)
        configureContainerView()
    }
    
    func configureContainerView() {
        
        // Container
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 24
        containerView.backgroundColor = .white
        containerView.addSubview(titleLabel, bodyLabel, dismissButton)
        
        // Labels
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Upload Success 🎉"
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.text = "Your recipe has been uploaded, you can see it on your profile"
        
        // Button
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        let padding: CGFloat = 40
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            
            dismissButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 24),
            dismissButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            dismissButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
}
