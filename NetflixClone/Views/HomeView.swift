//
//  HomeView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 15.02.2024.
//

import SwiftUI

struct HomeView: View {
    let manager = NetworkManager()
    let path = SliderCode(rawValue: 0)?.path
    @EnvironmentObject var movieModel: MovieModel

    var body: some View {
        ScrollView {
            VStack {
                SliderMovieView(title: "Now Playing", index: 0)
                SliderMovieView(title: "Popular", index: 1)
                SliderMovieView(title: "Top Rated", index: 2)
                SliderMovieView(title: "Upcoming", index: 3)
            }
        }
        .padding()
        .task {
            do {
                let movie = try await manager.fetchData(for: Movie.self, from: path ?? "/now_playing")
                movieModel.movie = movie
            } catch {
                print("An unexpected error occurred: \(error)")
            }
        }
        .environmentObject(movieModel)
    }
}

#Preview {
    HomeView()
}
