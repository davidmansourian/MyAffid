//
//  AffidApp.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

@main
struct AffidApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
