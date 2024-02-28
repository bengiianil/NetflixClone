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
        NavigationStack {
            List(favorites.favMovies) { favorite in
                NavigationLink {
                    
                } label: {
                    FavRowView(item: favorite, rating: .constant(3.8))
                }
            }
        }
    }
}

#Preview {
    FavoriteView()
}
