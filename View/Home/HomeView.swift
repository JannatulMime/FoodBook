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
            HorizontalCatagoryList()
                .padding()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    ForEach(vm.savedEntities) { recipe in
                        VerticalRecipeItem(title1: recipe.name ?? "", image1: recipe.imageUrl?.absoluteString ?? "", title2: recipe.name ?? "", image2: recipe.imageUrl?.absoluteString ?? "")
                    }
                }
            }
        }//.background(.black)
       
    }
}

#Preview {
    HomeView()
}
