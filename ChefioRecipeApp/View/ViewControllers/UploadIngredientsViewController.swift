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
    let progressNumberLabel = UILabel()
    
    let ingredientsLabel = HeaderLabel()
    let ingredientsTableView = UITableView()
    let placeholderData = ["Ingredients", "Ingredients 2"]
    var tableHeightConstraint: CGFloat = 90
    
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
        contentView.addSubview(progressLabel, progressNumberLabel, ingredientsLabel, ingredientsTableView)
        
        let padding: CGFloat = 24
        
        // Cancel Button
        progressLabel.text = "Progress"
        
        // Progress Label
        progressNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        progressNumberLabel.text = "1/2"
        progressNumberLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
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
            
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            progressLabel.heightAnchor.constraint(equalToConstant: 32),
            
            progressNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            progressNumberLabel.centerYAnchor.constraint(equalTo: progressLabel.centerYAnchor),
            
            ingredientsLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: padding),
            ingredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            ingredientsTableView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: padding),
            ingredientsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            ingredientsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            ingredientsTableView.heightAnchor.constraint(equalToConstant: tableHeightConstraint),
        ])
    }
    
    // MARK:  - Configure View
    
    func setupView() {
        title = "Ingredients and Steps"
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureTableView() {
        ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        ingredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        ingredientsTableView.separatorStyle = .none
    }
}

extension UploadIngredientsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = placeholderData[indexPath.row]
        return cell
    }
}
