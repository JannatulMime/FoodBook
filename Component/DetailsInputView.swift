//
//  DetailsInputView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 8/10/24.
//

import RichTextKit
import SwiftUI

struct DetailsInputView: View {
   // @Binding var text : String
    @Binding var attrText : NSAttributedString// (string: "df")
    @State var att : NSAttributedString = NSAttributedString(string: "Hi")
    @StateObject var context = RichTextContext()

    var body: some View {
        VStack {
           
            RichTextEditor(text: $att, context: context) { _ in
                // You can customize the native text view here
               // Text(t)
            }
            
            RichTextViewer(att)
            
            RichTextKeyboardToolbar(
                context: context,
                leadingButtons: { $0 },
                trailingButtons: { $0 },
                formatSheet: { $0 }
            )
            
        }
    }
}

//struct DetailsInputView: View {
//    
////    @State private var text = NSAttributedString(string: "df")
//    @Binding var text : String
//    @StateObject var context = RichTextContext()
//
//    var body: some View {
//        VStack {
//            TextField("Enter Text ", text: $text)
//            
//        }
//    }
//}

#Preview {
    DetailsInputView(attrText: .constant(NSAttributedString()))
}
