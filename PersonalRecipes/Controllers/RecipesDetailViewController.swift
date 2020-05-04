//
//  RecipesDetailViewController.swift
//  PersonalRecipes
//
//  Created by Javier Giner Alvarez on 04/05/2020.
//  Copyright © 2020 jginerafatimagc.com. All rights reserved.
//

import UIKit

class RecipesDetailViewController: UIViewController {
    @IBOutlet weak var recipeImageView: ObservableImage!
    
    @IBOutlet weak var ingredientsContainerStackView: UIStackView!
    @IBOutlet weak var procedureContainerStackView: UIStackView!
    
    private var recipeViewModel: RecipeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        
        loadIngredientsList()
        loadProcedureList()
    }
    
    convenience init() {
        self.init(viewModel: nil)
    }

    init(viewModel: RecipeModel?) {
        self.recipeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadImage(){
        recipeImageView.fetchImage(from: recipeViewModel?.images.first ?? "")
    }
    
    private func loadIngredientsList(){
        guard let ingredients = recipeViewModel?.ingredients else { return }
        for text in  ingredients {
            let label = UILabel()
            label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
            label.numberOfLines = 0
            label.text = text
            ingredientsContainerStackView.addArrangedSubview(label)
        }
    }
    
    private func loadProcedureList(){
        guard let procedure = recipeViewModel?.procedure else { return }
        for text in procedure {
            let label = UILabel()
            label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
            label.numberOfLines = 0
            label.text = text
            procedureContainerStackView.addArrangedSubview(label)
        }
    }
    
}
