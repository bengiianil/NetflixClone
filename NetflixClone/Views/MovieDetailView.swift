//
//  MovieDetailView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 20.02.2024.
//

import SwiftUI

struct MovieDetailView: View {
    let item: Results
    let genres: Genres
    private let manager = NetworkManager()
    @StateObject private var movieDetailModel = MovieModel()
    @State private var detailModel: MovieDetails? = nil

    var body: some View { 
        ScrollView {
            VStack(spacing: 16) {
                
                ZStack {
                    let url = manager.imageUrl + (item.posterPath)
                    let imageUrl = URL(string: url)
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .clipped()
                }
                
                 HStack {
                     ForEach(getGenresName(), id: \.self) { name in
                         Image(systemName: "circle.fill")
                             .resizable()
                             .scaledToFit()
                             .frame(width: 4, height: 4)
                             .foregroundColor(.yellow)
                         
                         Text(name)
                             .foregroundStyle(.white)
                             .font(.caption)
                     }
                }
                
                HStack {
                    if let detailModel = detailModel {
                        RoundedTextView(text: detailModel.releaseDate.getYear() ?? "")
                        RoundedTextView(text: "\(detailModel.runtime) min")
                        RoundedTextView(text: String(format: "IMDB %.1f", detailModel.voteAverage))
//                        Spacer()
                    }
                }
                .padding()

                Text(item.overview)
                    .padding()
                    .foregroundStyle(.secondary)

            }

        }
        .ignoresSafeArea()
        .task {
            do {
                let path = "/movie/\(item.id)"
                detailModel = try await manager.fetchData(for: MovieDetails.self, from: path)
            } catch {
                print("An unexpected error occurred: \(error)")
            }
        }
    }
    
    func getGenresName() -> [String] {
        let genreNames = item.genreIds.compactMap { genreId in
            return genres.genres.first(where: { $0.id == genreId })?.name
        }
        return genreNames
    }
}

#Preview {
    MovieDetailView(item: Results(id: 787699,
                                  title: "Wonka",
                                  overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
                                  posterPath: "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg", 
                                  genreIds: [35, 10751, 14]),
                    genres: Genres(genres: [Genre(id: 35, name: "Comedy"), Genre(id: 14, name: "Action")]))
}
