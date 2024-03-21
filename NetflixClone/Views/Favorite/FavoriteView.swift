//
//  FavoriteView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject private var favoriteViewModel: FavoriteViewModel
    @ObservedObject var viewModel = MovieViewModel()
    @State private var searchText = ""

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
            return favoriteViewModel.favMovies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        } else {
            return favoriteViewModel.favMovies
        }
    }
}

#Preview {
    FavoriteView()
}
