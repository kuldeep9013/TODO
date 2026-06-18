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
    @State private var allTodos: [TodoModel] = []
    @StateObject private var todoVM = TodoViewModel(dataSourceRepository: TodoLocalDataSource())
    var body: some View {

        List($todoVM.todos, id: \.id) { $todo in
            TodoListView(title: $todo.title, isCompleted: $todo.isCompleted)
                .onChange(of: todo.isCompleted) { _, _ in

                }
                .onChange(of: todo.title) { _, _ in

                }
        }
        .listStyle(.grouped)
        .onAppear {
            Task {
                await todoVM.fetchTodos()
            }
        }

        Text("Add Todo")
            .onTapGesture {
                counter += 1
                Task {
                    await todoVM.addTodo(title: "Hello \(counter)")
                }
            }
    }

}

#Preview {
    ContentView()
}
