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
        ScrollView {
        VStack(alignment: .leading) {
            ForEach(vm.savedEntities) { data in
                SingleItemList(name: data.name ?? "", duration: data.totalTime ?? "", ingridients: data.ingridients ?? "")
            }
        
            
//            List {
//                ForEach(vm.savedEntities, id: \.name) { entity in
//                  
//               // Text(entity.name ?? "No Name")
//                    SingleItemList(name: entity.name ?? "", duration: entity.totalTime ?? "", ingridients: entity.ingridients ?? "")
//                        
//                        .onTapGesture {
//                            
//                            selectedRecipeID = entity.id ?? ""
//                            vm.gotoDetailsPage = true
//                        }
//                    
//                }
//
//            }.listStyle(PlainListStyle())
        }
        
        }
       
            
        .navigationDestination(isPresented: $vm.gotoDetailsPage, destination: {
            RecipeDetailsView(recipeId: selectedRecipeID)
        })
    }
}

#Preview {
    RecipeListView()
}


//extension RecipeListView {
//    var itemList: some View {
//        HStack {
//            Image("Rice")
//                .resizable()
//                .frame(width: 50, height: 40)
//                .cornerRadius(10)
//            
//            VStack(alignment: .leading) {
//                HStack {
//                    Text("Recipe Name")
//                        .font(.system(size: 12))
//                    
//                    Spacer()
//                    
//                    HStack(spacing: 3) {
//                    
//                    Image(systemName: "clock")
//                        .resizable()
//                        .frame(width: 5, height: 5)
//                    Text("1h 40m")
//                        .font(.system(size: 8))
//                }
//                
//            }
//                .foregroundStyle(.red)
//                
//               
//                    Text("Catagory")
//               
//            }.font(.system(size: 8))
//            
//        }
//    }
//}
//
