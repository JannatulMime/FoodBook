//
//  ProfileView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/10/24.
//

import SwiftUI

struct ProfileView: View {
    let topBarConfig = CommonTopBarData(title: "Profile", bgColor: Color.red, leftIconName: "chevron.left", rightIconName: "pencil")

    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = ProfileVM()

    var body: some View {
        NavigationStack {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }, onRightButtonClicked: { vm.gotoEditProfile = true }
            )

            content
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $vm.gotoEditProfile, destination: {
                    EditProfileView()
                })
        }
    }

    private func loadImageFromDocumentsDirectory(path: String) -> UIImage? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            return UIImage(contentsOfFile: path)
        } else {
            print("File does not exist at path: \(path)")
            return nil
        }
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    var content: some View {
        VStack(spacing: 5) {
            profilePic
            profileName
            profileEmail

            Spacer()
        }
    }

    var profilePic: some View {
        if let uiImage = loadImageFromDocumentsDirectory(path: vm.image) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: 120, height: 100)
                .clipShape(.circle)
                .scaledToFit()

        } else {
            Image(vm.image)
                .resizable()
                .frame(width: 120, height: 100)
                .clipShape(.circle)
                .scaledToFit()
        }
    }

    var profileName: some View {
        Text(vm.name)
            .modifier(CustomTextModifier(fontSize: 20, color: .black, weight: .bold))
    }

    var profileEmail: some View {
        Text(vm.email)
            .modifier(CustomTextModifier(fontSize: 10, color: .black, weight: .bold))
    }
}
