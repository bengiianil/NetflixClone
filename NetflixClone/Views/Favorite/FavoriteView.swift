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

    var body: some View {
        NavigationView {
            VStack {
                List(filteredFavMovies) { favorite in
                    NavigationLink {
                        // MovieDetailView(item: favorite, genres: genres)
                    } label: {
                        FavRowView(item: favorite)
                    }
                }
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
