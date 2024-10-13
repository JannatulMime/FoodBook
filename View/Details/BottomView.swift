//
//  BottomView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 12/10/24.
//

import SwiftUI

struct BottomView: View {
    
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            recipeName
           
            verticalItem
           
            describeRecipe
            
            recipeReviews
            
           // Spacer()
        } .padding()
            .background(.gray)
            .cornerRadius(20)
           // .ignoresSafeArea()
        //.background(Color.green)
       
    }
}

#Preview {
    BottomView()
}

extension BottomView {
    var recipeName: some View {
        HStack {
            Text("Recipe Name")
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
                    .foregroundStyle(.white)
                
            }
            Spacer()
            
            VStack {
                Text ("Preparation Time -")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                  
                
                Text ("1 hr")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
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
                .foregroundStyle(.white)
            
        
        }
    }
    
    var recipeReviews: some View {
        HStack {
            VStack {
                Text ("Reviews")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.cyan)
                
                Text("Cathrin James")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.white)
                
            }
            Spacer()
            
            Text ("Rating")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.cyan)
            
              
        }
        
    }
    
}


