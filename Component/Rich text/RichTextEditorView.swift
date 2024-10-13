//
//  RichTextEditorView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import RichTextKit
import SwiftUI

struct RichTextEditorView: View {
    @Binding var text: NSAttributedString
    @StateObject var context = RichTextContext()

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                editor
                    .padding()
                    .padding(.top, 40)
                toolbar
            }
            .navigationTitle("RichTextKit")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                }
            }

//            Image(Constants.Images.tic_with_bg)
//                .resizable()
//                .frame(width: 35, height: 35)
//                .aspectRatio(contentMode: .fit)
//                .padding(.trailing,20)
//                .padding(.top,10)
//                .onTapGesture {
//                    self.presentationMode.wrappedValue.dismiss()
//                }
        }.background(Color.gray)
    }
}

#Preview {
    RichTextEditorView(text: .constant("".toNsAttributedString()))
}

private extension RichTextEditorView {
    var editor: some View {
        RichTextEditor(text: $text, context: context) {
            $0.textContentInset = CGSize(width: 10, height: 20)
        }
        .background(Color.white)
        .cornerRadius(5)
        .focusedValue(\.richTextContext, context)
    }

    var toolbar: some View {
        RichTextKeyboardToolbar(
            context: context,
            leadingButtons: { $0 },
            trailingButtons: { $0 },
            formatSheet: { $0 }
        )

//        RichTextKeyboardToolbar(
//            context: context,
//            leadingButtons: {},
//            trailingButtons: {}
//        )
    }
}
