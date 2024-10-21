//
//  RecipeListView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var vm = RecipeListVM()
    @State var recipe: Recipe
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
            entity: RecipeEntity.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \RecipeEntity.name, ascending: true)]
    ) var recipes: FetchedResults<RecipeEntity>

    
    var body: some View {
        VStack {
           // Text(items.name)
            
            List {
                ForEach(recipes, id: \.name) { entity in
                    Text(entity.name ?? "No Name")
                    
                    
                }
                
            }.listStyle(PlainListStyle())
        }
    }
}

#Preview {
    RecipeListView(recipe: Recipe(name: "Test Recipe", details: "".toNsAttributedString(), ingredients: "", totalTime: "100", image: "", category: ""))
}
