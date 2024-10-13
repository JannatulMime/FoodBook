//
//  TestMediaPicker.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import _AVKit_SwiftUI
import AVFoundation
import SwiftUI

struct TestMediaPicker: View {
    @StateObject private var viewModel = PhotoPickerViewModel()
    @State private var isPickerPresented = false
    var body: some View {
        VStack {
                   // Display selected image if available
                   if let selectedImage = viewModel.selectedImage {
                       Image(uiImage: selectedImage)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 300, height: 300)
                   }
                   // Display video player if a video is selected
                   else if let videoURL = viewModel.selectedVideoURL {
                       VideoPlayer(player: AVPlayer(url: videoURL))
                           .frame(height: 300)
                   }
                   // Placeholder when no media is selected
                   else {
                       Text("No media selected")
                   }
                   
                   // Button to open the photo/video picker
                   Button("Select Photo/Video") {
                       isPickerPresented = true
                   }
                   .sheet(isPresented: $isPickerPresented) {
                       PhotoPicker(viewModel: viewModel)
                   }
               }
               .padding()
        
    }
}

#Preview {
    TestMediaPicker()
}
