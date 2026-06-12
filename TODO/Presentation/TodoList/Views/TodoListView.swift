//
//  TodoListView.swift
//  TODO
//
//  Created by Kuldeep Solanki on 02/06/26.
//

import SwiftUI

struct TodoListView: View {
    @State var isCompleted: Bool
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
            Text("Go to gym")
                .foregroundStyle(isCompleted ? .gray : .black)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 6,
                             style: .circular)
            .fill(Color.accentColor)
            .shadow(color: .black.opacity(0.1), radius: 16, x: 4, y: 16)
        )

    }
}

#Preview {
    TodoListView(isCompleted: false)
}

#Preview {
    TodoListView(isCompleted: true)
}
