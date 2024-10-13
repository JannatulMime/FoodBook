//
//  HorizontalCatagoryList.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct HorizontalCatagoryList: View {
  //  @State var catagory: String = "Dessert"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<5) { catagories in
                    CustomCatagoryButton(catagory: "Dessert")
                    
                }
                
            }.padding()
        }
    }
}

#Preview {
    HorizontalCatagoryList()
}

//extension HorizontalCatagoryList {
//    var catagoryButton: some View {
//        Button{
//            
//        }label: {
//            HStack {
//                Text(catagory)
//                
//                    .font(.headline)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .frame(width: 100, height: 40)
//                    .background(Color.yellow.opacity(0.7))
//                    .cornerRadius(15)
//                
//            }
//        }
//    }
//}
