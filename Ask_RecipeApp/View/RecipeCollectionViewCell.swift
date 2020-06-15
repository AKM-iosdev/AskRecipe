//
//  RecipeCollectionViewCell.swift
//  Ask_RecipeApp
//
//  Created by Arun Mora on 12/15/19.
//  Copyright © 2019 Arun Mora. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImage.layer.cornerRadius = 10
    }
    
    func configureRecipeCell(recipe: Recipe) {
        recipeImage.image = UIImage(named: recipe.imageName)
    }
    
    
}
