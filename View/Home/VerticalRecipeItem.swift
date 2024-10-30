//
//  VerticalRecipeItem.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct VerticalRecipeItem: View {
    @State var title1: String = ""
    @State var image1: String = ""
    @State var title2: String = ""
    @State var image2: String = ""

    var body: some View {
        HStack(spacing: 20) {
            ZStack(alignment: .bottomLeading) {
                Image(image1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 200)
                    .background()
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 3, y: 5)

                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.purple)
                        .padding(.bottom, 170)

                }.padding(.leading, 130)

                Text(title1)
                   
                    .modifier(CustomTextModifier(fontSize: 10, color: .purple, weight: .bold))
                    .padding(.leading, 10)
                
            }

            ZStack(alignment: .bottomLeading) {
                Image(image2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 200)
                    .background()
                    .cornerRadius(8)
                    .shadow(color: .gray, radius: 5, x: 3, y: 5)
            
                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.purple)
                        .padding(.bottom, 170)

                }.padding(.leading, 130)

                Text(title2)
                    .modifier(CustomTextModifier(fontSize: 10, color: .purple, weight: .bold))
                    .padding(.leading, 10)
            }

        }.padding()
    }
}

#Preview {
    VerticalRecipeItem()
}
