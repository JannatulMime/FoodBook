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
    @Published var pickedImage : Data?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""


    @Published var recipe: Recipe = Recipe(name: "", details: NSAttributedString(string: ""), ingredients: "", totalTime: "", image: "", category: "")

    let manager = CoreDataManager.instance
    @Published var savedEntities: [RecipeEntity] = []

    private func addRecipe() {
        
        var imagePath = ""
        if let imageData = pickedImage {
            imagePath = saveImageToDocumentsDirectory(imageData: imageData) ?? ""
        }
        
        let newRecipe = RecipeEntity(context: manager.context)
        newRecipe.name = title
        newRecipe.category = category
        newRecipe.ingridients = ingredients
        newRecipe.id = UUID().uuidString
        newRecipe.imageUrl = URL(string: imagePath)

        let isSuccessSave = manager.save()

        goRecipeListPage = isSuccessSave
    }

    func saveData() {
       // let isValid = isValidData()

        let (isValid,message) = isValidDataWithTouple()

        if isValid{
            
            addRecipe()
            
        } else {
            showAlert = true
            alertMessage = message
           
        }
    }

    func createRecipe() -> Recipe {
        return Recipe(name: title, details: description, ingredients: ingredients, totalTime: duration, image: "", category: category)
    }

//    private func isValidData() -> Bool {
//        if title.isEmpty || description.length <= 0 || ingredients.isEmpty || category.isEmpty || duration.isEmpty {
//          //  print(" Validation False")
//            alertMessage = "Invalid input."
//            showAlert = true
//            return false
//        } else {
//            print(" Validation True")
//            return true
//        }
//    }
    
    private func isValidDataWithTouple() -> (Bool,String) {
        if title.isEmpty {
            return (false, "Please input title")
        }
        if description.length <= 0 {
            return (false, "Please input description")
        }
        if ingredients.isEmpty {
            return (false, "Please input ingredients")
        }
        if category.isEmpty {
            return (false, "Please input category")
        }
        if duration.isEmpty {
            return (false, "Please input duration")
        }
        if pickedImage == nil {
            return (false, "Please select an image")
        }
        
//        if title.isEmpty || description.length <= 0 || ingredients.isEmpty || category.isEmpty || duration.isEmpty {
//          //  print(" Validation False")
//           // alertMessage = "Invalid input."
//            showAlert = true
//            return (false, "Invalid input.")
//        }
//        
        return (true,"")
    }
    
    
    private func saveImageToDocumentsDirectory(imageData: Data) -> String? {
        let fileManager = FileManager.default
        
        // Get the URL for the app's documents directory
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        // Create a unique file name
        let fileName = UUID().uuidString + ".jpg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        do {
            // Save the image data to the file URL
            try imageData.write(to: fileURL)
            print("Image saved to: \(fileURL)")
            return fileURL.path
        } catch {
            print("Failed to save image: \(error.localizedDescription)")
            return nil
        }
    }

}
