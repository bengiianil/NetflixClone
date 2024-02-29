//
//  FavRowView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 27.02.2024.
//

import SwiftUI

struct FavRowView: View {
    let item: Results
    let searchText: String
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        HStack {
            let url = Constants.imageUrl + (item.posterPath)
            if let imageUrl = URL(string: url) {
                CacheAsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.white, lineWidth: 2)
                                
                            }
                    case .failure:
                        EmptyView()
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    @unknown default:
                        Image(systemName: "questionmark")
                    }
                }
                .padding(.trailing, 20)
            }
            
            VStack(spacing: 8) {
                Text(item.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    
                HStack {
                    if let voteAverage = viewModel.detailModel?.voteAverage {
                        RatingView(rating: voteAverage / 2)
                        let rating = String(format: "%.1f", voteAverage / 2)
                        Text("(\(rating)/5)")
                            .font(.subheadline)
                            .bold()
                    }
                }
            }
            
            Spacer()
        }
        .onChange(of: searchText) {
            Task {
                await viewModel.fetchMovieDetails(item: item)
            }
        }
        .task {
            await viewModel.fetchMovieDetails(item: item)
        }
    }
}

#Preview {
    FavRowView(item: Results(id: 787699,
                             title: "Wonka",
                             overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
                             posterPath: "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
                             genreIds: [35, 10751, 14]), searchText: "", viewModel: MovieViewModel())
}
