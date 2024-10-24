//
//  SaveImage.swift
//  FoodBook
//
//  Created by Habibur Rahman on 24/10/24.
//

import SwiftUI
import PhotosUI

struct SaveImage: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var savedImagePath: String? = nil
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $selectedItem, matching: .images) {
                Text("Select a Photo")
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                        if let imageData = selectedImageData {
                            savedImagePath = saveImageToDocumentsDirectory(imageData: imageData)
                        }
                    }
                }
            }
            
            if let path = savedImagePath, let uiImage = loadImageFromDocumentsDirectory(path: path) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
    }
    
    // Function to save the image data to the app's directory
    private func saveImageToDocumentsDirectory(imageData: Data) -> String? {
        let fileManager = FileManager.default
        
        // Get the URL for the app's documents directory
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        // Create a unique file name
        let fileName = UUID().uuidString + ".jpg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        do {
            // Save the image data to the file URL
            try imageData.write(to: fileURL)
            print("Image saved to: \(fileURL)")
            return fileURL.path
        } catch {
            print("Failed to save image: \(error.localizedDescription)")
            return nil
        }
    }
    
    // Function to load an image from the app's directory
    private func loadImageFromDocumentsDirectory(path: String) -> UIImage? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            return UIImage(contentsOfFile: path)
        } else {
            print("File does not exist at path: \(path)")
            return nil
        }
    }
}



#Preview {
    SaveImage()
}
