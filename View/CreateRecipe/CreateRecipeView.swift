//
//  CreateOwnRecipeView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import RichTextKit
import SwiftUI

struct CreateRecipeView: View {
    // @State private var showingSheet: Bool = false
    var catagories = ["Dessert", "Breakfast", "Lunch", "Dinner", "Drinks"]

    @State var isSuccess: Bool = false

    @StateObject var vm = CreateRecipeVM()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Title")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))

            TextField("", text: $vm.title,
                      prompt: Text("Enter title")
                          .font(.caption)
                          .foregroundColor(.gray)
            )
            .foregroundStyle(.black)
            .padding(.all, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
            )

            Text("Description")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))
                .padding(.bottom, 2)

            RichTextFormView(placeHolder: "Details", text: $vm.description)
            // .frame(maxHeight: 200)

            PhotoPickerView()
                .frame(height: 200)

            Text("Ingredients")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))

            TextField("", text: $vm.ingredients,
                      prompt: Text("Write here your ingredients")
                          .font(.caption)
                          .foregroundColor(.gray)
            )
            .foregroundStyle(.black)
            .padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
            )

            HStack {
                selectCategory

                Spacer()

                TextField("", text: $vm.duration,
                          prompt: Text("Duration Time")
                              .foregroundColor(.gray)
                )
                .font(.caption)
                .padding()
                .frame(width: 120, height: 40)
                .foregroundStyle(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )
            }

            Spacer()
            saveOption
            Spacer()
        }
        .background(Color.white)
        .padding()

    }
}

#Preview {
    CreateRecipeView()
}

extension CreateRecipeView {
    var selectCategory: some View {
        HStack(spacing: 0) {
            Text("Category - ")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(Color.theme.primaryText)

            Picker("Catagory", selection: $vm.category) {
                ForEach(catagories, id: \.self) { catagory in
                    Text(catagory)
                       
                }
            }.pickerStyle(MenuPickerStyle())
                .tint(.orange)
               
        }.padding(.all, 5)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
            )
    }

    var saveOption: some View {
        HStack {
            Spacer()
            Button {
                vm.save()
            } label: {
                Text("Save")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .frame(width: 100, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                    )
            }

            // Spacer()
        }
    }
}
