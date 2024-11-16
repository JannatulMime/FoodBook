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
    
    func login(email: String, password: String) async {
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await fetchUser(by: authResult.user.uid)
          //  print("Current User", currentUser)
        } catch {
            isError = true
        }
    }
    
    func createUser(email: String, password: String, name: String) async {
        do {
            // user entry in auth
            let authResult = try await auth.createUser(withEmail: email, password: password)
            
            // user's extra details store in database
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
    
    func fetchUser(by uid: String) async {
        do {
            let document = try await firestore.collection("users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        } catch {
            isError = true
        }
    }
}
