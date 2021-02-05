//
//  Recipe.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 14/01/21.
//

import Foundation

struct Recipe: Codable, Hashable {
    var title : String?
    var imageURL : String?
    var timeRequired : Int?
    var sourceURL : String?
    var ingredients : [String]?
    var instructions : [String]?
    var servings: Int?
}
