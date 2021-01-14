//
//  FirebaseHelper.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 13/01/21.
//

import Foundation
import FirebaseAuth

class Firebase: NSObject {
    
    func authenticate(vc: UIViewController,email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                vc.presentAlertOnMainThread(title: "Oops", message: error!.localizedDescription, buttonTitle: "Ok")
            } else {
                print("Home")
            }
        }
    }
}
