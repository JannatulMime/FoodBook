//
//  RecipeListView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 21/10/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var vm = RecipeListVM()

    var body: some View {
        VStack {
            // Text(items.name)

            List {
                ForEach(vm.savedEntities, id: \.name) { entity in
                    Text(entity.name ?? "No Name")
                }

            }.listStyle(PlainListStyle())
        }
    }
}

#Preview {
    RecipeListView()
}
