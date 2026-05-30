//
//  TODOApp.swift
//  TODO
//
//  Created by Kuldeep Solanki on 30/05/26.
//

import SwiftUI
import CoreData

@main
struct TODOApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
