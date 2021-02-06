//
//  RecipeCell.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 04/02/21.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    let recipeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let timeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let recipeImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(recipeImageView, recipeLabel, timeLabel)
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            recipeImageView.heightAnchor.constraint(equalToConstant: 120),
            
            recipeLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 10),
            recipeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recipeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
