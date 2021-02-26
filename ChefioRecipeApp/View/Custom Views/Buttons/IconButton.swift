//
//  IconButton.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 26/02/21.
//

import UIKit

class IconButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Colors.form
        layer.cornerRadius = 8
        setImage(UIImage(named: "Camera"), for: .normal)
    }
}
