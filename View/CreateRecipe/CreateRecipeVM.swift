//
//  CreateRecipeVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import Foundation

class CreateRecipeVM: ObservableObject {
    
    
    @Published var title: String = ""
    @Published var description: NSAttributedString = NSAttributedString.empty
    @Published var ingredients: String = ""
    @Published var category: String = ""
    @Published var duration: String = ""
    

    func save(){
        // check is Valid
        let isValid = isValidData()
        //If valid then save the recipoe
        if isValid {
            //Save the recipe
            
            
        }else{
            // Show Alert with message - "Please fill all required fields.."
        }
        
        //If not valid then show a alert
    }
    
    func createRecipe(){
        let _ = Recipe(name: title, details: description, ingredients: ingredients, totalTime: duration, image: "", category: category)
    }
    
    private func isValidData() -> Bool {
        if title.isEmpty || description.length <= 0 || ingredients.isEmpty || category.isEmpty || duration.isEmpty {
            print(" Validation False")
            return false
        } else {
            print(" Validation True")
            return true
        }
    }
}



