//
//  NetflixCloneApp.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 30.01.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

@main
struct NetflixCloneApp: App {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var favoriteViewModel = FavoriteViewModel()

    /// register app delegate for firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .preferredColorScheme(.dark)
                .environmentObject(loginViewModel)
                .environmentObject(favoriteViewModel)
        }
    }
}
