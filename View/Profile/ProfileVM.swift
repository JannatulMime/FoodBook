//
//  ProfileVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 4/11/24.
//

import Foundation

class ProfileVM: ObservableObject {
   
    @Published var image: String = "ProfilePic"
    @Published var name: String = "yummy"
    @Published var email: String = "yu@yahoo.com"
    
    @Published var gotoEditProfile: Bool = false
}
