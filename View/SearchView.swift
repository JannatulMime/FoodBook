//
//  SearchView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct SearchView: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack(spacing: 10) {
            Image("Kheer")
                .resizable()
                .frame(height: 300)
                .frame(maxWidth: .infinity)
            
            
            TextField("Find a recipe", text: .constant(""))
                
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .yellow ,radius: 5, x: 3, y: 3)
                .padding(.horizontal, 40)
            
            Spacer()
            
//            GeometryReader { geometry in
//                RoundedRectangle(cornerRadius: 10)
//                
//            }.frame(width: 300, height: 350)
//                .background(.white)
//                .padding()
            
//                .sheet(isPresented: $showingSheet) {
//                           Text("This app was brought to you by Hacking with Swift")
//                               .presentationDetents([.medium, .large])
//                       }
//            
        }.background(.black)
        //.padding(.bottom, 30)
    }
}

#Preview {
    SearchView()
}
