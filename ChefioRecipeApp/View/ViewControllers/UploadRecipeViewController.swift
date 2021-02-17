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
    let imageView = UIImageView()
    let addCoverLabel = HeaderLabel()
    let descriptionLabel = BodyLabel(textAlignment: .center, fontSize: 15)
    
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
        
        // Upload View
        coverView.translatesAutoresizingMaskIntoConstraints = false
        coverView.addSubview(imageView, addCoverLabel, descriptionLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "UploadImage")
        imageView.contentMode = .scaleAspectFit
        
        addCoverLabel.translatesAutoresizingMaskIntoConstraints = false
        addCoverLabel.text = "Add Cover Photo"
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "(up to 12 Mb)"
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            progressLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            progressLabel.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor),
            
            coverView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 32),
            coverView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            coverView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            coverView.heightAnchor.constraint(equalToConstant: 160),
            
            imageView.topAnchor.constraint(equalTo: coverView.topAnchor, constant: 22),
            imageView.centerXAnchor.constraint(equalTo: coverView.centerXAnchor),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: coverView.bottomAnchor, constant: -22),
            descriptionLabel.centerXAnchor.constraint(equalTo: coverView.centerXAnchor),
            
            addCoverLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -4),
            addCoverLabel.centerXAnchor.constraint(equalTo: coverView.centerXAnchor)
        ])
    }
}
