//
//  SliderMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import SwiftUI

struct SliderMovieView: View {
    @StateObject private var movieModel = MovieModel()
    @StateObject private var genreModel = GenreModel()
    @State var index: Int
    private let manager = NetworkManager()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                let title = SliderCode(rawValue: index)?.title
                Text(title ?? "")
                    .font(.headline)
                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movieModel.movie?.results ?? [], id: \.id) { item in
                        if let genres = genreModel.genres {
                            let url = manager.imageUrl + (item.posterPath)
                            NavigationLink(destination: MovieDetailView(item: item, genres: genres)) {
                                MovieView(url: url)
                                    .padding(.horizontal, 4)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getMovieData(index: index)
            }
        }
//        .environmentObject(movieModel)
    }

    private func getMovieData(index: Int) async {
        do {
            let path = SliderCode(rawValue: index)?.path
            let movie = try await manager.fetchData(for: Movie.self, from: path ?? "")
            let genres = try await manager.fetchData(for: Genres.self, from: "/genre/movie/list")
            
            movieModel.movie = movie
            genreModel.genres = genres
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
}


#Preview {
    SliderMovieView(index: 1)
}
