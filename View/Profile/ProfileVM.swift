//
//  ProfileVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 4/11/24.
//

import Foundation

class ProfileVM: ObservableObject {
   
    @Published var image: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    
    @Published var gotoEditProfile: Bool = false
}
