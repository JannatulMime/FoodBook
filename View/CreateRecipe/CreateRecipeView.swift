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
        topBarConfig = CommonTopBarData(title: isEdit ? "Edit" : "Create", bgColor: Color.theme.merun, leftIconName: "chevron.left", rightIconName: isEdit ? "xmark.circle" : "")
    }

    var body: some View {
        ScrollView {
            VStack {
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
            
        }.ignoresSafeArea()
        
    
    }
}

#Preview {
    CreateRecipeView()
}

extension CreateRecipeView {
    var contentView: some View {
//        VStack(alignment: .leading, spacing: 15) {
        VStack(spacing: 20) {
                recipeTitle

                description
            
                selectImageView

                ingredients
           
                selectCategory

                durationTime

               
            Spacer()
            saveOption
            Spacer().frame(height: 5)
        }
        .background(Color.white)
        .padding()
       
    }
}

extension CreateRecipeView {
    var selectCategory: some View {
        HStack() {
            Text("Category - ")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.gray)

            Picker("Catagory", selection: $vm.category) {
                ForEach(catagories, id: \.self) { catagory in
                    Text(catagory)
                       
                }
            }.pickerStyle(MenuPickerStyle())
                .tint(.orange)
               
            Spacer()
        }
        .frame(height: 20)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                   
                
            )
        
        
    }

    var saveOption: some View {
        HStack {
            Button {
                vm.saveData()

            } label: {
                Text("Save")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                    .WithDefaultRectangularBgModifier(bgColor: Color.theme.merun, cornerRadius: 20)
                    .padding(.horizontal,50)
                    
            }
        }
        .alert(isPresented: $vm.showAlert) {
            Alert(title: Text("Invalid Input"), message: Text(vm.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    var recipeTitle: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))
            
            TextField("", text: $vm.title,
                      prompt: Text("Enter title")
                .font(.caption)
                .foregroundColor(.gray)
            )
            .foregroundStyle(.white)
            .frame(height: 15)
            .padding()
            
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                
            )
            
        }
    
    }
    
    var description: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))
            //.padding(.bottom, 2)
            
            RichTextFormView(placeHolder: "Details", text: $vm.description)
            
        }
    }

    var selectImageView: some View {
        VStack(alignment: .leading) {
            Text("Recipe Image")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))
            
            CustomImagePicker(selectedImageData: $vm.pickedImage)
                .frame(maxWidth: .infinity)
                .frame(height: 180)
        }
        
    }
    
    var ingredients: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))

            TextField("", text: $vm.ingredients,
                      prompt: Text("Write here your ingredients")
                          .font(.caption)
                          .foregroundColor(.gray)
            )
            .foregroundStyle(.white)
            .frame(height: 20)
            .padding()
            
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                   
            )

           
        }
    }
    
    var durationTime: some View {
        TextField("", text: $vm.duration,
                  prompt: Text("Duration Time")
            .foregroundColor(.gray)
        )
        .font(.caption)
        .foregroundStyle(.black)
        .frame(height: 15)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
        )
    

    }
}

