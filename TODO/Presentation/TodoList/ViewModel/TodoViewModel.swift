//
//  TodoViewModel.swift
//  TODO
//
//  Created by Kuldeep Solanki on 16/06/26.
//
import Combine
import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoModel] = []

    let dataSourceRepository: any DataSourceRepository<TodoModel>

    init (dataSourceRepository: any DataSourceRepository<TodoModel>) {
        self.dataSourceRepository = dataSourceRepository
    }

    func fetchTodos() async {
        do {
            let todos = try await dataSourceRepository.fetchAllData()
            DispatchQueue.main.async {
                self.todos = todos
            }
        } catch {
            print("Error fetching todos: \(error)")
        }
    }

    func addTodo(title: String) async {
        do {
            let todo = TodoModel(title: title)
            if let addedToto = try await dataSourceRepository.addData(todo) {
                todos.append(addedToto)
            } else {
                print("Error while adding todo")
            }
        } catch {
            print("Error while adding todo: \(error)")
        }
    }

    func updateTodo(todo: TodoModel) async {
        guard !todo.title.isEmpty else {return} // empty validation
        do {
            try await dataSourceRepository.updateData(todo)
        } catch {
            print("Error while adding todo: \(error)")
        }
    }

    func deleteAllTodos() async {
        do {
            try await dataSourceRepository.deleteAllData()
        } catch {
            print("Error while adding todo: \(error)")
        }
    }
}
