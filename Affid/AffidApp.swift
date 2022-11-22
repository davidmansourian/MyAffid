//
//  AffidApp.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI
import Firebase

/*class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
                         = nil) -> Bool{
        FirebaseApp.configure()
        return true
    }
}*/

@main
struct AffidApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView{
                SplashScreenView()
            }
            .environmentObject(viewModel)
        }
    }
}
