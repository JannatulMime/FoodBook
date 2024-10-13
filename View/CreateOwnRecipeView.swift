//
//  CreateOwnRecipeView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI
import RichTextKit

struct CreateOwnRecipeView: View {
    @State private var showingSheet: Bool = false
    @State var detailsText : NSAttributedString = NSAttributedString()

    var catagories = ["Dessert", "Breakfast", "Lunch", "Dinner", "Drinks"]
    @State private var selectedCatagory: String = "Dessert"

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Title")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)

            TextField("", text: .constant(""),
                      prompt: Text("Enter title")
                .font(.caption)
                .foregroundColor(.gray)
            )
            .foregroundStyle(.white)
                .padding(.all, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )

            
            RichTextViewer(detailsText)
            Text("Description")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)

            
            Text("asd")
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.all, 20)
                .frame(maxWidth: .infinity)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                        .frame(maxWidth: .infinity)
                )
                .onTapGesture {
                    showingSheet.toggle()
                }

            PhotoPickerView()
                .frame(height: 200)
            
            Text("Ingredients")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)

            TextField("", text: .constant(""),
                      prompt: Text("Write here your ingredients")
                .font(.caption)
                .foregroundColor(.gray)
            )
            .foregroundStyle(.white)
                .padding(.all, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )

            HStack {
                selectCategory

                Spacer()

//                    Text("Duration Time")
//                        .font(.subheadline)
//                        .fontWeight(.bold)

                // TextField("Duration Time ", text: .constant(""))
                TextField("", text: .constant(""),
                          prompt: Text("Duration Time")
                              .foregroundColor(.gray)
                )
                .font(.caption)
                .padding()
                .frame(width: 120, height: 40)
                .foregroundStyle(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )
            }

            Spacer()
            saveOption
            Spacer()

        }.padding()

            .background(Color.black)
            .sheet(isPresented: $showingSheet) {
                DetailsInputView(attrText: $detailsText)
                    .presentationDetents([.large])
            }
    }
}

#Preview {
    CreateOwnRecipeView()
}

extension CreateOwnRecipeView {
    var selectCategory: some View {
        HStack(spacing: 0) {
            Text("Category - ")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)

            Picker("Catagory", selection: $selectedCatagory) {
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
}

extension CreateOwnRecipeView {
    var saveOption: some View {
        HStack {
            Spacer()

            Button {
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
