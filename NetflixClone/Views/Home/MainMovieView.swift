//
//  MainMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 28.02.2024.
//

import SwiftUI

struct MainMovieView: View {
    @ObservedObject var viewModel = MovieViewModel()
    @State private var currentPage = 0
    private let path = SliderCode(rawValue: 3)?.path

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<5) { index in
                    if let movie = viewModel.movieModel?.results?[index],
                       let genres = viewModel.genreModel {
                        
                        let url = Constants.imageUrl + movie.posterPath
                        if let imageUrl = URL(string: url) {
                            
                            NavigationLink(destination: MovieDetailView(item: movie, genres: genres)) {
                                CacheAsyncImage(url: imageUrl) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image.resizable()
                                            .tag(index)
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
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
      
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .task {
            await viewModel.fetchMovieData(index: 3)
        }
    }
}
 
#Preview {
    MainMovieView()
}
