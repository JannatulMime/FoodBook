//
//  TestingofTime.swift
//  FoodBook
//
//  Created by Habibur Rahman on 11/11/24.
//

import SwiftUI

struct TestingofTime: View {
   // @State private var checkAmount = 0.0
   
    @State private var numberOfTime = 20

    let times = [10, 20, 30, 40, 50, 60]
    
    var body: some View {
        NavigationStack {
           Form {
               Picker("Duration", selection: $numberOfTime) {
                        ForEach(times, id: \.self) {
                            Text("\($0) min")
                        }
                    }.pickerStyle(.navigationLink)
           }
        }
    }
}

#Preview {
    TestingofTime()
}
