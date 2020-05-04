//
//  RecipeModel.swift
//  PersonalRecipes
//
//  Created by Javier Giner Alvarez on 04/05/2020.
//  Copyright © 2020 jginerafatimagc.com. All rights reserved.
//

import Foundation

struct RecipeModel: Codable {
    let ingredients: [String]
    let name: String
    let procedure: [String]
    let images: [String]
    let type: [String]
    let source: String

    private enum CodingKeys: String, CodingKey {
        case ingredients
        case name
        case procedure
        case images
        case type
        case source
    }
}
