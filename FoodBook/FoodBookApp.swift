//
//  FoodBookApp.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import CoreData
import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
                    FirebaseApp.configure()

                    return true
    }
}

@main
struct FoodBookApp: App {
    
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject private var authViewModel = AuthViewModel()
    

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootView()
               // ContentView()
                   // .environmentObject(authViewModel)
            }
          

            //      ContentView()
            // EditProfileView()
            // CreateRecipeView()
            // RecipeListView()
            //   TestMediaPicker()
            // SaveImage()

           
        }
    }
}
