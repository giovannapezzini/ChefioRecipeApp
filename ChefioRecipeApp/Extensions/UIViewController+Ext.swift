//
//  UIViewController+Ext.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 11/01/21.
//

import UIKit

extension UIViewController {
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
            ac.modalPresentationStyle = .overFullScreen
            ac.modalTransitionStyle = .crossDissolve
            
            let action = UIAlertAction(title: "Ok", style: .default)
            ac.addAction(action)
            self.present(ac, animated: true)
        }
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
