//
//  AddTodoView.swift
//  TODO
//
//  Created by Kuldeep Solanki on 20/06/26.
//

import SwiftUI

struct AddTodoView: View {
    @State private var newTodo = TodoModel(title: "")
    @Environment(\.dismiss) private var dismiss
    @FocusState private var textEditorFocused
    var todoVM: TodoViewModel
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                    .frame(height: 100)
                RoundButtonView(imageName: "xmark")
                    .onTapGesture {
                        dismissView()
                    }
                    .padding()

            }
            ZStack {
                TextEditor(text: $newTodo.title)
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(Color.tile)
                    .frame(height: 244, alignment: .top)
                    .border(.accent)
                    .focused($textEditorFocused)
                    .onSubmit {
                        addNewTodo()
                    }
            }
            .cornerRadius(12)
            .padding()

            Text("Add")
            .frame(width: 244, height: 26)
            .foregroundStyle(Color.black)
            .padding()
            .background(.tile)
            .cornerRadius(12)
            .onTapGesture {
                addNewTodo()
            }
            Spacer()
        }
        .background(.bg)
        .ignoresSafeArea()
        .onAppear {
            textEditorFocused = true
        }
    }

    private func addNewTodo() {
        Task {
            let title = newTodo.title
//            let todoVM = TodoViewModel(dataSourceRepository: TodoLocalDataSource())
            await todoVM.addTodo(title: title)
            dismissView()
        }
    }

    private func dismissView() {
        dismiss()
        textEditorFocused = false
    }
}

#Preview {

    AddTodoView(todoVM: TodoViewModel(dataSourceRepository: TodoLocalDataSource()))
}
