//
//  FoodBookApp.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI
import CoreData

@main
struct FoodBookApp: App {
  //  let createRecipe = CreateRecipeVM.shared
    
    var body: some Scene {

        WindowGroup {
     //      ContentView()
            //CustomTabView()
      //  CreateRecipeView()
       RecipeListView()
         //   TestMediaPicker()
            //SaveImage()
            
              //  .environment(\.managedObjectContext, createRecipe.container.viewContext)
        }
    }
}
