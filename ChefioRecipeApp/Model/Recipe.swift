//
//  Recipe.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 14/01/21.
//

import Foundation

struct Recipe: Codable, Hashable {
    var title : String?
    var image : String?
    // var timeRequired : Int?
    // var sourceURL : String?
    // var ingredients : [String]?
    // var instructions : [String]?
    // var servings: Int?
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        // case timeRequired = "timeRequired"
        // case sourceURL = "sourceURL"
        // case ingredients = "ingredients"
        // case instructions = "instructions"
        // case servings = "servings"
    }
    
    init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            self.title = try container.decode(String.self, forKey: .title)
            self.image = try container.decode(String.self, forKey: .image)
        } else {
            self.title = "title"
            self.image = "image url"
        }
    }
}
