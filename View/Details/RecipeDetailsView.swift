//
//  RecipeDetailsView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @StateObject var vm : RecipeDetailsVM
    
    init(recipeId : String) {
        _vm = StateObject(wrappedValue: RecipeDetailsVM(recipeId: recipeId))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            topView
                .overlay(
                    overlayView,
                     alignment: .top
            )
            
            VStack {
                recipeName
                
                verticalItem
                
                describeRecipe
                
                recipeReviews
                
               
            }.padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    RecipeDetailsView(recipeId: "")
    
    /*recipe: Recipe(name: "Test Recipe", details: "".toNsAttributedString(), ingredients: "", totalTime: "100", image: "", category: ""), getRecipe: .constant(nil)*/
}


extension RecipeDetailsView {
    var overlayView: some View {
        
        HStack{
            
            Image(systemName: "chevron.left")
                .foregroundStyle(.orange)
                .padding()
//                .onTapGesture {
//                    self.presentationMode.wrappedValue.dismiss()
//                }
                //.padding(.top, 5)
            
            
            Spacer()
            
            
        }
        
    }
    
    var topView: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            Image("Rice2")
                .resizable()
                .frame(width: 400, height: 300)
                .scaledToFit()
           
            Text("Biriyani")
                .foregroundStyle(.orange)
                .padding()
                
        }
    }
    
    
    var recipeName: some View {
        HStack {
            Text(vm.getRecipe?.name ?? "No Data")
                .font(.system(size: 20 , weight: .bold))
               
            Spacer()
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
               
            
        } .foregroundStyle(.cyan)
    }
    
    var verticalItem: some View {
        HStack {
            VStack {
                Text (vm.getRecipe?.ingredients ?? "")
                    .font(.system(size:12))
                    .fontWeight(.bold)
                    
                
                Text(vm.getRecipe?.category ?? "")
                    .font(.system(size: 10))
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            
            VStack {
                Text (vm.getRecipe?.totalTime ?? "")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                  
                
                Text ("1 hr")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                
            }
        }
           
        }
    
    var describeRecipe: some View {
        VStack(alignment: .leading) {
            Text("Details")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.cyan)
            
            Text("Veg chesse grilled sandwich is a quick and easy to make sandwich that is perfect for a summer lunch.")
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(.gray)
            
        
        }
    }
    
    var recipeReviews: some View {
        HStack {
            VStack(alignment: .leading) {
                Text ("Reviews")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.cyan)
                
                Text("Cathrin James")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            
            VStack {
                Text ("Rating")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.cyan)
                
                Text("4.5")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.gray)
            }
            
              
        }
        
    }
    

    
}
