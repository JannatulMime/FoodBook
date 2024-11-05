//
//  EditProfileVM.swift
//  FoodBook
//
//  Created by Habibur Rahman on 4/11/24.
//

import Foundation

class EditProfileVM: ObservableObject {
    @Published var pickedImage: Data?
    @Published var password: String = ""
    @Published var profileName: String = ""
    @Published var email: String = ""
    @Published var profileImage: String? = ""
    @Published var gotoProfileView: Bool = false
    
   // let localRecipeStore: CoreDataRecipeManager = CoreDataRecipeManager()
  
//    init(profile: ProfileData?) {
//        if let profile = profile {
//            profileName = profile.profileName
//            email = profile.email
//            profileImage = profile.profileImage 
//        }
//    }
//    
    
    
//    
//    private func createProfile() -> ProfileData {
////        var imagePath = ""
////        if let imageData = pickedImage {
////            imagePath = saveImageToDocumentsDirectory(imageData: imageData) ?? ""
////        }
//
//
//        let newProfile = ProfileData(profileName: profileName, email: email, profileImage: profileImage, id: UUID().uuidString)
//        return newProfile
//    }
//
//    
//    func saveProfile() {
////        if isSuccess {
////            createProfile()
////            gotoProfileView = isSuccess
////        }
//    }
//    
//    private func saveImageToDocumentsDirectory(imageData: Data) -> String? {
//        
//        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            return nil
//        }
//
//        // Create a unique file name
//        let fileName = UUID().uuidString + ".jpg"
//        let fileURL = documentsDirectory.appendingPathComponent(fileName)
//
//        do {
//            // Save the image data to the file URL
//            try imageData.write(to: fileURL)
//            print("Image saved to: \(fileURL)")
//            return fileURL.absoluteString
//        } catch {
//            print("Failed to save image: \(error.localizedDescription)")
//            return nil
//        }
//    }
}
