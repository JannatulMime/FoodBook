//
//  LoginProfileView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 7/11/24.
//

import SwiftUI

struct LoginProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var vm = LoginProfileVM()
    @Environment(\.presentationMode) var presentationMode
    
    let topBarConfig = CommonTopBarData(title: "Login", bgColor: Color.theme.greene, leftIconName: "chevron.left", rightIconName: "")
    
    var body: some View {
        NavigationStack {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }
            )
            
            contentView
            Spacer()
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $vm.gotoCreateProfile, destination: {
                    CreateProfileView()
                })
        }
        
        
    }
}

#Preview {
    LoginProfileView()
}


extension LoginProfileView {
    var contentView: some View {
        VStack(spacing:50) {
            nameTextField
            emailTextField
            createProfileButton
        }.padding()
    }
    
    
    var nameTextField: some View {
     
        VStack(alignment: .leading) {
            Text("Email")
            
            TextField("Put your email", text: $vm.email)
                .foregroundStyle(.black)
               
             
                .background(
                               VStack {
                                   Spacer()
                                   Color(UIColor.gray)
                                       .frame(height: 1)
                               }
                           )
              
            
        }
    }
    
    var emailTextField: some View {
        VStack(alignment: .leading) {
            Text("Password")
            
            TextField("Put your password", text: $vm.password)
                .foregroundStyle(.black)
               
             
                .background(
                               VStack {
                                   Spacer()
                                   Color(UIColor.gray)
                                       .frame(height: 1)
                               }
                           )
              
            
        }
    }
    
    var createProfileButton: some View {
        HStack {
            Button {
                vm.gotoCreateProfile = true
                
                Task {
                    await authViewModel.createUser(
                        email: vm.email,
                        password: vm.password,
                        name: vm.profileName)
                }
                
            } label: {
                Text("Create Profile")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                    .WithDefaultRectangularBgModifier(bgColor: Color.theme.greene, cornerRadius: 20)
                    .padding(.horizontal,50)
            }
        }
    }
    
}
