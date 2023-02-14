//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Jake Gloschat on 2/14/23.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeCaloriesLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Helper Functions
    func updateViews() {
        guard let recipe = recipe else { return }
        recipeNameLabel.text = recipe.title
        recipeCaloriesLabel.text = "\(recipe.calories ?? 0)"
    }
    
    // MARK: - Actions
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
    
}
