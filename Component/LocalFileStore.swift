//
//  LocalFileStore.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/11/24.
//

import Foundation

class LocalFileStore {
    
    private static func getDefaultDirectory() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    static func getFileURLFrom(fileName: String) -> URL? {
        return getDefaultDirectory()?.appendingPathComponent(fileName)
    }
    
    func saveImageInDefaultDirectory(imageData: Data, fileName : String) -> Bool{
      
        guard let fileURL = LocalFileStore.getFileURLFrom(fileName: fileName) else {return false}
    
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
    
    static func getDataFrom(fileName: String) -> Data? {
        if let fileURL = getFileURLFrom(fileName: fileName){
           return try? Data(contentsOf: fileURL)
        }
        return nil
    }
    
}
