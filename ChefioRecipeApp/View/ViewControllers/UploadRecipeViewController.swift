//
//  UploadRecipeViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 15/02/21.
//

import UIKit

class UploadRecipeViewController: UIViewController {

    let cancelButton = UIButton()
    let progressLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(cancelButton, progressLabel)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.tintColor = .red
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }
}
