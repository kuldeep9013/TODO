//
//  TodoListView.swift
//  TODO
//
//  Created by Kuldeep Solanki on 02/06/26.
//

import SwiftUI

struct TodoListView: View {
    @Binding var title: String
    @Binding var isCompleted: Bool
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        HStack {
            Image(
                uiImage: isCompleted ? UIImage(systemName: "checkmark.square.fill")! : UIImage(systemName: "squareshape")!
            )
            .onTapGesture {
                withAnimation(.spring) {
                    isCompleted.toggle()
                }
            }
            TextField("", text: $title)
                .focused($isTextFieldFocused)
                .onChange(of: isTextFieldFocused) { oldValue, newValue in
                    if oldValue == true && newValue == false {
                        didEndEditing()
                    }
                }

                .foregroundStyle(isCompleted ? .gray : .black)
        }
        .padding()
        .background(
//            RoundedRectangle(cornerRadius: 6,
//                             style: .circular)
//            .fill(Color.accentColor)
//            .shadow(color: .black.opacity(0.1), radius: 16, x: 4, y: 16)
        )

    }

    func didEndEditing() {
        // update todo
    }
}

#Preview {
    @Previewable @State var isCompleted: Bool = false
    @Previewable @State var title = "KKK"
    TodoListView(title: $title, isCompleted: $isCompleted)
}

#Preview {
    @Previewable @State var isCompleted: Bool = true
    @Previewable @State var title = "KKK"
    TodoListView(title: $title, isCompleted: $isCompleted)
}
