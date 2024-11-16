//
//  Testing.swift
//  FoodBook
//
//  Created by Habibur Rahman on 10/10/24.
//

import SwiftUI

struct Testing: View {
    
    @State private var selectedOption = "Desert"
    @State private var showSheet = false
    @State private var selectedDate = Date()

    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
          //  Text("Selected: \(selectedOption)")
            
            Menu {
                Button("Snacks", action: { selectedOption = "Snacks" })
                
                Button("Drinks", action: { selectedOption = "Drinks" })
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
        .padding()
        
        
        
    }
        
    }
#Preview {
    Testing()
}

//    VStack {
//               Button("Show Bottom Sheet") {
//                   showSheet.toggle()
//               }
//               .buttonStyle(.borderedProminent)
//               .sheet(isPresented: $showSheet) {
//                   DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
//                                       .labelsHidden()
//                       .presentationDetents([.medium, .large])
//               }
//
//               Spacer()
//           }
//       }
//    
//
//            
//   
