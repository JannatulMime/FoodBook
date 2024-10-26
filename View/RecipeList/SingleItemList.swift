//
//  SingleItemList.swift
//  FoodBook
//
//  Created by Habibur Rahman on 23/10/24.
//

import SwiftUI

struct SingleItemList: View {
     let image: String
     let name: String
     let duration: String
     let ingridients: String
    
    var body: some View {
        
        HStack {
           Image(image)
                .resizable()
                .frame(width: 60, height: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.system(size: 15))
                    
                    Spacer()
                    
                    HStack(spacing: 3) {
                    
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 10, height: 10)
                        Text(duration)
                        .font(.system(size: 10))
                }
                
                }
                .foregroundStyle(.cyan)
                
               
                Text("\(ingridients) ingridients")
                    .foregroundStyle(.gray)
               
            }.font(.system(size: 10))
                .fontWeight(.bold)
            
        }
        .padding(.all, 10)
        .WithDefaultRectangularBgModifier(bgColor: .black, cornerRadius: 10)
            .padding(.horizontal)
        
    }
}

#Preview {
    SingleItemList(image: "Rice1", name: "Biriyani", duration: "1h 40m", ingridients: "02")
}
