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
    
    let imagePickerView = RectangularDashedView()
    let imageView = UIImageView()
    let titleUploadLabel = HeaderLabel()
    let descriptionUploadLabel = BodyLabel(textAlignment: .center, fontSize: 15)
    
    let foodLabel = HeaderLabel()
    let foodTextField = TextField()
    
    let descriptionLabel = HeaderLabel()
    let descriptionTextField = TextView()
    
    let cookingDurationLabel = HeaderLabel()
    let cookingDescriptionLabel = BodyLabel(textAlignment: .left, fontSize: 15)
    let cookingDurationSlider = Slider(frame: CGRect(x: 0, y: 0, width: 327, height: 10), values: [10, 30, 60]) { _ in }
    
    let nextButton = PrimaryButton(title: "Next", backgroundColor: Colors.primaryColor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upload"
        view.backgroundColor = .white
        
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(cancelButton, progressLabel, imagePickerView, foodLabel, foodTextField, descriptionLabel, descriptionTextField, cookingDurationLabel, cookingDescriptionLabel, cookingDurationSlider, nextButton)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.text = "1/2"
        progressLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        progressLabel.textColor = Colors.mainTextColor
        
        // Upload View
        imagePickerView.translatesAutoresizingMaskIntoConstraints = false
        imagePickerView.addSubview(imageView, titleUploadLabel, descriptionUploadLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "UploadImage")
        imageView.contentMode = .scaleAspectFit
        
        titleUploadLabel.text = "Add Cover Photo"
        descriptionUploadLabel.text = "(up to 12 Mb)"
        
        // Food Name
        foodLabel.text = "Food Name"
        foodTextField.placeholder = "Enter food name"
        
        // Description
        descriptionLabel.text = "Description"
        
        // Cooking Duration
        cookingDurationLabel.text = "Cooking Duration"
        cookingDescriptionLabel.text = "(in minutes)"
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            progressLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            progressLabel.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor),
            
            imagePickerView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 32),
            imagePickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            imagePickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            imagePickerView.heightAnchor.constraint(equalToConstant: 160),
            
            imageView.topAnchor.constraint(equalTo: imagePickerView.topAnchor, constant: 22),
            imageView.centerXAnchor.constraint(equalTo: imagePickerView.centerXAnchor),
            
            descriptionUploadLabel.bottomAnchor.constraint(equalTo: imagePickerView.bottomAnchor, constant: -22),
            descriptionUploadLabel.centerXAnchor.constraint(equalTo: imagePickerView.centerXAnchor),
            
            titleUploadLabel.bottomAnchor.constraint(equalTo: descriptionUploadLabel.topAnchor, constant: -4),
            titleUploadLabel.centerXAnchor.constraint(equalTo: imagePickerView.centerXAnchor),
            
            foodLabel.topAnchor.constraint(equalTo: imagePickerView.bottomAnchor, constant: 24),
            foodLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            foodTextField.topAnchor.constraint(equalTo: foodLabel.bottomAnchor, constant: 14),
            foodTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            foodTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            foodTextField.heightAnchor.constraint(equalToConstant: 56),
            
            descriptionLabel.topAnchor.constraint(equalTo: foodTextField.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 14),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 86),
            
            cookingDurationLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 24),
            cookingDurationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            cookingDescriptionLabel.centerYAnchor.constraint(equalTo: cookingDurationLabel.centerYAnchor),
            cookingDescriptionLabel.leadingAnchor.constraint(equalTo: cookingDurationLabel.trailingAnchor, constant: 5),
            
            cookingDurationSlider.topAnchor.constraint(equalTo: cookingDurationLabel.bottomAnchor, constant: 50),
            cookingDurationSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            cookingDurationSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            nextButton.topAnchor.constraint(equalTo: cookingDurationSlider.bottomAnchor, constant: 24),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            nextButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
