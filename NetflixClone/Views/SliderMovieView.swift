//
//  SliderMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import SwiftUI

struct SliderMovieView: View {
    @State var index: Int
    let manager = NetworkManager()
    @StateObject private var movieModel = MovieModel()

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
                        let url = manager.imageUrl + (item.posterPath)
                        MovieView(url: url)
                            .padding(.horizontal, 4)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getMovieData(index: index)
            }
        }
    }

    private func getMovieData(index: Int) async {
        do {
            let path = SliderCode(rawValue: index)?.path
            let movie = try await manager.fetchData(for: Movie.self, from: path ?? "")
            movieModel.movie = movie
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
}


#Preview {
    SliderMovieView(index: 1)
}
