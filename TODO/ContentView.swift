//
//  ContentView.swift
//  TODO
//
//  Created by Kuldeep Solanki on 30/05/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var counter: Int = 0
    @State private var isAddTodoPresented: Bool = false
    @State private var allTodos: [TodoModel] = []
    @State private var textChangeTask: Task<Void, Never>?

    @StateObject private var todoVM = TodoViewModel(dataSourceRepository: TodoLocalDataSource())
    var body: some View {

        ZStack {
            List($todoVM.todos, id: \.id) { $todo in
                TodoListView(title: $todo.title, isCompleted: $todo.isCompleted)
                    .onChange(of: todo.isCompleted) { _, _ in
                        updateTodo(todo: todo)
                    }
                    .onChange(of: todo.title) { _, _ in
                        textChangeTask?.cancel()
                        textChangeTask = Task {
                            try? await Task.sleep(for: .milliseconds(400))
                            guard !Task.isCancelled else { return }
                            updateTodo(todo: todo)
                        }
                    }
                    .padding(-6)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)

            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .scrollDismissesKeyboard(.immediately)
            .onAppear {
                Task {
                    await todoVM.fetchTodos()
                }
            }
        }.padding(8)
            .overlay(
                RoundButtonView()
                    .onTapGesture {
//                        counter += 1
//                        Task {
//                            await todoVM.addTodo(title: "Hello \(counter)")
//                        }
                        isAddTodoPresented = true
                    }
                    .sheet(
                        isPresented: $isAddTodoPresented) {
                            AddTodoView(todoVM: todoVM)
                        }
                    .padding(),
                alignment: .bottomTrailing

            )
            .background(Color.bg)

        Text("Delete All")
            .onTapGesture {
                Task {
                    await todoVM.deleteAllTodos()
                }
            }

    }

    func updateTodo(todo: TodoModel) {
        Task {
            await todoVM.updateTodo(todo: todo)
        }
    }

}

#Preview {
    ContentView()
}
