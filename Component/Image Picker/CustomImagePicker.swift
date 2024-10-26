//
//  CustomIMagePicker.swift
//  FoodBook
//
//  Created by Habibur Rahman on 25/10/24.
//

import _PhotosUI_SwiftUI
import SwiftUI

struct CustomImagePicker: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State var originalImage: UIImage?
    @Binding var selectedImageData: Data?

    var body: some View {
        VStack {
            PhotosPicker(selection: $selectedItem, matching: .any(of: [.images, .videos]),
                         photoLibrary: .shared()) {
                GeometryReader { proxy in
                    let paddingVal = 20.0
                    let width =  (proxy.size.width - paddingVal) < 0 ? 0 :  (proxy.size.width - paddingVal)
                    let height =  (proxy.size.height - paddingVal) < 0 ? 0 :  (proxy.size.height - paddingVal)
                    
                    ZStack(alignment: .center) {
                        Rectangle()
                            .fill(.gray.opacity(0.2))

                        if originalImage == nil {
                            placeholderView
                                .frame(width: width, height: height)
                                .clipped()
                                .cornerRadius(20)

                        } else {
                            originalImageView
                                .frame(width: width, height: height)
                                .clipped()
                                .cornerRadius(20)
                               
                        }
                    }

                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(10)
                    .clipped()

                    
                }

                            }
        }.onChange(of: selectedItem) {
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                    originalImage = UIImage(data: data)
                }
            }
        }
    }
}

#Preview {
    CustomImagePicker(selectedImageData: .constant(nil))
}

extension CustomImagePicker {
    var placeholderView: some View {
        CustomImageView(uiImage: UIImage(systemName: "photo"),
                        contenMode: .fit)
    }

    var originalImageView: some View {
        VStack {
            CustomImageView(uiImage: originalImage, contenMode: .fill)
        }
    }
}
