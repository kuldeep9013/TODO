//
//  TodoLocalDataSource.swift
//  TODO
//
//  Created by Kuldeep Solanki on 15/06/26.
//

import CoreData

class TodoLocalDataSource: DataSourceRepository {

    typealias DataSource = TodoModel

    private let coreDataManager = CoreDataManager.shared

    func fetchAllData() async throws -> [TodoModel] {
        let todoEntities = try coreDataManager.fetchAll(type: TodoEntity.self)
        let todos = todoEntities.compactMap { todoEntity in
            return TodoModel(id: todoEntity.id, title: todoEntity.title ?? "", isCompleted: todoEntity.isCompleted, createdAt: todoEntity.createdAt ?? Date(), syncStatus: SyncStatus(rawValue: todoEntity.syncStatus ?? "pending") ?? .pending)
        }
        return todos
    }

    func fetchData(with id: String) async throws -> TodoModel? {
        return nil
    }

    func addData(_ data: TodoModel) async throws -> TodoModel? {
        let todoEntity = TodoEntity(context: coreDataManager.viewContext)
        todoEntity.id = data.id
        todoEntity.title = data.title
        todoEntity.isCompleted = data.isCompleted
        todoEntity.createdAt = data.createdAt
        todoEntity.syncStatus =  data.syncStatus.rawValue
        try coreDataManager.create(type: todoEntity)
        return data
    }

    func updateData(_ data: TodoModel) async throws {

    }

    func deleteData(with id: String) async throws {
        let predicate = NSPredicate(format: "id == %@", id)
        guard let todo = try coreDataManager.fetchFirst(
            TodoEntity.self,
            predicate: predicate
        ) else {
            return
        }
        try coreDataManager.delete(type: todo)
    }
    func deleteAllData() async throws {
        try coreDataManager.deleteAll(TodoEntity.self)
    }
}
