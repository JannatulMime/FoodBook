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

    var body: some View {
        NavigationStack {
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
        }
    }
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
                .foregroundStyle(.white)
                .frame(width: 300, height: 50)
                .padding(.horizontal, 20)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
        }
    }

    var listView: some View {
        Button(action: {
            gotoRecipeListView = true
        }) {
            Text("ListView")
                .foregroundStyle(.white)
                .frame(width: 300, height: 50)
                .padding(.horizontal, 20)
                .background(Color.cyan)
                .cornerRadius(10)
        }
    }

    var createRecipeView: some View {
        Button(action: {
            gotoCreateRecipeView = true
        }) {
            Text("CreateRecipeView")
                .foregroundStyle(.white)
                .frame(width: 300, height: 50)
                .padding(.horizontal, 20)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
        }
    }
}
