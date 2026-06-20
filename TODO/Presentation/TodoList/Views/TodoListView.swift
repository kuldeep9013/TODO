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
            TextField("Write your next todo", text: $title)
                .foregroundStyle(isCompleted ? .gray : .black)
                .disabled(isCompleted)
                .font(.title2.monospaced())

        }
        .frame(height: 64)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24,
                             style: .circular)
            .fill(Color.tile)
            .shadow(color: .black.opacity(0.1), radius: 16, x: 4, y: 12)
        )

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
