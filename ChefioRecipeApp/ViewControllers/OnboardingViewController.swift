//
//  ViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var imageView = UIImageView()
    var onboardingTitle = HeaderLabel()
    var onboardingDescription = BodyLabel(textAlignment: .center, fontSize: 17)
    var actionButton = PrimaryButton(title: "Get Started")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(imageView)
        view.addSubview(onboardingTitle)
        view.addSubview(onboardingDescription)
        view.addSubview(actionButton)
        
        imageView.image = Images.onboardingImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        onboardingTitle.text = "Start Cooking"
        onboardingDescription.text = "Let’s join our community\nto cook better food!"
                
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            onboardingTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            onboardingTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            onboardingDescription.topAnchor.constraint(equalTo: onboardingTitle.bottomAnchor, constant: 16),
            onboardingDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            actionButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

