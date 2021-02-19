//
//  UploadRecipeViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 15/02/21.
//

import UIKit

class UploadRecipeViewController: UIViewController {
    
    // MARK:  - ScrollView
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        view.bounces = true
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK:  - Properties
    
    let cancelButton = UIButton()
    let progressLabel = UILabel()
    
    let imagePickerButton = ImagePickerButton()

    let foodLabel = HeaderLabel()
    let foodTextField = TextField()
    
    let descriptionLabel = HeaderLabel()
    let descriptionTextField = TextView()
    
    let cookingDurationLabel = HeaderLabel()
    let cookingDescriptionLabel = BodyLabel(textAlignment: .left, fontSize: 15)
    let cookingDurationSlider = Slider(frame: CGRect(x: 0, y: 0, width: 327, height: 10), values: [10, 30, 60]) { _ in }
    
    let nextButton = PrimaryButton(title: "Next", backgroundColor: Colors.primaryColor)
    
    // MARK:  - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        layoutUI()
        configureImagePickerView()
    }
    
    // MARK:  - Layout UI
    
    func layoutUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(cancelButton, progressLabel, imagePickerButton, foodLabel, foodTextField, descriptionLabel, descriptionTextField, cookingDurationLabel, cookingDescriptionLabel, cookingDurationSlider, nextButton)
        
        let padding: CGFloat = 24
        
        // Cancel Button
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        
        // Progress Label
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.text = "1/2"
        progressLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        progressLabel.textColor = Colors.mainTextColor
        
        // Food Name
        foodLabel.text = "Food Name"
        foodTextField.placeholder = "Enter food name"
        
        // Description
        descriptionLabel.text = "Description"
        
        // Cooking Duration
        cookingDurationLabel.text = "Cooking Duration"
        cookingDescriptionLabel.text = "(in minutes)"
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cancelButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cancelButton.heightAnchor.constraint(equalToConstant: 32),
            
            progressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            progressLabel.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor),
            
            imagePickerButton.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: padding),
            imagePickerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imagePickerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imagePickerButton.heightAnchor.constraint(equalToConstant: 160),
            
            foodLabel.topAnchor.constraint(equalTo: imagePickerButton.bottomAnchor, constant: padding),
            foodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            foodTextField.topAnchor.constraint(equalTo: foodLabel.bottomAnchor, constant: 14),
            foodTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            foodTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            foodTextField.heightAnchor.constraint(equalToConstant: 56),
            
            descriptionLabel.topAnchor.constraint(equalTo: foodTextField.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 14),
            descriptionTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            descriptionTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 86),
            
            cookingDurationLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: padding),
            cookingDurationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cookingDescriptionLabel.centerYAnchor.constraint(equalTo: cookingDurationLabel.centerYAnchor),
            cookingDescriptionLabel.leadingAnchor.constraint(equalTo: cookingDurationLabel.trailingAnchor, constant: 5),
            cookingDurationSlider.topAnchor.constraint(equalTo: cookingDurationLabel.bottomAnchor, constant: 60),
            cookingDurationSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cookingDurationSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cookingDurationSlider.heightAnchor.constraint(equalToConstant: 56),
            
            nextButton.topAnchor.constraint(equalTo: cookingDurationSlider.bottomAnchor, constant: padding),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            nextButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    // MARK:  - Configure View
    
    func setupView() {
        title = "Upload"
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK:  - Image Picker methods
        
    func configureImagePickerView() {
        imagePickerButton.addTarget(self, action: #selector(importPicture), for: .touchUpInside)
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func showImage(image: UIImage) {
        imagePickerButton.removeFromSuperview()
        
        let recipeImageView = UIImageView()
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        recipeImageView.image = image
        recipeImageView.contentMode = .scaleAspectFill
        recipeImageView.clipsToBounds = true
        recipeImageView.layer.cornerRadius = 16
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(importPicture))
        recipeImageView.isUserInteractionEnabled = true
        recipeImageView.addGestureRecognizer(tapGestureRecognizer)

        contentView.addSubview(recipeImageView)
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 24),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            recipeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            recipeImageView.heightAnchor.constraint(equalToConstant: 160),

            foodLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 24)
        ])
    }
}

extension UploadRecipeViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        
        showImage(image: image)
    }
}
