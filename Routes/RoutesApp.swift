//
//  RoutesApp.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI
import SwiftData

@main
struct RoutesApp: App {
    @Environment(\.modelContext) var modelContext
    
    @StateObject var rootVM = RootViewModel()
    
    var modelContainer: ModelContainer {
        do {
            let schema = Schema([
                IssueEntity.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Failed to create container with error: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            RootView().onAppear {
                rootVM.requestNotificationPermission()
            }
        }
        .modelContainer(modelContainer)
        .environmentObject(rootVM)
    }
    
}
