//
//  CustomStarView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 28.02.2024.
//

import SwiftUI

struct CustomStarView: View {
    @EnvironmentObject private var favoriteViewModel: FavoriteViewModel
    let item: Results

    var body: some View {
        HStack {
            var favoriteState = favoriteViewModel.contains(movie: item)

            Spacer()
            Button {
                favoriteState.toggle()
                if favoriteViewModel.contains(movie: item) {
                    favoriteViewModel.remove(movie: item)
                } else {
                    favoriteViewModel.add(movie: item)
                }

            } label: {
                let imageName = favoriteState ? "star.fill" : "star"
                Image(systemName: imageName)
                    .foregroundColor(.yellow)
                    .padding(8)
                    .background(
                        Circle()
                            .foregroundColor(.gray)
                    )
            }
        }
    }
}

#Preview {
    CustomStarView(item: Results(id: 787699,
                                 title: "Wonka",
                                 overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
                                 posterPath: "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
                                 genreIds: [35, 10751, 14]))
}
