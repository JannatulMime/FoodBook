//
//  DefaultRoundedRectangleOverlay.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import SwiftUI

struct DefaultRoundedRectangleOverlay: ViewModifier {
 //   var inset: CGFloat = 0.5
    var lineWidth = 1.0
    var cornerRadius = 44.0
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius)
            .padding(10)
            .background( RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray))
            
    }
}
