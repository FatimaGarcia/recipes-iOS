//
//  Current.swift
//  PersonalRecipes
//
//  Created by Javier Giner Alvarez on 04/05/2020.
//  Copyright © 2020 jginerafatimagc.com. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public enum Current {
    static var recipes: BehaviorRelay<[RecipeModel]> = BehaviorRelay(value: [])
}
