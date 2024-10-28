//
//  RecipeDetailsVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import Foundation

class RecipeDetailsVM: ObservableObject {
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

    public func deleteRecipe(for id: String) {
        if let entity = getRecipeEntity(from: id) {
            manager.context.delete(entity)
            let isSuccess = manager.save()
            if isSuccess {
                print("success delete ")
                recipe = nil
            }
        }
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
