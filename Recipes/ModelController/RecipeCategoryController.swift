//
//  RecipeCategoryController.swift
//  Recipes
//
//  Created by Jake Gloschat on 2/13/23.
//

import Foundation

class RecipeCategoryController {
    
    // MARK: - Properties
    static let sharedInstance = RecipeCategoryController()
    // Source of truth
    var categories: [RecipeCategory] = []
    // MARK: - CRUD
    
    init() {
        load()
    }
    func createCategory(with name: String) {
        let category = RecipeCategory(title: name)
        categories.append(category)
        save()
    }
    
    func updateCategory(categoryToUpdate: RecipeCategory, newTitle: String) {
        categoryToUpdate.title = newTitle
        save()
    }
    
    func delete(category categoryToDelete: RecipeCategory) {
        guard let index = categories.firstIndex(of: categoryToDelete) else { return }
        categories.remove(at: index)
        save()
    }
    
    // Computed Property
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectory.appendingPathComponent("recipes.json")
        return finalURL
    }
    
    func save () {
        // 1. Get the address to save the file to
        guard let saveLocation = fileURL else {return}
        // 2. Convert the Swift struct or class into JSON Data
        do {
            let jsonData = try JSONEncoder().encode(categories)
            // 3. Save (write) the data to the adress from step 1.
            try jsonData.write(to: saveLocation)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func load() {
        // 1. Get the address the data is saved at.
        guard let url = fileURL else {return}
        do {
            // 2. Load that JSON data from the address
            let retrievedJSONData = try Data(contentsOf: url)
            // 3. Convert from JSON to our Swift Model Object Type
            let decodedCategories = try JSONDecoder().decode([RecipeCategory].self, from: retrievedJSONData)
            self.categories = decodedCategories
        } catch let error {
            print(error.localizedDescription)
        }
    }
} // End of Class
