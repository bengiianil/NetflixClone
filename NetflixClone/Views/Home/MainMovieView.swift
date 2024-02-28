//
//  MainMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 28.02.2024.
//

import SwiftUI

struct MainMovieView: View {
    @ObservedObject var viewModel = MovieViewModel()
    let path = SliderCode(rawValue: 3)?.path

    var body: some View {
        VStack {
            let url = Constants.imageUrl + (viewModel.movieModel?.results?.first?.posterPath ?? "")
            let imageUrl = URL(string: url)
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .clipped()
        }
        .task {
            await viewModel.fetchMovieData(index: 3)
        }
    }
}

#Preview {
    MainMovieView()
}
