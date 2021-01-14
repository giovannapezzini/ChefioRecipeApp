//
//  ErrorMessages.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 14/01/21.
//

import Foundation

enum ErrorMessages: String {
    case invalidName = "Please make sure your name length has 3 characters min. and 18 characters max."
    case invalidEmail = "Please make sure your email is correct."
    case invalidPassword = "Your password must be at least 8 characters, contains a special character and a number."
    case textFieldsError = "There's something wrong with the fields."
    case unableToCreateUser = "Error creating the user."
    case unableToSaveUser = "Error saving user data."
}
