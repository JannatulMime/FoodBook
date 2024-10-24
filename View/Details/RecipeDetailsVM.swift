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

    private func fetchRecipe(from id: String) {
        let request = RecipeEntity.fetchRequest()
        let idPredicate = NSPredicate(format: "id = %@", id)
        request.predicate = idPredicate
        do {
            let datas = try manager.context.fetch(request) // returns array of recipe entity
            recipe = datas.first?.toRecipe()

            // print("Recipe : \(recipe?.id ?? "")")
        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }
    }
}

private extension RecipeEntity {
    func toRecipe() -> Recipe {
        return Recipe(name: name ?? "",
                      details: NSAttributedString(),
                      ingredients: ingridients ?? "",
                      totalTime: totalTime ?? "",
                      image: imageUrl?.absoluteString,
                      category: category ?? "",
                      id: id ?? "")
    }
}
