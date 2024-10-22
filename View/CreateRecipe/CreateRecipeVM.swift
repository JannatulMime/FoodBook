//
//  CreateRecipeVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import CoreData
import Foundation

class CreateRecipeVM: ObservableObject {
    @Published var title: String = ""
    @Published var description: NSAttributedString = NSAttributedString.empty
    @Published var ingredients: String = ""
    @Published var category: String = ""
    @Published var duration: String = ""
  //  @Published var goDetailsPage: Bool = false
    @Published var goRecipeListPage: Bool = false

    @Published var recipe: Recipe = Recipe(name: "", details: NSAttributedString(string: ""), ingredients: "", totalTime: "", image: "", category: "")

    let manager = CoreDataManager.instance
    @Published var savedEntities: [RecipeEntity] = []

    func addRecipe() {
        let newRecipe = RecipeEntity(context: manager.context)
        newRecipe.name = title
        newRecipe.category = category
        newRecipe.ingridients = ingredients
        newRecipe.id = UUID().uuidString

        let isSuccessSave = manager.save()

        goRecipeListPage = isSuccessSave
    }

    func saveData() {
        let isValid = isValidData()

        if isValid {
            addRecipe()
        }
    }

    func createRecipe() -> Recipe {
        return Recipe(name: title, details: description, ingredients: ingredients, totalTime: duration, image: "", category: category)
    }

    func isValidData() -> Bool {
//        if title.isEmpty || description.length <= 0 || ingredients.isEmpty || category.isEmpty || duration.isEmpty {
//            print(" Validation False")
//            return false
//        } else {
//            print(" Validation True")
//            return true
//        }
        
        if title.isEmpty {
            print(" Validation False")
            return false
        } else {
            print(" Validation True")
            return true
        }
    }
}
