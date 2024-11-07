//
//  CreateProfileVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/11/24.
//

import Foundation

class CreateProfileVM: ObservableObject {
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var profileName: String = ""
    @Published var gotoProfileView: Bool = false
}
