//
//  ViewController.swift
//  Ask_RecipeApp
//
//  Created by Arun Mora on 12/11/19.
//  Copyright © 2019 Arun Mora. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var menuListTableView: UITableView!
    
    let data = DataSet()
    var categoryToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuListTableView.delegate = self
        menuListTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let menuCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? MenuListTableViewCell {
            menuCell.configureCell(category: data.categories[indexPath.row])
            return menuCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryToPass = data.categories[indexPath.row].title
        performSegue(withIdentifier: "toRecipesSelection", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesVC = segue.destination as? RecipesSelectionViewController {
            recipesVC.selectedCategory = categoryToPass
        }
    }
}

