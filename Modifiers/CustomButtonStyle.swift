//
// CustomButtonStyle.swift
//  FoodBook
//
//  Created by Habibur Rahman on 5/11/24.
//

import Foundation
import SwiftUI


//struct RoundedRectangleButton: ViewModifier {
//    
//    struct RoundedRectangleStyle: ButtonStyle {
//        func makeBody(configuration: Configuration) -> some View {
//            configuration.label
//
//            .frame(height: 20)
//            .frame(maxWidth: .infinity)
//            .padding()
//            .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.white)
//                        .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
//                        .shadow(color: .gray, radius: 3, x: 1, y: 3)
//                        .scaleEffect(configuration.isPressed ? 0.95 : 1)
//                )
//        }
//    }
//
//}



struct CustomButtonStyle: ButtonStyle {
//    var backgroundColor: Color
//    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 20)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.red)
                                    .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                                    .shadow(color: .gray, radius: 3, x: 1, y: 3)
                                    .scaleEffect(configuration.isPressed ? 0.95 : 1)
                            )
                    }
    }

