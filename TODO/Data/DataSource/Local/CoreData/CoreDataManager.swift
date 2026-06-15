//
//  CoreDataManager.swift
//  TODO
//
//  Created by Kuldeep Solanki on 15/06/26.
//

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() { }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TODO")

        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}
// MARK: CRUD methods
extension CoreDataManager {

    private func save(context: NSManagedObjectContext) throws {
        guard context.hasChanges else { return }
        try context.save()
    }

    @discardableResult
    func create<T: NSManagedObject>(type: T) throws -> T {
        let newTodo = T(context: viewContext)
        try save(context: viewContext)
        return newTodo
    }

    func fetchAll<T: NSManagedObject>(type: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) throws -> [T] {
        let request = T.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        guard let typedRequest = request as? NSFetchRequest<T> else {
            return []
        }
        let todos: [T] = try viewContext.fetch(typedRequest)
        return todos
    }

    func fetchFirst<T: NSManagedObject>(_ type: T.Type, predicate: NSPredicate) throws -> T? {
        try fetchAll(type: type, predicate: predicate)
            .first
    }

    func delete<T: NSManagedObject>(type: T) throws -> T {
        viewContext.delete(type)
        try save(context: viewContext)
        return type
    }
}
