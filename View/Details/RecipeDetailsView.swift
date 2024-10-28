//
//  RecipeDetailsView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @StateObject var vm : RecipeDetailsVM
    @Environment(\.presentationMode) var presentationMode

    
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
            
            VStack(spacing: 15) {
                recipeName
                
                verticalItem
                
                describeRecipe
                
                recipeReviews
                
               
            }.padding(.horizontal)
            Spacer()
        }.background(Color.black)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
    // Function to load an image from the app's directory
    private func loadImageFromDocumentsDirectory(path: String) -> UIImage? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            return UIImage(contentsOfFile: path)
        } else {
            print("File does not exist at path: \(path)")
            return nil
        }
    }

}

#Preview {
    RecipeDetailsView(recipeId: "")
    
    /*recipe: Recipe(name: "Test Recipe", details: "".toNsAttributedString(), ingredients: "", totalTime: "100", image: "", category: ""), getRecipe: .constant(nil)*/
}


extension RecipeDetailsView {
    var overlayView: some View {
        
        HStack {
            
            Image(systemName: "chevron.left")
                .foregroundStyle(.orange)
               // .padding()
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
               // .padding(.top, 20)
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .foregroundStyle(.orange)
            
            
        }.padding(.horizontal, 20)
            .padding(.top, 50)
        
    }
    
    var topView: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            
            if let path = vm.recipe?.image, let uiImage = loadImageFromDocumentsDirectory(path: path) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 350)
            }else{
                Image(vm.recipe?.image ?? "Rice1")
                    .resizable()
                    .frame(width: 400, height: 350)
                    .scaledToFit()
            }
            
          
//           
//            Text("Biriyani")
//                .foregroundStyle(.orange)
//                .padding()
                
        }
    }
    
    var recipeName: some View {
        HStack {
            Text(vm.recipe?.name ?? "No Data")
                .font(.system(size: 25 , weight: .bold))
               
            Spacer()
            
            VStack {
                Text ("Duration")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                
                Text (vm.recipe?.totalTime ?? "No time")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
            }
            
        } .foregroundStyle(.orange)
    }
    
    var verticalItem: some View {
        HStack {
            VStack {
                Text("Ingredients")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundStyle(.orange)
                
                Text (vm.recipe?.ingredients ?? "No data")
                    .font(.system(size: 10))
                    .foregroundStyle(.gray)
                   
            }
            
            Spacer()
            
                VStack {
                    
                    Text("Catagory")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundStyle(.orange)
                    
                    Text(vm.recipe?.category ?? "No data")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                       
                }
           
        }
           
        }
    
    var describeRecipe: some View {
        VStack(alignment: .leading) {
            Text("Details")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.orange)
            
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
                    .foregroundStyle(.orange)
                
                Text("Cathrin James")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            
            VStack {
                Text ("Rating")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.orange)
                
                Text("4.5")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.gray)
            }
            
              
        }
        
    }
    
}
