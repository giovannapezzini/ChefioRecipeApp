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
    
    let progressLabel = TagLabel()
    let progressNumberLabel = ProgressLabel(pageNumber: 2)
    
    let ingredientsLabel = HeaderLabel()
    let ingredientsTableView = UITableView()
    
    let placeholderData = ["Ingredients", "Ingredients 2", "3"]
    var heightConstraint: NSLayoutConstraint?
    var tableHeightConstraint: CGFloat = 90
    var count = 2
    
    let addIngredientsButton = SecondaryButton(title: "Ingredients", borderColor: Colors.outline)
    
    let separatorView = UIView()
    
    let stepsLabel = HeaderLabel()
    
    let backButton = PrimaryButton(title: "Back", backgroundColor: Colors.form)
    let uploadButton = PrimaryButton(title: "Upload", backgroundColor: Colors.primaryColor)
    
    // MARK:  - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureTableView()
        layoutUI()
    }
    
    // MARK:  - Layout UI
    
    func layoutUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(progressLabel, progressNumberLabel, ingredientsLabel, ingredientsTableView, addIngredientsButton, separatorView, stepsLabel)
        
        let padding: CGFloat = 24
        
        // Progress Label
        progressLabel.text = "Progress"
        
        // Ingredients
        ingredientsLabel.text = "Ingredients"
        
        // Constraints Priority
        heightConstraint = ingredientsTableView.heightAnchor.constraint(equalToConstant: tableHeightConstraint)
        heightConstraint?.priority = UILayoutPriority(999)
        heightConstraint?.isActive = true
        
        // Separator View
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = Colors.form
        
        // Steps Label
        stepsLabel.text = "Steps"
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            progressLabel.heightAnchor.constraint(equalToConstant: 32),
            
            progressNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            progressNumberLabel.centerYAnchor.constraint(equalTo: progressLabel.centerYAnchor),
            
            ingredientsLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: padding),
            ingredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            ingredientsTableView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 14),
            ingredientsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            ingredientsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            addIngredientsButton.topAnchor.constraint(equalTo: ingredientsTableView.bottomAnchor, constant: 14),
            addIngredientsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            addIngredientsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            addIngredientsButton.heightAnchor.constraint(equalToConstant: 56),
            
            separatorView.topAnchor.constraint(equalTo: addIngredientsButton.bottomAnchor, constant: padding),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 8),
            
            stepsLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: padding),
            stepsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
    }
    
    // MARK:  - Configure View
    
    func setupView() {
        title = "Ingredients and Steps"
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureTableView() {
        ingredientsTableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseID)
        ingredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        ingredientsTableView.separatorStyle = .none
        ingredientsTableView.backgroundColor = .blue
        ingredientsTableView.rowHeight = 76
        ingredientsTableView.isScrollEnabled = false
    }
}

extension UploadIngredientsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseID, for: indexPath) as! TextFieldCell
        
        heightConstraint?.constant = ingredientsTableView.rowHeight * CGFloat(count)
        return cell
    }
}
