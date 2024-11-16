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
                    CreateProfileView()
                })
        }
    }

}

#Preview {
    ProfileView()
}

extension ProfileView {
    var content: some View {
        VStack(alignment: .leading, spacing: 15) {
            profilePic
            profileName
            profileEmail

            Spacer()
        }
    }

    var profilePic: some View {
            Image(vm.image)
                .resizable()
                .frame(width: 120, height: 100)
                .clipShape(.circle)
                .scaledToFit()
        }

    var profileName: some View {
        Text(vm.name)
            .modifier(CustomTextModifier(fontSize: 30, color: .black, weight: .bold))
    }

    var profileEmail: some View {
        Text(vm.email)
            .modifier(CustomTextModifier(fontSize: 20, color: .black, weight: .bold))
    }
}
