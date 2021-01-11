//
//  UIViewController+Ext.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 11/01/21.
//

import UIKit

extension UIViewController {
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.modalPresentationStyle = .overFullScreen
            ac.modalTransitionStyle = .crossDissolve
            
            let action = UIAlertAction(title: "Ok", style: .default)
            ac.addAction(action)
            self.present(ac, animated: true)
        }
    }
}
