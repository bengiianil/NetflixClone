//
//  NetflixCloneApp.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 30.01.2024.
//

import SwiftUI

@main
struct NetflixCloneApp: App {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var favorites = FavoriteViewModel()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .preferredColorScheme(.dark)
                .environmentObject(favorites)
        }
    }
}
