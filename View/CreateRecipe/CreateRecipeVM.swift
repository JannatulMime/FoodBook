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
   // @Published var duration: String = ""
    @Published var image: String? = ""
    @Published var numberOfTime:String = ""

    @Published var goRecipeListPage: Bool = false
    @Published var pickedImage: Data?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    

    @Published var savedEntities: [RecipeEntity] = []
    let localRecipeStore: CoreDataRecipeManager = CoreDataRecipeManager()

    var isEdit: Bool = false
    let localFileStore = LocalFileStore()

    init(recipe: Recipe?) {
        if let recipe = recipe {
            title = recipe.name
            description = recipe.details
            ingredients = recipe.ingredients
            category = recipe.category
            numberOfTime = recipe.duration
            image = recipe.image
            isEdit = true
        }
    }

    private func addRecipe() -> Bool {
        let fileName = UUID().uuidString + "_Local.jpg"
        if let imageData = pickedImage {
            let _ = localFileStore.saveImageInDefaultDirectory(imageData: imageData, fileName: fileName) //saveImageToDocumentsDirectory(imageData: imageData) ?? ""
        }

        let newRecipe = Recipe(name: title, details: description, ingredients: ingredients, duration: numberOfTime, image: fileName, category: category, id: UUID().uuidString)

        return localRecipeStore.addRecipe(recipe: newRecipe)
    }

    private func updateRecipe() -> Bool {
        let fileName = UUID().uuidString + "_Local.jpg"
        if let imageData = pickedImage {
            let _ = localFileStore.saveImageInDefaultDirectory(imageData: imageData, fileName: fileName) //saveImageToDocumentsDirectory(imageData: imageData) ?? ""
        }

        let newRecipe = Recipe(name: title, details: description, ingredients: ingredients, duration: numberOfTime, image: fileName, category: category, id: UUID().uuidString)

        let isSuccess = localRecipeStore.updateRecipe(recipe: newRecipe)
        return isSuccess
    }

    func saveData() {
        let (isValid, message) = isValid()

        if isValid == false {
            showAlert = true
            alertMessage = message
            return
        }

        let isSuccess = isEdit ? updateRecipe() : addRecipe()
        goRecipeListPage = isSuccess
    }

    func createRecipe() -> Recipe {
        return Recipe(name: title, details: description, ingredients: ingredients, duration: numberOfTime, image: "", category: category)
    }

    private func isValid() -> (Bool, String) {
        if title.isEmpty {
            return (false, "Please input title")
        }
//        if description.length <= 0 {
//            return (false, "Please input description")
//        }
        if ingredients.isEmpty {
            return (false, "Please input ingredients")
        }
        if category.isEmpty {
            return (false, "Please input category")
        }
        if numberOfTime.isEmpty {
            return (false, "Please input duration")
        }

        return (true, "")
    }

//    private func saveImageToDocumentsDirectory(imageData: Data) -> String? {
//        
//        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            return nil
//        }
//
//        // Create a unique file name
//        let fileName = UUID().uuidString + ".jpg"
//        let fileURL = documentsDirectory.appendingPathComponent(fileName)
//
//        do {
//            // Save the image data to the file URL
//            try imageData.write(to: fileURL)
//            print("Image saved to: \(fileURL)")
//            return fileURL.absoluteString
//        } catch {
//            print("Failed to save image: \(error.localizedDescription)")
//            return nil
//        }
//    }
}
