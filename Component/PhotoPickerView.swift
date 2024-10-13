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

    var body: some View {
        PhotosPicker (
            
            selection: $selectedItem,
            matching:  .any(of: [.images, .videos]),
            photoLibrary: .shared()) {
                ZStack (alignment: .center) {
                    
                    if selectedImageData != nil{
                        originalImageView
                            .background(Color.red)
                    } else {
                        placeholderView
                    }
                }.frame(maxWidth: .infinity)

            }
        
            .onChange(of: selectedItem) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }

        
    }
}

#Preview {
    PhotoPickerView()
}

extension PhotoPickerView {
    var placeholderView : some View {
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
    
    var originalImageView : some View {
        
        CustomImageView(imageData: selectedImageData)
        //    .background(RoundedRectangle(cornerRadius: 20))
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
