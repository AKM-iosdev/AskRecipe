//
//  RecipeDetailViewController.swift
//  Ask_RecipeApp
//
//  Created by Arun Mora on 12/15/19.
//  Copyright © 2019 Arun Mora. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailRecipeTitle: UILabel!
    @IBOutlet weak var recipeInstructionsLbl: UILabel!
    
    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = UIImage(named: selectedRecipe.imageName)
        detailRecipeTitle.text = selectedRecipe.title
        recipeInstructionsLbl.text = selectedRecipe.instructions
        // Do any additional setup after loading the view.
    }
    

    

}
