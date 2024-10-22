//
//  RecipeListVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import Foundation
import CoreData

class RecipeListVM: ObservableObject {
    @Published var savedEntities: [RecipeEntity] = []
    
   // @Published var getRecipe: Recipe?
    let manager = CoreDataManager.instance
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        let request = NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
        
        do {
            savedEntities = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching, \(error)")
        }
    }
    
}
