//
//  PhotoPickerView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 9/10/24.
//

import PhotosUI
import SwiftUI

struct PhotoPickerView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var savedImagePath: String? = nil

    var body: some View {
        VStack {
            PhotosPicker(selection: $selectedItem, matching: .images) {
                ZStack(alignment: .center) {
                    //
                    if selectedImageData != nil {
                        originalImageView
                            .background(Color.red)
                        // .padding(50)
                    } else {
                        placeholderView
                    }
                }.frame(maxWidth: .infinity)
                    .cornerRadius(20)
            }
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
//            Image(uiImage: uiImage)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
        }
    }

//        PhotosPicker (
//
//            selection: $selectedItem,
//            matching:  .any(of: [.images, .videos]),
//            photoLibrary: .shared()) {
//                ZStack (alignment: .center) {
//
//                    if selectedImageData != nil{
//                        originalImageView
//                            .background(Color.red)
//                    } else {
//                        placeholderView
//                    }
//                }.frame(maxWidth: .infinity)
//                    .cornerRadius(20)
//
//            }
//
//            .onChange(of: selectedItem) { newItem in
//                Task {
//                    // Retrieve selected asset in the form of Data
//                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
//                        selectedImageData = data
//                    }
//                }
//            }
}

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

#Preview {
    PhotoPickerView()
}

extension PhotoPickerView {
    var placeholderView: some View {
        Rectangle()
            .fill(.gray.opacity(0.2))
            .overlay(
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 150, height: 100)
                    .scaledToFit()
                    .tint(.gray)
            )
    }

    var originalImageView: some View {
        CustomImageView(imageData: selectedImageData)
        // .background(RoundedRectangle(cornerRadius: 20))
//        if let selectedImageData,
//           let uiImage = UIImage(data: selectedImageData) {
//            Image(uiImage: uiImage)
//                .resizable()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//               // .frame(width: 300, height: 100)
//                .scaledToFit()
//
//        }else{
//            Image("Rice")
//                .resizable()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .scaledToFit()
//        }
    }
}
