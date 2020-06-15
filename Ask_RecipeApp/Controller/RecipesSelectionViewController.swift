//
//  RecipesSelectionViewController.swift
//  Ask_RecipeApp
//
//  Created by Arun Mora on 12/15/19.
//  Copyright © 2019 Arun Mora. All rights reserved.
//

import UIKit

class RecipesSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var listCollectionView: UICollectionView!
    var selectedCategory: String!
    var recipes: [Recipe]!
    let data = DataSet()
    var recipeToPass: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        recipes = data.getRecipes(forCategoryTitle: selectedCategory)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let recipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCollectionViewCell {
            let recipe = recipes[indexPath.item]
            recipeCell.configureRecipeCell(recipe: recipe)
            return recipeCell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimention = (width / 2) - 15
        return CGSize(width: cellDimention, height: cellDimention)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes[indexPath.item]
        performSegue(withIdentifier: "toRecipeDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? RecipeDetailViewController {
            detailsVC.selectedRecipe = recipeToPass
        }
    }
}

