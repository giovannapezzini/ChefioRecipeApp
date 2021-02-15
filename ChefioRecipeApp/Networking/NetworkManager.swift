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
    
    func getRandomRecipe(completion: @escaping (Result<RecipeData, ErrorMessages>) -> Void) {
        let endpoint = requestURL + "recipes/random/?apiKey=\(NetworkManager.apiKey)&number=6"
        
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
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(RecipeData.self, from: data)
                
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                    print(jsonData)
                }
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadRecipeImage(imageURL: String, completion: @escaping (UIImage?, Bool) -> Void) {
        if let url = URL(string: imageURL) {
            DispatchQueue.global(qos: .userInitiated).async {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data else {
                        completion(nil, false)
                        return
                    }
                    DispatchQueue.main.async{
                        completion(UIImage(data: data), true)
                    }
                }
                task.resume()
            }
        }
    }
}
