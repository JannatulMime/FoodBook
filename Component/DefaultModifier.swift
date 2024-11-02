//
//  DefaultModifier.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import SwiftUI

    enum BgShapeType {
        case none
        case circle
        case roundedRectangle
    }

struct DefaultModifier: ViewModifier {
        let bgColor: Color
        let cornerRadius: CGFloat
        let shapeType: BgShapeType
      

        func body(content: Content) -> some View {
            content
                .background {
                    switch shapeType {
                    case .circle:
                        Circle()
                            .fill(bgColor)
                    case .roundedRectangle:
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .foregroundStyle(bgColor)
                           
                    case .none:
                        Rectangle()
                            .foregroundStyle(.clear)
                    }
                }
        }
    }

    extension View {
        
        func WithDefaultRectangularBgModifier(bgColor: Color, cornerRadius: CGFloat) -> some View {
            modifier(DefaultModifier(bgColor: bgColor, cornerRadius: cornerRadius, shapeType: .roundedRectangle))
        }

        func WithDefaultCircularBgModifier(bgColor: Color) -> some View {
            modifier(DefaultModifier(bgColor: bgColor, cornerRadius: 1, shapeType: .circle))
        }
        
        func WithDefaultNoBgModifier(bgColor: Color) -> some View {
            modifier(DefaultModifier(bgColor: bgColor, cornerRadius: 1, shapeType: .none))
        }
    }


//#Preview {
//    DefaultModifier(bgColor: <#Color#>, cornerRadius: <#CGFloat#>, shapeType: <#BgShapeType#>)
//}
