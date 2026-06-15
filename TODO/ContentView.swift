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
    var body: some View {
        Text("Add")
            .onTapGesture {
                counter += 1
                let todo = TodoModel(title: "Hello \(counter)", isCompleted: false, createdAt: Date(), syncStatus: .pending)
                Task {
                    let added = try await TodoLocalDataSource().addData(todo)
                    print("*** added: \(added)")
                }
            }

        Text("FetchAll")
            .onTapGesture {
                counter += 1
                let todo = TodoModel(title: "Hello \(counter)", isCompleted: false, createdAt: Date(), syncStatus: .pending)
                Task {
                    let allTodos = try await TodoLocalDataSource().fetchAllData()
                    print("*** allTodos: \(allTodos)")
                }
            }
    }

}

#Preview {
    ContentView()
}
