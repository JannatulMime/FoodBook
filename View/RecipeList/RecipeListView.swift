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
        
        NavigationStack{
            content
               
                .navigationDestination(isPresented: $vm.gotoDetailsPage, destination: {
                    RecipeDetailsView(recipeId: selectedRecipeID)
                })
        }

    }
    
}

#Preview {
    RecipeListView()
}

extension RecipeListView {
    var content : some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(vm.savedEntities) { data in
                    SingleItemList(image: data.imageUrl?.absoluteString ?? "", name: data.name ?? "", duration: data.duration ?? "", ingridients: data.ingridients ?? "")

                        .onTapGesture {
                            selectedRecipeID = data.id ?? ""
                            vm.gotoDetailsPage = true
                        }
                       
                }
                //.onDelete(perform: vm.deleteItems)
            }
        }
    }
}
