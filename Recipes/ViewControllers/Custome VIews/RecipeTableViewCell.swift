//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Jake Gloschat on 2/14/23.
//

import UIKit

// step 1 - Declare the protocol (above the class declaration)

protocol RecipeTableViewCellDelegate: AnyObject { // Create my boss (emperor)
    // step 2 - Create the protocol methods
    func toggleFavoriteButtonTapped(cell: RecipeTableViewCell) // Creates my task (order 66)
    
}

class RecipeTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeCaloriesLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    // Step 3 - Hire the intern
    weak var delegate: RecipeTableViewCellDelegate? // Creating the clones
    
    var recipe: Recipe? { // computed prop
        didSet { // prop observer
            updateViews()
        }
    }
    
    // MARK: - Helper Functions
    func updateViews() {
        guard let recipe = recipe else { return }
        recipeNameLabel.text = recipe.title
        recipeCaloriesLabel.text = "\(recipe.calories ?? 0)"
        
        let favoriteImageName = recipe.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        // Step 4 - inform the delegate WHEN to perform the action
        // Hey clones, execute order 66
        delegate?.toggleFavoriteButtonTapped(cell: self)
    }
    
}
