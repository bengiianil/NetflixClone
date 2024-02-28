//
//  FavoriteView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject private var favorites: FavoriteViewModel

    var body: some View {
        NavigationView {
            VStack {
                List(favorites.favMovies) { favorite in
                    NavigationLink {
                        // MovieDetailView(item: favorite, genres: genres)
                    } label: {
                        FavRowView(item: favorite, rating: .constant(3.8))
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoriteView()
}
