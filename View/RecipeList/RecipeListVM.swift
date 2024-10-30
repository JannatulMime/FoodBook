//
//  RecipeListVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import Foundation
import CoreData

class RecipeListVM: ObservableObject {
    @Published var gotoDetailsPage: Bool = false
    @Published var savedEntities: [RecipeEntity] = []
    
    @Published var recipies : [Recipe] = [Recipe]()
    let manager = CoreDataManager.instance
    
    
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        let request = NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
        
        do {
            savedEntities = try manager.context.fetch(request)
//            for singleEntity in savedEntities {
//
//                recipies.append(Recipe(name: singleEntity.name ?? "", details: NSAttributedString(), ingredients: singleEntity.description, totalTime: singleEntity.totalTime ?? "", image: singleEntity.imageUrl?.absoluteString ?? "", category: singleEntity.category ?? "", id: singleEntity.id ?? ""))
//            }
        } catch let error {
            print("Error fetching, \(error)")
        }
    }
    
//    func deleteItems(indexSet: IndexSet) {
//        guard let index = indexSet.first else { return }
//        let entity = savedEntities[index]
//        manager.context.delete(entity)
//        }
//    
}
