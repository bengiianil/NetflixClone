//
//  MovieDetailView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 20.02.2024.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject private var viewModel = MovieViewModel()
    let item: Results
    let genres: Genres

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack {
                    let url = Constants.imageUrl + (item.posterPath)
                    if let imageUrl = URL(string: url) {
                        CacheAsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                            case .failure:
                                EmptyView()
                            case .empty:
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            @unknown default:
                                Image(systemName: "questionmark")
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                        .clipped()

                        LinearGradientView()
                    }
                }
                
                HStack {
                    if let genreNames = viewModel.genreNames {
                        ForEach(genreNames, id: \.self) { name in
                            Image(systemName: "circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 4, height: 4)
                                .foregroundColor(.red)
                            
                            Text(name)
                                .foregroundStyle(.white)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                    }
               }
                
                HStack {
                    if let detailModel = viewModel.detailModel {
                        RoundedTextView(text: detailModel.releaseDate.getYear() ?? "")
                        RoundedTextView(text: "\(detailModel.runtime) min")
                        RoundedTextView(text: String(format: "IMDB %.1f", detailModel.voteAverage))
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        Text(item.title)
                            .padding(.horizontal)
                            .foregroundStyle(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Spacer(minLength: 2)
                    Text(item.overview)
                        .padding()
                        .foregroundStyle(.secondary)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
        .navigationBarItems(trailing: CustomStarView(item: item))
        .task {
            await viewModel.fetchMovieDetails(item: item)
            await viewModel.getGenresName(item: item, genres: genres)
        }
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
