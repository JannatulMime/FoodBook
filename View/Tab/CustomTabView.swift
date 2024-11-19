//
//  CustomTabView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct CustomTabView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
       // UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            
            RootView()
            .tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(0)
            
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }.tag(1)
              
            
            CreateRecipeView()
                .tabItem {
                    VStack {
                        Image(systemName: "frying.pan")
                        Text("Recipe")
                    }
                }.tag(2)
            
            
            LoginProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                }.tag(3)
            
        }.tint(.yellow)
            
           
        
    }
}

#Preview {
    CustomTabView()
}
