//
//  HomePage.swift
//  FoodBook
//
//  Created by Habibur Rahman on 31/10/24.
//

import SwiftUI

struct RootView: View {
    @State var gotoHomeView: Bool = false
    @State var gotoCreateRecipeView: Bool = false
    @State var gotoRecipeListView: Bool = false
    // var viewName: String = ""

    var body: some View {
        //NavigationStack {
            VStack(spacing: 50) {
                homeView
                listView
                createRecipeView
            }

            .navigationDestination(isPresented: $gotoRecipeListView, destination: {
                RecipeListView()
            })

            .navigationDestination(isPresented: $gotoCreateRecipeView, destination: {
                CreateRecipeView()
            })

            .navigationDestination(isPresented: $gotoHomeView, destination: {
                HomeView()
            })
       // }
    }
//    func modifyTextsize(viewName: String) {
//        Text(viewName)
//        .foregroundStyle(.white)
//        .frame(width: 300, height: 50)
//        .padding(.horizontal, 20)
//        .background(Color.gray.opacity(0.5))
//        .cornerRadius(10)
//
//    }
}

#Preview {
    RootView()
}

extension RootView {
    var homeView: some View {
        Button(action: {
            gotoHomeView = true
        }) {
            Text("HomeView")
                .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .WithDefaultRectangularBgModifier(bgColor: .gray.opacity(0.5), cornerRadius: 10)
                .padding(.horizontal, 30)
        }
    }

    var listView: some View {
        Button(action: {
            gotoRecipeListView = true
        }) {
            Text("ListView")
                .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .WithDefaultRectangularBgModifier(bgColor: .cyan, cornerRadius: 10)
                .padding(.horizontal, 30)
        }
    }

    var createRecipeView: some View {
        Button(action: {
            gotoCreateRecipeView = true
        }) {
            Text("CreateRecipeView")

                .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .WithDefaultRectangularBgModifier(bgColor: .gray.opacity(0.5), cornerRadius: 10)
                .padding(.horizontal, 30)
        }
    }
}
