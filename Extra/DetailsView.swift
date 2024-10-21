//
//  DetailsView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 11/10/24.
//

import SwiftUI

struct DetailsView: View {
    var topEdge : CGFloat = 0
    var maxHeight : CGFloat = 400
    var minHeight : CGFloat = 100
    
    @State var offset : CGFloat = 0
    @StateObject var vm = DetailsVM()
    
    var body: some View {
        VStack  {
            GeometryReader{ proxy in
                topView
                   // .frame(maxWidth: .infinity)
                    .frame(height: getHeaderHeight(), alignment : .top)
                 
                    .overlay(
                        overlayView
                        .frame(height:120)
                        .background(Color.black.opacity(topBarTitleOpacity() - 0.2))
                        .padding(.top,topEdge)
                     , alignment: .top)
            }.frame(height: maxHeight)
            //Fixing at top
                .offset(y: -offset)
                .zIndex(1)
            
           // Spacer()
            bottomView
                .zIndex(0)
            Spacer()
            
        }
    }
    
    func getHeaderHeight() -> CGFloat {
        
        let topHeight = maxHeight + offset
        return topHeight > (minHeight + topEdge) ? topHeight : (minHeight + topEdge)
    }
    
    func topBarTitleOpacity () -> CGFloat {
        let progress = -(offset + minHeight) / (maxHeight - (minHeight + topEdge))
   //     let progress = -(offset + 80) / (maxHeight - (80 + topEdge))
      //  let opacity = 1 - progress
        return progress//progress
    }
}

#Preview {
    DetailsView()
}

extension DetailsView {
    var overlayView: some View {
        
        HStack{
            
            Image(systemName: "chevron.left")
                .foregroundStyle(.orange)
                .padding()
//                .onTapGesture {
//                    self.presentationMode.wrappedValue.dismiss()
//                }
                .padding(.top, 5)
            
            
            Spacer()
            
            
        }
        
    }
    
    var topView: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            Image("Rice2")
                .resizable()
                .frame(width: 400, height: 300)
                .scaledToFit()
           
            Text("Biriyani")
                .foregroundStyle(.orange)
                .padding()
                
        }
    }
    
    var bottomView: some View {
        
        BottomView(getRecipe: $vm.recipeDetails)
    }
    
}
