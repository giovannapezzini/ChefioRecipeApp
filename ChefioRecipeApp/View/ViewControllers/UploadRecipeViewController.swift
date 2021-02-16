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
    let coverView = RectangularDashedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upload"
        view.backgroundColor = .white
        
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(cancelButton, progressLabel, coverView)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.text = "1/2"
        progressLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        progressLabel.textColor = Colors.mainTextColor
        
        coverView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            progressLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            progressLabel.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor),
            
            coverView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 32),
            coverView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            coverView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            coverView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
}
