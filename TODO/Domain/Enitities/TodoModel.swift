//
//  TodoModel.swift
//  TODO
//
//  Created by Kuldeep Solanki on 15/06/26.
//

import Foundation

struct TodoModel {
    let id: String?
    var title: String?
    var isCompleted: Bool
    var createdAt: Date
    var syncStatus: SyncStatus

    init(id: String? = UUID().uuidString, title: String? = nil, isCompleted: Bool, createdAt: Date, syncStatus: SyncStatus) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.syncStatus = syncStatus
    }
}
