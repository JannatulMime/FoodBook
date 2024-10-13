//
//  Testfordropdown.swift
//  FoodBook
//
//  Created by Habibur Rahman on 9/10/24.
//

import SwiftUI

struct Testfordropdown: View {
    var catagories = ["Desert", "Breakfast", "Lunch", "Dinner"]
    @State private var selectedCatagory: String = "Desert"

    var body: some View {
        VStack {
            Picker("Catagory", selection: $selectedCatagory) {
                ForEach(catagories, id: \.self) { catagory in
                    Text(catagory)
                       
                }
            }.pickerStyle(MenuPickerStyle())
                .tint(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )
        }
    }
}

#Preview {
    Testfordropdown()
}
