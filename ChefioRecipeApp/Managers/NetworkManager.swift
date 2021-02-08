//
//  NetworkManager.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 14/01/21.
//

import UIKit

class NetworkManager {
    static let apiKey = "80f29c792ec145709e2f163f236bbe2d"
    private let requestURL = "https://api.spoonacular.com/"
    
    func getRandomRecipe(completion: @escaping (Result<[Recipe], ErrorMessages>) -> Void) {
        let endpoint = requestURL + "recipes/random/?apiKey=\(NetworkManager.apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in 
            if error != nil {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            let recipesDictionary = try! JSONDecoder().decode([String: [Recipe]].self, from: data)
            if let recipes = recipesDictionary["recipes"] {
                completion(.success(recipes))
            } else {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
