//
//  HomeView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeVM()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(spacing: 20) {
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                   
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.blue)
            }
            .padding()
            
            HorizontalCatagoryList()
                .padding()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    ForEach(vm.savedEntities) { recipe in
                        VerticalRecipeItem(title1: recipe.name ?? "", image1: recipe.fileName ?? "", title2: recipe.name ?? "", image2: recipe.fileName ?? "")
                    }
                }
            }
        }//.background(.black)
       
    }
}

#Preview {
    HomeView()
}
