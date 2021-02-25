//
//  SecondaryButton.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 24/02/21.
//

import UIKit

class SecondaryButton: UIButton {
    
    let plusIcon = UIImage(systemName: "plus")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, borderColor: UIColor) {
        self.init(frame: .zero)
        self.layer.borderColor = borderColor.cgColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderColor = Colors.outline.cgColor
        layer.cornerRadius = 30
        layer.borderWidth = 1
        
        // Title
        setTitleColor(Colors.mainTextColor, for: .normal)
        titleLabel?.font = UIFont(name: "Inter-Bold", size: 15)
        
        // Icon
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let plusIcon = UIImage(systemName: "plus", withConfiguration: boldConfig)
        imageView?.tintColor = Colors.mainTextColor
        setImage(plusIcon, for: .normal)
        
        let spacing: CGFloat = 5
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
    }
}
