//
//  HomeVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 29/10/24.
//

import Foundation

class HomeVM: ObservableObject {
    
    @Published var recipies : [Recipe] = [Recipe]()
    @Published var savedEntities: [RecipeEntity] = []
}
