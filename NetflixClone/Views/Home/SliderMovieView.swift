//
//  SliderMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import SwiftUI

struct SliderMovieView: View {
    @State var index: Int
    @ObservedObject var viewModel = MovieViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                let title = SliderCode(rawValue: index)?.title
                Text(title ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.movieModel?.results ?? [], id: \.id) { item in
                        if let genres = viewModel.genreModel {
                            let url = Constants.imageUrl + (item.posterPath)
                            NavigationLink(destination: MovieDetailView(item: item, genres: genres)) {
                                MovieView(url: url)
                                    .padding(.horizontal, 4)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.getMovieData(index: index)
        }
    }
}


#Preview {
    SliderMovieView(index: 1)
}
