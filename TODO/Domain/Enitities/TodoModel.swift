//
//  TodoModel.swift
//  TODO
//
//  Created by Kuldeep Solanki on 15/06/26.
//

import Foundation

struct TodoModel: Identifiable {
    let id: String?
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var syncStatus: SyncStatus

    init(id: String? = UUID().uuidString, title: String, isCompleted: Bool = false, createdAt: Date = Date(), syncStatus: SyncStatus = .pending) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.syncStatus = syncStatus
    }
}
