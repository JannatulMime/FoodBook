//
//  CustomImageView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import SwiftUI

struct CustomImageView: View {
   
    let uiImage: UIImage?
    let contentMode : ContentMode
   
    
    init(imageData: Data?, contentMode : ContentMode = .fit) {
        if let data = imageData {
            uiImage = UIImage(data: data)
        } else {
            uiImage = nil
        }
        self.contentMode = contentMode
       
    }

    init(uiImage: UIImage?, contenMode : ContentMode = .fit) {
        self.uiImage = uiImage
        self.contentMode = contenMode
    }

    var body: some View {
        ZStack {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                   // .frame(width: size.height, height: size.height)
                    .clipped()
                    
            } else {
                Image("Rice1")
                    .resizable()
                    .scenePadding()
                    .aspectRatio(contentMode: .fill)
                  //  .frame(width: size.height, height: size.height)
                    .clipped()
                
            }
        }
    }
}

#Preview {
    CustomImageView(uiImage: nil)
}

// struct CustomImageView: View {
//    var body: some View {
//        ZStack {
//            if let url = URL(string: imagePath) {
//                KFImage(url)
//                    .loadDiskFileSynchronously()
//                    .placeholder { Image("placeholder") }
//               //     .cacheMemoryOnly(false)
//                  //  .fade(duration: 0.25)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .clipped()
//
//            } else {
//                Image("sky")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .clipped()
//            }
//        }
//
//
//    }
// }
