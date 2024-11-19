//
// CreateProfileView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 4/11/24.
//

import SwiftUI

struct CreateProfileView: View {
   
    @StateObject var vm = CreateProfileVM()
    @Environment(\.presentationMode) var presentationMode
  //  @EnvironmentObject var authViewModel: AuthViewModel
    
    let topBarConfig = CommonTopBarData(title: "Create Profile", bgColor: Color.theme.blueis, leftIconName: "chevron.left", rightIconName: "")
    
    var body: some View {
        NavigationStack {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }
            )
            
            contentView
            Spacer()
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $vm.gotoProfileView, destination: {
                    ProfileView()
                })
        }
    }
}

#Preview {
    CreateProfileView()
}

extension CreateProfileView {
    
    var contentView: some View {
        VStack(spacing: 50) {
            circleImage
            nameTextField
            emailTextField
            saveButton
            
        }.padding()
    }
    
    var circleImage: some View {
        HStack(spacing: 10) {
            
            CustomImagePicker(selectedImageData: $vm.pickedImage)
                .frame(width: 100, height: 100)
                .clipShape(.circle)
               
            
            Button {
               

            } label: {
                Text("Delete Picture")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                    .WithDefaultRectangularBgModifier(bgColor: Color.theme.mustard, cornerRadius: 20)
                  //  .padding(.horizontal,50)
            }
            
        }
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
    
    var saveButton: some View {
        HStack {
            Button {
                vm.gotoProfileView = true
                
                
            } label: {
                Text("Save")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                    .WithDefaultRectangularBgModifier(bgColor: Color.theme.blueis, cornerRadius: 20)
                    .padding(.horizontal,50)
            }
        }
    }
}
