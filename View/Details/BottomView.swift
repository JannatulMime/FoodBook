//
//  BottomView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 12/10/24.
//

import SwiftUI

struct BottomView: View {
    
    @StateObject var vm = BottomVM()
    @Binding var getRecipe: Recipe?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            recipeName
           
            verticalItem
           
            describeRecipe
            
            recipeReviews
            
           // Spacer()
        } .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(20)
           // .ignoresSafeArea()
        //.background(Color.green)
       
    }
}

#Preview {
    BottomView(getRecipe: .constant(nil))
}

extension BottomView {
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
                Text ("Ingredients")
                    .font(.system(size:12))
                    .fontWeight(.bold)
                    
                
                Text("06")
                    .font(.system(size: 10))
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            
            VStack {
                Text ("Preparation Time -")
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
            Text("About Recipe")
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


