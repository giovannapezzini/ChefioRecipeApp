//
//  RecipeViewModel.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 14/02/21.
//

import Foundation

class RecipeViewModel {
    
    private var apiService = NetworkManager()
    private var randomRecipes = [Recipe]()
    
    func fetchRandomRecipesData(completion: @escaping () -> ()) {
        
        apiService.getRandomRecipe { [weak self] (result) in
            switch result {
            case .success(let recipes):
                self?.randomRecipes = recipes.recipes
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if randomRecipes.count != 0 {
            return randomRecipes.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Recipe {
        return randomRecipes[indexPath.row]
    }
}
