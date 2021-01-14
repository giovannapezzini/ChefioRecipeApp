//
//  FirebaseHelper.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 13/01/21.
//

import Foundation
import Firebase
import FirebaseAuth

class Firebase: NSObject {
    
    func authenticate(vc: UIViewController, email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                vc.showAlert(message: error!.localizedDescription)
            } else {
                let homeVC = HomeViewController()
                homeVC.modalPresentationStyle = .fullScreen
                vc.present(homeVC, animated: true)
            }
        }
    }
    
    func createUser(vc: UIViewController, name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            // Check for errors
            if error != nil {
                // There was an error creating the user
                vc.showAlert(message: ErrorMessages.unableToCreateUser.rawValue)
            } else {
                // User was created successfully, now store the name
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["name": name, "uid": result!.user.uid]) { (error) in
                    if error != nil {
                        vc.showAlert(message: ErrorMessages.unableToSaveUser.rawValue)
                    }
                }
            }
        }
    }
}
