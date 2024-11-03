//
//  RecipeDetailsVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import Foundation

class RecipeDetailsVM: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var gotoCreateRecipe: Bool = false
    @Published var isAddButtonPressed: Bool = false
    

    @Published var recipe: Recipe?
    
    let localRecipeStore : CoreDataRecipeManager = CoreDataRecipeManager()


    init(recipeId: String) {
        print("Received rcipe id  : \(recipeId)")
        recipe = localRecipeStore.fetchRecipe(from: recipeId)
    }
    
    func showDeleteAlert() {
        showAlert = true
        alertMessage = "Is Recipe Deleted"
    }
    

//    public func deleteRecipe() -> Bool {
//        if let entity = getRecipeEntity(from: recipe?.id ?? "") {
//            manager.context.delete(entity)
//            let isSuccess = manager.save()
//            if isSuccess {
//                return true
//               
//            }
//        }
//       return false
//    }
}


