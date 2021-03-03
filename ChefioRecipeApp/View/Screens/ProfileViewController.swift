//
//  ProfileViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 01/03/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK:  - ScrollView
        
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
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
    
    let profileImage = UIImageView()
    let userNameLabel = HeaderLabel()
    
    var stackView = UIStackView()
    
    let recipeCountLabel = HeaderLabel(textAlignment: .center, fontSize: 17)
    let followingCountLabel = HeaderLabel(textAlignment: .center, fontSize: 17)
    let followersCountLabel = HeaderLabel(textAlignment: .center, fontSize: 17)
    
    let recipeLabel = BodyLabel(textAlignment: .center, fontSize: 12)
    let followingLabel = BodyLabel(textAlignment: .center, fontSize: 12)
    let followersLabel = BodyLabel(textAlignment: .center, fontSize: 12)
    
    // MARK:  - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
    }
    
    // MARK:  - Layout UI
    
    func layoutUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profileImage, userNameLabel, stackView)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(named: "ProfileImage")
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Name"
        
        recipeLabel.text = "Recipes"
        recipeCountLabel.text = "32"
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView = UIStackView(arrangedSubviews: [recipeLabel, recipeCountLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 30.0
        
        let padding: CGFloat = 24
        
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
            
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48),
            profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            profileImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            userNameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: padding),
            userNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
//            stackView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: padding),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
