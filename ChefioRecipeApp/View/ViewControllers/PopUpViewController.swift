//
//  PopUpViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 28/02/21.
//

import UIKit

class PopUpViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView()
    let titleLabel = HeaderLabel()
    let bodyLabel = BodyLabel()
    let dismissButton = PrimaryButton(title: "Back to Home", backgroundColor: Colors.primaryColor)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)

        view.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 24
        containerView.backgroundColor = .white
        containerView.addSubview(dismissButton)
        
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -48),
            dismissButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48),
            dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48),
            dismissButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
}
