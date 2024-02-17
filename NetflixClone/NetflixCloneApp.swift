//
//  NetflixCloneApp.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 30.01.2024.
//

import SwiftUI

@main
struct NetflixCloneApp: App {
    @StateObject private var movieModel = MovieModel()
    @Environment(\.colorScheme) var colorScheme

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(movieModel)
                .preferredColorScheme(.dark)
        }
    }
}
