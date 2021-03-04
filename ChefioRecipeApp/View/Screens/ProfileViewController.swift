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
    
    lazy var recipeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 2
        stackView.addArrangedSubview(recipeCountLabel, recipeLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var followingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 2
        stackView.addArrangedSubview(followingCountLabel, followingLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var followersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 2
        stackView.addArrangedSubview(followersCountLabel, followersLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 40
        stackView.addArrangedSubview(recipeStackView, followingStackView, followersStackView)
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
        recipeLabel.text = "Recipes"
        
        // Following Label
        followingCountLabel.text = "782"
        followingLabel.text = "Following"
        
        // Followers Label
        followersCountLabel.text = "1.287"
        followersLabel.text = "Followers"
        
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
            
            recipeCountLabel.widthAnchor.constraint(equalToConstant: 60),
            recipeCountLabel.heightAnchor.constraint(equalToConstant: 20),
            recipeLabel.widthAnchor.constraint(equalToConstant: 60),
            recipeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            followingLabel.widthAnchor.constraint(equalToConstant: 60),
            followingLabel.heightAnchor.constraint(equalToConstant: 20),
            followingCountLabel.widthAnchor.constraint(equalToConstant: 60),
            followingCountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            followersLabel.widthAnchor.constraint(equalToConstant: 60),
            followersLabel.heightAnchor.constraint(equalToConstant: 20),
            followersCountLabel.widthAnchor.constraint(equalToConstant: 60),
            followersCountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            stackView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: padding),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
