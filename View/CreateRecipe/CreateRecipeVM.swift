//
//  CreateRecipeVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import Foundation
import CoreData

class CreateRecipeVM: ObservableObject {
    
    @Published var title: String = ""
    @Published var description: NSAttributedString = NSAttributedString.empty
    @Published var ingredients: String = ""
    @Published var category: String = ""
    @Published var duration: String = ""
    @Published var goDetailsPage : Bool = false
    @Published var goRecipeListPage : Bool = false
    
    @Published var recipe: Recipe = Recipe(name: "", details: NSAttributedString.init(string: ""), ingredients: "", totalTime: "", image: "", category: "")
    
    

    let container: NSPersistentContainer
    @Published var savedEntities: [RecipeEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "RecipeContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading CORE DATA. \(error)")
            }
        }
        fetchRecipes()
      
    }
    
    func fetchRecipes() {
        let request = NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching, \(error)")
        }
    }
    
    func addRecipe(text: String) {
        let newRecipe = RecipeEntity(context: container.viewContext)
        newRecipe.name = text
        newRecipe.category = text
        newRecipe.ingridients = text
       
        saveData()
        
    }
    

    func saveData(){
        
        recipe = createRecipe()
       // goDetailsPage = true
        goRecipeListPage = true
        
        do {
            try container.viewContext.save()
            fetchRecipes()
        } catch let error {
            print("Error saving. \(error)")
        }
        
        
        // check is Valid
//        let isValid = isValidData()
//        //If valid then save the recipoe
//        if isValid {
//            //Save the recipe
//            
//            
//        } else {
//            // Show Alert with message - "Please fill all required fields.."
//        }
        
        //If not valid then show a alert
    }
    
    func createRecipe() -> Recipe {
        return Recipe(name: title, details: description, ingredients: ingredients, totalTime: duration, image: "", category: category)
    }
    
    func isValidData() -> Bool {
        if title.isEmpty || description.length <= 0 || ingredients.isEmpty || category.isEmpty || duration.isEmpty {
            print(" Validation False")
            return false
        } else {
            print(" Validation True")
            return true
        }
    }
}



