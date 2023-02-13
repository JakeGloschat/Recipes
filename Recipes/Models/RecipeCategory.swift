//
//  RecipeCategory.swift
//  Recipes
//
//  Created by Jake Gloschat on 2/13/23.
//

import Foundation

class RecipeCategory {
    
    let id: UUID
    var title: String
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), title: String, recipes:[Recipe] = []) {
        self.id = id
        self.title = title
        self.recipes = recipes
    }
} // End of Class

extension RecipeCategory: Equatable {
    static func == (lhs: RecipeCategory, rhs: RecipeCategory) -> Bool {
        return lhs.id == rhs.id // Scott nailed this day one...
    }
    
    
}
