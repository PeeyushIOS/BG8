//
//  BG8App.swift
//  BG8
//
//  Created by Mac HD on 20/02/2025.
//

import SwiftUI

@main
struct BG8App: App {
    let persistenceController = PersistenceController.shared
        init() {
               UIView.appearance().overrideUserInterfaceStyle = .light
           }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).preferredColorScheme(.light)
        }
    }
}
