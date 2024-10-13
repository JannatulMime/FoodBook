//
//  PhotoPickerCoordinator.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import Foundation
import PhotosUI
import SwiftUI
import AVKit

class PhotoPickerViewModel: ObservableObject {
    @Published var selectedImage: UIImage? = nil
    @Published var selectedVideoURL: URL? = nil
}

class PhotoPickerCoordinator: NSObject, PHPickerViewControllerDelegate {
    var parent: PhotoPicker
    
    init(parent: PhotoPicker) {
        self.parent = parent
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider else { return }
        
        // Handle image selection
        if provider.canLoadObject(ofClass: UIImage.self) {
            provider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    if let uiImage = image as? UIImage {
                        self.parent.viewModel.selectedImage = uiImage
                        self.parent.viewModel.selectedVideoURL = nil // Clear video if image is selected
                    }
                }
            }
        }
        
        // Handle video selection
        if provider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
            provider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { url, error in
                DispatchQueue.main.async {
                    if let tempURL = url {
                        // Generate a destination URL in the app's Documents directory
                        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                        let destinationURL = documentsDirectory.appendingPathComponent(tempURL.lastPathComponent)
                        
                        do {
                            // If the video already exists at the destination, remove it
                            if FileManager.default.fileExists(atPath: destinationURL.path) {
                                try FileManager.default.removeItem(at: destinationURL)
                            }
                            // Move the video from the temporary URL to the destination URL
                            try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                            
                            // Update the viewModel with the new persistent URL
                            self.parent.viewModel.selectedVideoURL = destinationURL
                            self.parent.viewModel.selectedImage = nil // Clear image if video is selected
                        } catch {
                            print("Error moving video file: \(error.localizedDescription)")
                        }
                    } else if let error = error {
                        print("Error loading video file representation: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
    @ObservedObject var viewModel: PhotoPickerViewModel
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .any(of: [.images, .videos]) // Allow both images and videos
        config.selectionLimit = 1 // Select only one item at a time
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // No updates needed
    }
    
    func makeCoordinator() -> PhotoPickerCoordinator {
        return PhotoPickerCoordinator(parent: self)
    }
}

