//
//  CreateProfileVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 4/11/24.
//

import Foundation

class CreateProfileVM: ObservableObject {
    @Published var pickedImage: Data?
    @Published var password: String = ""
    @Published var profileName: String = ""
    @Published var email: String = ""
    @Published var profileImage: String? = ""
    @Published var gotoProfileView: Bool = false
    
}
