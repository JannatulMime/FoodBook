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
    
    let manager = CoreDataManager.instance

    init(recipeId: String) {
        print("Received rcipe id  : \(recipeId)")
        fetchRecipe(from: recipeId)
    }

    private func getRecipeEntity(from id: String) -> RecipeEntity? {
        let request = RecipeEntity.fetchRequest()
        let idPredicate = NSPredicate(format: "id = %@", id)
        request.predicate = idPredicate
        do {
            let datas = try manager.context.fetch(request) // returns array of recipe entity
            return datas.first

            // print("Recipe : \(recipe?.id ?? "")")
        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
            return nil
        }
    }

    private func fetchRecipe(from id: String) {
        let recipeEntity = getRecipeEntity(from: id)
        recipe = recipeEntity?.toRecipe()
    }
    
    func showDeleteAlert() {
        showAlert = true
        alertMessage = "Is Recipe Deleted"
    }
    

    public func deleteRecipe() -> Bool {
        if let entity = getRecipeEntity(from: recipe?.id ?? "") {
            manager.context.delete(entity)
            let isSuccess = manager.save()
            if isSuccess {
                return true
               
            }
        }
       return false
    }
}

private extension RecipeEntity {
    func toRecipe() -> Recipe {
        return Recipe(name: name ?? "",
                      details: NSAttributedString(),
                      ingredients: ingridients ?? "",
                      duration: duration ?? "",
                      image: imageUrl?.absoluteString,
                      category: category ?? "",
                      id: id ?? "")
    }
}
