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
        
    let recipeCountLabel = HeaderLabel(textAlignment: .center, fontSize: 17)
    let followingCountLabel = HeaderLabel(textAlignment: .center, fontSize: 17)
    let followersCountLabel = HeaderLabel(textAlignment: .center, fontSize: 17)
    
    let recipeLabel = BodyLabel(textAlignment: .center, fontSize: 12)
    let followingLabel = BodyLabel(textAlignment: .center, fontSize: 12)
    let followersLabel = BodyLabel(textAlignment: .center, fontSize: 12)
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0
        stackView.addArrangedSubview(recipeCountLabel, recipeLabel, followingCountLabel, followingLabel, followersCountLabel, followersLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
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
        contentView.addSubview(profileImage, userNameLabel)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(named: "ProfileImage")
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Name"
        
        // Recipe Label
        recipeCountLabel.text = "32"
        recipeCountLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        recipeCountLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        recipeLabel.text = "Recipes"
        recipeLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        recipeLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        // Following Label
        followingCountLabel.text = "32"
        followingCountLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        followingCountLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        followingLabel.text = "Following"
        followingLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        followingLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        // Followers Label
        followersCountLabel.text = "32"
        followersCountLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        followersCountLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        followersLabel.text = "Followers"
        followersLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        followersLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        //Stack View
        contentView.addSubview(stackView)

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
            
            stackView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: padding),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
