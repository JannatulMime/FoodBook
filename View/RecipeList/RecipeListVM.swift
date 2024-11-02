//
//  RecipeListVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import Foundation

class RecipeListVM: ObservableObject {
    @Published var goToCreateRecipe: Bool = false
    @Published var gotoDetailsPage: Bool = false
    @Published var recipies : [Recipe] = [Recipe]()

    
    let localRecipeStore : CoreDataRecipeManager = CoreDataRecipeManager()
    
    init() {
        recipies = localRecipeStore.fetchRecipes()
    }
}
