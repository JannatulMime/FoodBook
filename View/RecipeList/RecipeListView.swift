//
//  RecipeListView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject var vm = RecipeListVM()
    @State var selectedRecipeID: String = ""

    let topBarConfig = CommonTopBarData(title: "Recipe List", bgColor: Color.red, leftIconName: "chevron.left", rightIconName: "plus.circle")

    var body: some View {
        CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
            self.presentationMode.wrappedValue.dismiss()
        }, onRightButtonClicked: { vm.goToCreateRecipe = true }
        )

        content

            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $vm.gotoDetailsPage, destination: {
                RecipeDetailsView(recipeId: selectedRecipeID)
            })

            .navigationDestination(isPresented: $vm.goToCreateRecipe, destination: {
                CreateRecipeView()
            })
    }
}

#Preview {
    RecipeListView()
}

extension RecipeListView {
    var content: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(vm.savedEntities) { data in
                    SingleItemList(image: data.imageUrl?.absoluteString ?? "", name: data.name ?? "", duration: data.duration ?? "", ingridients: data.ingridients ?? "")

                        .onTapGesture {
                            selectedRecipeID = data.id ?? ""
                            vm.gotoDetailsPage = true
                        }
                }
            }
        }
    }
}
