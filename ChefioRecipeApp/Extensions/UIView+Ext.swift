//
//  UIView+Ext.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit

extension UIView {
    
    func addSubview(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
