//
//  RecipeDetailsView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @State var recipe: Recipe
    
    var body: some View {
       
        Text("Recipe Name - \(recipe.name)")
    }
}

#Preview {
    RecipeDetailsView(recipe: Recipe(name: "Test Recipe", details: "".toNsAttributedString(), ingredients: "", totalTime: "100", image: "", category: ""))
}
