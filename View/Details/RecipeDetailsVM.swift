//
//  RecipeDetailsVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import Foundation
//import CoreData

class RecipeDetailsVM: ObservableObject {
    @Published var getRecipe: Recipe?
    
//    let container: NSPersistentContainer
//    @Published var savedEntities: [RecipeEntity] = []
//    
//    init() {
//        container = NSPersistentContainer(name: "RecipeContainer")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("Error Loading CORE DATA. \(error)")
//            }
//        }
//      
//    }
//    
//    func fetchRecipes() {
//        let request = NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
//        
//        do {
//            savedEntities = try container.viewContext.fetch(request)
//        } catch let error {
//            print("Error fetching, \(error)")
//        }
//    }
//    
//    func saveData() {
//        do {
//            try container.viewContext.save()
//            fetchRecipes()
//        } catch let error {
//            print("Error saving. \(error)")
//        }
//    }
}
