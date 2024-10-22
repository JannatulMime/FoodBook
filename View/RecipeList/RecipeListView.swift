//
//  RecipeListView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import SwiftUI

struct RecipeListView: View {
   
    @StateObject var vm = RecipeListVM()
    @State var selectedRecipeID: String = ""
   
    var body: some View {
        VStack {
            // Text(items.name)

            List {
                ForEach(vm.savedEntities, id: \.name) { entity in
                  
                    Text(entity.name ?? "No Name")
                        .onTapGesture {
                            
                            selectedRecipeID = entity.id ?? ""
                            vm.gotoDetailsPage = true
                        }
                    
                }

            }.listStyle(PlainListStyle())
        }
        
        .navigationDestination(isPresented: $vm.gotoDetailsPage, destination: {
            RecipeDetailsView(recipeId: selectedRecipeID)
        })
    }
}

#Preview {
    RecipeListView()
}
