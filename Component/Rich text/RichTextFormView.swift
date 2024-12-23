//
//  RichTextFormView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 13/10/24.
//

import SwiftUI

struct RichTextFormView: View {
    var placeHolder: String = ""
    @Binding var text: NSAttributedString
    @State private var showSheet = false

    var body: some View {
        HStack/*(alignment: .center)*/ {
            HStack {
                Text(text.length == 0 ? placeHolder.toAttributedTextForPlaceHolder() : AttributedString(text))
                    .font(.subheadline)
                    .foregroundColor(text.length == 0 ? Color.gray : Color.white)

                //Spacer()
            }//.padding(.trailing, 50)
            Spacer()
            Image(systemName: "square.and.pencil")
        }
       
        .frame(maxWidth: .infinity, alignment: .top)
       // .modifier(DefaultRoundedRectangleOverlay(cornerRadius: 10))
       // .padding()
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 0, y: 0.5)
        )

        .onTapGesture {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            RichTextEditorView(text: $text)
        }
    }
}

#Preview {
    RichTextFormView(text: .constant("".toNsAttributedString()))
    // .background(Color.black)
}
