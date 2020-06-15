//
//  MenuListTableViewCell.swift
//  Ask_RecipeApp
//
//  Created by Arun Mora on 12/15/19.
//  Copyright © 2019 Arun Mora. All rights reserved.
//

import UIKit

class MenuListTableViewCell: UITableViewCell {

    @IBOutlet weak var menuListImage: UIImageView!
    @IBOutlet weak var menuListTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuListImage.layer.cornerRadius = 10
        // Initialization code
    }

    func configureCell(category: FoodCategory) {
        menuListImage.image = UIImage(named: category.imageName)
        menuListTitleLabel.text = category.title
    }

}
