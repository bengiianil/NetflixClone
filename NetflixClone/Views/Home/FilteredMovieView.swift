//
//  FilteredMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 28.02.2024.
//

import SwiftUI

struct FilteredMovieView: View {
    @ObservedObject var viewModel = MovieViewModel()
    @Binding var searchText: String
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
            ForEach(filteredMovies, id: \.id) { item in
                if let genres = viewModel.genreModel {
                    let url = Constants.imageUrl + (item.posterPath)
                    NavigationLink(destination: MovieDetailView(item: item, genres: genres)) {
                        MovieView(url: url)
                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .onChange(of: searchText) {
            Task {
                await viewModel.fetchMoviesByTitle(text: searchText)
            }
        }
    }
    
    var filteredMovies: [Results] {
        let movies = viewModel.filteredMovieModel?.results ?? []
        if !searchText.isEmpty {
            return movies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        } else {
            return movies
        }
    }
}

#Preview {
    FilteredMovieView(searchText: .constant("now"))
}
