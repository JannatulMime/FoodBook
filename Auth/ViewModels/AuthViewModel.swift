//
//  AuthViewModel.swift
//  FoodBook
//
//  Created by Habibur Rahman on 5/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


@MainActor
final class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isError: Bool = false
    
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init() {
        
    }
    
    
    func createUser(email: String, password: String, name: String) async {
        do {
            // user in auth
            let authResult = try await auth.createUser(withEmail: email, password: password)
            
            // user in database
            await storeUserInFirestore(uid: authResult.user.uid, email: email , name: name)
        } catch {
            isError = true
            print("error is \(error.localizedDescription)")
        }
    }
    
    func storeUserInFirestore(uid: String, email: String, name: String) async {
        let user = User(uid: uid, email: email, profileName: name)
        
        do {
            try firestore.collection("users").document(uid).setData(from: user)
        } catch {
            isError = true
        }
    }
}
