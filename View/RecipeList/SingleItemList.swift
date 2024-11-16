//
//  SingleItemList.swift
//  FoodBook
//
//  Created by Habibur Rahman on 23/10/24.
//

import SwiftUI

struct SingleItemList: View {
     let image: String
     let name: String
     let duration: String
     let ingridients: String
     let localFileStore = LocalFileStore()
     var recipe : Recipe?
    
    var body: some View {
        
        HStack {
//            if let uiImage = loadImageFromDocumentsDirectory(path: image) {
//                Image(uiImage: uiImage)
            
            if let imageData = recipe?.getImageData(),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
           
                .resizable()
                .frame(width: 60, height: 50)
                .cornerRadius(10)
                
            }else{
                Image(image)
                    .resizable()
                    .frame(width: 60, height: 50)
                    .cornerRadius(10)
                    
            }
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.system(size: 15))
                    
                    Spacer()
                    
                    HStack(spacing: 3) {
                    
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 10, height: 10)
                        Text(duration)
                        .font(.system(size: 10))
                }
                
                }
                .foregroundStyle(.cyan)
                
               
                Text("\(ingridients) ingridients")
                    .foregroundStyle(.gray)
               
            }.font(.system(size: 10))
                .fontWeight(.bold)
            
        }
        .padding(.all, 10)
        
        .WithDefaultRectangularBgModifier(bgColor: .gray.opacity(0.2), cornerRadius: 10)
        .shadow(color: Color.white, radius: 5, x: 5, y: 5)
            .padding(.horizontal)
            
        
    }
    
//    private func loadImageFromDocumentsDirectory(path: String) -> UIImage? {
//        let fileManager = FileManager.default
//        if fileManager.fileExists(atPath: path) {
//            return UIImage(contentsOfFile: path)
//        } else {
//            print("File does not exist at path: \(path)")
//            return nil
//        }
//    }
}

#Preview {
    SingleItemList(image: "Rice1", name: "Biriyani", duration: "1h 40m", ingridients: "02")
}
