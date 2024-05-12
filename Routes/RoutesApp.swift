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
    
    @StateObject var rootVM = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }.environmentObject(rootVM)
    }
}
