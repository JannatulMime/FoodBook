//
//  RecipeDetailsView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    @StateObject var vm: RecipeDetailsVM
    @Environment(\.presentationMode) var presentationMode
    let localFileStore = LocalFileStore()
    

    let topBarConfig = CommonTopBarData(title: "", bgColor: .clear, forgroundColor: .white, leftIconName: "chevron.left", rightIconName: "pencil")

    init(recipeId: String) {
        _vm = StateObject(wrappedValue: RecipeDetailsVM(recipeId: recipeId))
    }

    var body: some View {
        //   VStack {

        contentView
            .overlay(
                CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                    self.presentationMode.wrappedValue.dismiss()
                }, onRightButtonClicked: { vm.gotoCreateRecipe = true
                }
                )
                .padding(.bottom, 250)
                .offset(y: -250)
            )

            .overlay(
                floatingAddButton
                    .offset(x: 120)
            )

            .popover(isPresented: $vm.isAddButtonPressed) {
                CreateRecipeView(recipe: vm.recipe)
            }

            .navigationDestination(isPresented: $vm.gotoCreateRecipe, destination: {
                CreateRecipeView(recipe: vm.recipe)
            })
    }
}

#Preview {
    RecipeDetailsView(recipeId: "")

    /* recipe: Recipe(name: "Test Recipe", details: "".toNsAttributedString(), ingredients: "", totalTime: "100", image: "", category: ""), getRecipe: .constant(nil) */
}

extension RecipeDetailsView {
    var contentView: some View {
        ScrollView {
            VStack(spacing: 20) {
                topView

                    .overlay(
                        overlayView
                            .offset(x: 160)
                    )

                VStack(spacing: 15) {
                    recipeName

                    verticalItem

                    describeRecipe

                    recipeReviews

                    Spacer()
                    //                HStack {
                    //                    Spacer()
                    //                    deleteButton
                    //                }.padding()

                }.padding(.horizontal)
                Spacer()
            }
        }.background(Color.white)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
    }

    var overlayView: some View {
        VStack {
            Spacer()

            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .shadow(color: .yellow, radius: 3)
                .padding()
        }
    }

    var topView: some View {
        ZStack(alignment: .bottomLeading) {
            if let imageData = vm.recipe?.getImageData(),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 350)
            } else {
                Image(vm.recipe?.image ?? "effect")
                    .resizable()
                    .frame(width: 400, height: 350)
                    .scaledToFit()
            }
        }
    }

    var recipeName: some View {
        HStack {
            Text(vm.recipe?.name ?? "No Data")
                .font(.system(size: 25, weight: .bold))

            Spacer()

            VStack {
                Text("Duration")
                    .font(.system(size: 15))
                    .fontWeight(.bold)

                HStack(spacing: 5) {
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 10, height: 10)

                    Text(vm.recipe?.duration ?? "No time")
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                }
            }

        }.foregroundStyle(.orange)
    }

    var verticalItem: some View {
        HStack {
            VStack {
                Text("Ingredients")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundStyle(.orange)

                Text(vm.recipe?.ingredients ?? "No data")
                    .font(.system(size: 10))
                    .foregroundStyle(.gray)
            }

            Spacer()

            VStack {
                Text("Catagory")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundStyle(.orange)

                Text(vm.recipe?.category ?? "No data")
                    .font(.system(size: 10))
                    .foregroundStyle(.gray)
            }
        }
    }

    var describeRecipe: some View {
        VStack(alignment: .leading) {
            Text("Details")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.orange)

            Text("Veg chesse grilled sandwich is a quick and easy to make sandwich that is perfect for a summer lunch.")
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(.gray)
        }
    }

    var recipeReviews: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Reviews")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.orange)

                Text("Cathrin James")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.gray)
            }
            Spacer()

            VStack {
                Text("Rating")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.orange)

                Text("4.5")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.gray)
            }
        }
    }

    var floatingAddButton: some View {
        VStack {
            Spacer()

            Image(systemName: "plus")
                .resizable()
                .frame(width: 30, height: 30)
                .padding()

                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.orange)
                ).foregroundStyle(Color.white)
                .onTapGesture {
                    vm.recipe = nil
                    vm.isAddButtonPressed = true
                }
        }.padding()
    }

//    var deleteButton: some View {
//        Button(action: {
//            vm.showDeleteAlert()
//
//        }) {
//            Image(systemName: "trash")
//                .resizable()
//                .frame(width: 20, height: 25)
//                .foregroundColor(.red)
//        }
//
//        .alert("Is Recipe Deleted?",
//               isPresented: $vm.showAlert,
//               actions: {
//                   Button("No", role: .cancel) {
//                       //
//                   }
//
//                   Button("Yes", role: .destructive) {
//                       vm.deleteRecipe()
//                       self.presentationMode.wrappedValue.dismiss()
//                   }
//
//               })
//    }
}
