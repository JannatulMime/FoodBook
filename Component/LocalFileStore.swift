//
//  LocalFileStore.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/11/24.
//

import Foundation
import UIKit

class LocalFileStore {
    
    func getDefaultDirectory() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func getFileURLFrom(fileName: String) -> URL? {
        return getDefaultDirectory()?.appendingPathComponent(fileName)
    }
    
    func saveImageInDefaultDirectory(imageData: Data, fileName : String) -> Bool{
      
        guard let fileURL = getFileURLFrom(fileName: fileName) else {return false}
    
        do {
            // Save the image data to the file URL
            try imageData.write(to: fileURL)
            print("U>> Image saved to: \(fileURL)")
            return true
        } catch {
            print("U>> Failed to save image: \(error.localizedDescription)")
            return false
        }
    }
    
    func getUiImageFrom(fileName: String) -> UIImage? {
        if let fileURL = getFileURLFrom(fileName: fileName),
           let uiImage = UIImage(contentsOfFile: fileURL.path) {
            return uiImage
        }
        return nil
    }
    
}
