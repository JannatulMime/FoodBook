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
        HStack {
            
            TextField("Find a recipe", text: .constant(""))
                
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray ,radius: 3, x: 2, y: 3)
                .padding(.horizontal, 30)
                
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
        }
     
        //.background(.black)
        //.padding(.bottom, 30)
    }
}

#Preview {
    SearchView()
}
