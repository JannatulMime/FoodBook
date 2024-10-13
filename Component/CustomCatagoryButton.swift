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
                
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color.yellow.opacity(0.8))
                    .cornerRadius(15)
                
            }
        }
    }
}

#Preview {
    CustomCatagoryButton()
}
