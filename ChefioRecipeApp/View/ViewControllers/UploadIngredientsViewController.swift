//
//  UploadIngredientsViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 19/02/21.
//

import UIKit

class UploadIngredientsViewController: UIViewController {
    
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
    
    let ingredientsLabel = HeaderLabel()
    let ingredientsTableView = UITableView()
    let placeholderData = ["Ingredients", "Ingredients 2"]
    
    let backButton = PrimaryButton(title: "Back", backgroundColor: Colors.form)
    let uploadButton = PrimaryButton(title: "Upload", backgroundColor: Colors.primaryColor)
    
    // MARK:  - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        layoutUI()
        configureTableView()
    }
    
    // MARK:  - Layout UI
    
    func layoutUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(cancelButton, progressLabel, ingredientsLabel, ingredientsTableView)
        
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
        
        // Ingredients
        ingredientsLabel.text = "Ingredients"
        
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
            
            ingredientsLabel.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: padding),
            ingredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            ingredientsTableView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: padding),
            ingredientsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            ingredientsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            ingredientsTableView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    // MARK:  - Configure View
    
    func setupView() {
        title = "Ingredients and Steps"
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureTableView() {
        ingredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        ingredientsTableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseID)
        ingredientsTableView.separatorStyle = .none
        ingredientsTableView.rowHeight = 56
    }
}

extension UploadIngredientsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseID) as! TextFieldCell
        cell.placeholder = placeholderData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
