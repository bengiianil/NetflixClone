//
//  SliderMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import SwiftUI

struct SliderMovieView: View {
    @State var index: Int
    let manager = NetworkManager()
    @StateObject private var movieModel = MovieModel()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                let title = SliderCode(rawValue: index)?.title
                Text(title ?? "")
                    .font(.headline)
                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movieModel.movie?.results ?? [], id: \.id) { item in
                        VStack {
                            let url = manager.imageUrl + (item.posterPath)
                            let imageUrl = URL(string: url)
                            AsyncImage(url: imageUrl) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Rectangle()
                                    .foregroundStyle(.secondary)
                            }
                            .frame(width: 120, height: 180)
                            
                            HStack {
                                Spacer()
                                Image(systemName: "info.circle")
                                    .foregroundStyle(.white)
                                Spacer()
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            .frame(width: 120)
                        }
                        .padding(.bottom, 4)
                        .background(Color(.darkGray))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getMovieData(index: index)
            }
        }
    }

    private func getMovieData(index: Int) async {
        do {
            let path = SliderCode(rawValue: index)?.path
            let movie = try await manager.fetchData(for: Movie.self, from: path ?? "")
            movieModel.movie = movie
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
}


#Preview {
    SliderMovieView(index: 0)
}
