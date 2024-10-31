//
//  CommonTobBarView.swift
//  FoodBook
//
//  Created by Habibur Rahman on 31/10/24.
//

import SwiftUI

//let leftIconName : String = "chevron.left"

struct CommonTopBarData {
    var title: String
    var bgColor: Color
    var forgroundColor : Color
    var leftIconName: String
    var rightIconName: String
    var hasShadow : Bool

    init(title: String = "" ,
         bgColor: Color = .blue,
         forgroundColor : Color = .white,
         leftIconName: String,
         rightIconName: String = "",
         hasShadow : Bool = true
    ) {
        self.title = title
        self.bgColor = bgColor
        self.leftIconName = leftIconName
        self.rightIconName = rightIconName
        self.forgroundColor = forgroundColor
        self.hasShadow = hasShadow
    }

    var hasLeftIcon: Bool {
        return !leftIconName.isEmpty
    }

    var hasRightIcon: Bool {
        return !rightIconName.isEmpty
    }
}

struct CommonTopBar: View {
    @Environment(\.presentationMode) var presentationMode
//
    private var onLeftButtonClicked: (() -> Void)?
    private var onRightButtonClicked: (() -> Void)?
    private var data: CommonTopBarData

    init(data: CommonTopBarData,
         onLeftButtonClicked: (() -> Void)? = nil,
         onRightButtonClicked: (() -> Void)? = nil

    ) {
        self.data = data
        self.onLeftButtonClicked = onLeftButtonClicked
        self.onRightButtonClicked = onRightButtonClicked
    }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            if data.hasLeftIcon {
                leftButton
            }

            Spacer()
            titleSection
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            if data.hasRightIcon {
                rightButton
            }

        }   .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .font(.title3)
            .foregroundStyle(data.forgroundColor)
            .background(data.bgColor.ignoresSafeArea()
                .shadow(radius: data.hasShadow ? 1 : 0))
           
    }
}

#Preview {
    CommonTopBar(data: DummyDataUtils.dummyCommonTopBar)
}

extension CommonTopBar {
    private var leftButton: some View {
        Button {
            // presentationMode.wrappedValue.dismiss()
            if let action = onLeftButtonClicked {
                action()
            }
        } label: {
            Image(systemName: data.leftIconName)
        }
    }

    private var titleSection: some View {
        Text(data.title)
            .font(.system(size: 18))
    }

    private var rightButton: some View {
        Button {
            if let action = onRightButtonClicked {
                action()
            }
        } label: {
            Image(systemName: data.rightIconName)
        }
    }
}
