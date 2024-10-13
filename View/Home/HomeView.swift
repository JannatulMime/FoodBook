//
//  HomeView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HorizontalCatagoryList()
                .padding()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    ForEach(0..<5) { recipe in
                        VerticalRecipeItem(title1: "Biriyani", image1: "Rice1", title2: "Chicken Fry", image2: "Chicken")
                    }
                }
            }
        }.background(.black)
       
    }
}

#Preview {
    HomeView()
}
