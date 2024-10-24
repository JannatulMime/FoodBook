//
//  SingleItemList.swift
//  FoodBook
//
//  Created by Habibur Rahman on 23/10/24.
//

import SwiftUI

struct SingleItemList: View {
     let image: String = ""
     let name: String
     let duration: String
     let ingridients: String
    
    var body: some View {
        
        HStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 40)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    HStack(spacing: 3) {
                    
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 5, height: 5)
                        Text(duration)
                        .font(.system(size: 8))
                }
                
            }
                .foregroundStyle(.red)
                
               
                Text(ingridients)
               
            }.font(.system(size: 8))
            
        }
        .padding()
        .WithDefaultRectangularBgModifier(bgColor: .gray.opacity(0.5), cornerRadius: 10)
            .padding(.horizontal)
        
    }
}

#Preview {
    SingleItemList(name: "Biriyani", duration: "1h 40m", ingridients: "02 ingridients")
}
