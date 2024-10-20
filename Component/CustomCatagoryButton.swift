//
//  CustomCatagoryButton.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct CustomCatagoryButton: View {
    @State var catagory: String = "Desert"
    
    var body: some View {
        Button{
            
        }label: {
            HStack {
                Text(catagory)
                
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    //.background(Color.purple.opacity(0.6))
                    //.cornerRadius(15)
                
                    .WithDefaultRectangularBgModifier(bgColor: .purple.opacity(0.6), cornerRadius: 15)
                
            }
        }
    }
}

#Preview {
    CustomCatagoryButton()
}
