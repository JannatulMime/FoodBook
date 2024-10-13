//
//  Testing.swift
//  FoodBook
//
//  Created by Habibur Rahman on 10/10/24.
//

import SwiftUI

struct Testing: View {
    
        @State private var selectedOption = "Desert"

        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
            //    Text("Selected: \(selectedOption)")

                Menu {
                    Button("Option 1", action: { selectedOption = "Option 1" })
                 
                    Button("Option 2", action: { selectedOption = "Option 2" })
                    Button("Desert", action: { selectedOption = "Desert" })
                    
                } label: {
                  Label("Catagories", systemImage: "arrowtriangle.down")
                   // Text("Catagoties")
//                        .padding()
//                        .background(Color.orange)
                       .foregroundColor(.black)
//                        .cornerRadius(10)
                }
                
                Text("\(selectedOption)")
                    .font(.subheadline)
                    .foregroundStyle(.pink)
                    .frame(width: 300, height: 50)
                    
                    .background(RoundedRectangle(cornerRadius: 15).stroke(.yellow))
                    //.background(Rectangle().fill(.white).shadow(radius: 3))
                    
                    
            }
            // .padding()
        }
    }


#Preview {
    Testing()
}
