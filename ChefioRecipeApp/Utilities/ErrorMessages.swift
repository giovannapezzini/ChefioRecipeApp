//
//  ErrorMessages.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 14/01/21.
//

import Foundation

enum ErrorMessages: String, Error {
    case invalidName = "Please make sure your name length has 3 characters min. and 18 characters max."
    case invalidEmail = "Please make sure your email is correct."
    case invalidPassword = "Your password must be at least 8 characters, contains a special character and a number."
    case textFieldsError = "There's something wrong with the fields."
    case unableToCreateUser = "Error creating the user."
    case unableToSaveUser = "Error saving user data."
    
    case invalidURL = "Invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this recipe. Please try again."
    case alreadyInFavorites = "You've already favorited this recipe. You must really like them!"
}
