//
//  CreateOwnRecipeView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import RichTextKit
import SwiftUI

struct CreateRecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm: CreateRecipeVM
    var catagories = ["Dessert", "Breakfast", "Lunch", "Dinner", "Drinks"]
    var topBarConfig : CommonTopBarData

    init(recipe: Recipe? = nil) {
        _vm = StateObject(wrappedValue: CreateRecipeVM(recipe: recipe))
        let isEdit = recipe != nil
        topBarConfig = CommonTopBarData(title: isEdit ? "Edit" : "Create", bgColor: Color.green, leftIconName: "chevron.left", rightIconName: isEdit ? "xmark.circle" : "")
    }

    var body: some View {
        
        CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
            self.presentationMode.wrappedValue.dismiss()
        },onRightButtonClicked: {
            self.presentationMode.wrappedValue.dismiss()
    
        })
        
        contentView
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $vm.goRecipeListPage, destination: {
                RecipeListView()
            })
    }
}

#Preview {
    CreateRecipeView()
}

extension CreateRecipeView {
    var contentView: some View {
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

            selectImageView
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()

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
            Button {
                vm.saveData()

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
        }
        .alert(isPresented: $vm.showAlert) {
            Alert(title: Text("Invalid Input"), message: Text(vm.alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    var selectImageView: some View {
        CustomImagePicker(selectedImageData: $vm.pickedImage)
    }
}
