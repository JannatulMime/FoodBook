//
//  RecipeDetailsVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import Foundation

class RecipeDetailsVM: ObservableObject {
    @Published var getRecipe: Recipe?
    
    
    init(recipeId : String){
        print("Received rcipe id  : \(recipeId)")
        fetchRecipe(from: recipeId)
    }
    
    private func fetchRecipe(from id: String){
        
    }
    
//    private func getRecordEntityFromId(id: String) -> RecordEntity? {
//        let request = RecordEntity.fetchRequest() // (entityName: Constants.CORE_DATA.RecordEntity)
//        let idPredicate = NSPredicate( format: "id = %@", id)
//        request.predicate = idPredicate
//        do {
//            let datas = try manager.context.fetch(request)
//            return datas.first
//
//        } catch {
//            print("Error Fetching.. \(error.localizedDescription)")
//        }
//
//        return nil
//    }

}
