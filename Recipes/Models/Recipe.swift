//
//  Recipe.swift
//  Recipes
//
//  Created by Jake Gloschat on 2/13/23.
//

import Foundation

class Recipe: Encodable, Decodable {
    
    let id: UUID
    var title: String
    var description: String
    var calories: Int?
    var cookTime: Int?
    
    init(id: UUID = UUID (), title: String, description: String, calories: Int?, cookTime: Int?) {
        self.id = id
        self.title = title
        self.description = description
        self.calories = calories
        self.cookTime = cookTime
    }
    
} // End of Class

extension Recipe: Equatable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}
