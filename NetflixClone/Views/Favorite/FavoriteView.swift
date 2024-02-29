//
//  FavoriteView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject private var favorites: FavoriteViewModel
    @State private var searchText = ""
    @ObservedObject var viewModel = MovieViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List(filteredFavMovies) { favorite in
                    NavigationLink {
                        if let genreModel = viewModel.genreModel {
                            MovieDetailView(item: favorite, genres: genreModel)
                        }
                    } label: {
                        FavRowView(item: favorite, searchText: searchText, viewModel: viewModel)
                    }
                }
                .listRowSeparator(.visible)
            }
            .navigationTitle("Favorites")
            .searchable(text: $searchText, prompt: "Search for movie")
        }
    }
    
    var filteredFavMovies: [Results] {
        if !searchText.isEmpty {
            return favorites.favMovies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        } else {
            return favorites.favMovies
        }
    }
}

#Preview {
    FavoriteView()
}
