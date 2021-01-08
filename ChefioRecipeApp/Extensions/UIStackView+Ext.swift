//
//  UIStackView+Ext.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubview(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
