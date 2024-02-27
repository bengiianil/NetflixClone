//
//  FavRowView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 27.02.2024.
//

import SwiftUI

struct FavRowView: View {
    let item: Results
    let genres: Genres
    @ObservedObject var viewModel = MovieViewModel()

    var body: some View {
        HStack {
            let url = Constants.imageUrl + (item.posterPath)
            let imageUrl = URL(string: url)
            
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                        
                    }
                
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .padding(.trailing, 24)

            VStack {
                Text(item.title)
                    .font(.title2)
                    .fontWeight(.bold)
                if let genreNames = viewModel.genreNames {
                    Text(genreNames.joined(separator: ", "))
                        .font(.caption)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .task {
            await viewModel.getGenresName(item: item, genres: genres)
        }
    }
}

#Preview {
    FavRowView(item: Results(id: 787699,
                             title: "Wonka",
                             overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
                             posterPath: "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
                             genreIds: [35, 10751, 14]),
               genres: Genres(genres: [Genre(id: 35, name: "Comedy"), Genre(id: 14, name: "Action")]))
}
