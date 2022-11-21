//
//  AffidApp.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI
import Firebase

@main
struct AffidApp: App {
    
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
