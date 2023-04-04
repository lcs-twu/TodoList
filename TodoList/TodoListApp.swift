//
//  TodoListApp.swift
//  TodoList
//
//  Created by Evelyn Chen on 2023-04-04.
//
import Blackbird
import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
