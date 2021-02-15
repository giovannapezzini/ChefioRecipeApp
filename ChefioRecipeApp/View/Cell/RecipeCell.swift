//
//  RecipeCell.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 04/02/21.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    let shared = NetworkManager()
    
    let recipeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = Colors.mainTextColor
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let timeIcon: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let smallConfig = UIImage.SymbolConfiguration(scale: .small)
        imageView.image = UIImage(systemName: "heart.fill", withConfiguration: smallConfig)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let timeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = Colors.secondaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    let recipeImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func set(recipe: Recipe) {
        recipeLabel.text = recipe.title
        
        if let imageURL = recipe.image {
            shared.downloadRecipeImage(imageURL: imageURL) { (image, success) in
                self.recipeImageView.image = image
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(recipeImageView, recipeLabel, timeIcon, timeLabel)
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            recipeImageView.widthAnchor.constraint(equalToConstant: self.frame.width),
            recipeImageView.heightAnchor.constraint(equalToConstant: self.frame.width),
            
            recipeLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 10),
            recipeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recipeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            timeIcon.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 8),
            timeIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            timeIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            timeIcon.heightAnchor.constraint(equalToConstant: 12),
            
            timeLabel.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 8),
            timeLabel.leadingAnchor.constraint(equalTo: timeIcon.trailingAnchor, constant: 4),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
