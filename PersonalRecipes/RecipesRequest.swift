//
//  RecipesRequest.swift
//  PersonalRecipes
//
//  Created by Javier Giner Alvarez on 04/05/2020.
//  Copyright © 2020 jginerafatimagc.com. All rights reserved.
//

import Foundation

class RecipesRequest: APIRequest {
    var method = RequestType.GET
    var path = "recipes"
    var parameters: [String : String]?
    
    init(){
        //empty init()
    }

    init(name: String) {
        parameters?["name"] = name
    }
}
