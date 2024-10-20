//
//  CustomImageView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import SwiftUI

struct CustomImageView: View {
    let imageData: Data?

    init(imageData: Data?) {
        self.imageData = imageData
    }

    var body: some View {
        ZStack {
            if let data = imageData,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()

            } else {
                Image("Rice1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
        }
    }
}

#Preview {
    CustomImageView(imageData: nil)
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
