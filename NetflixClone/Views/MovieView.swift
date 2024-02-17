//
//  MovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 15.02.2024.
//

import SwiftUI


struct MovieView: View {
    let path = SliderCode(rawValue: 0)?.path
    let manager = NetworkManager()
    @State var index: Int
    @EnvironmentObject var movieModel: MovieModel

    var body: some View {
        VStack {
            if let movie = movieModel.movie {
                let url = manager.imageUrl + (movie.results?[index].posterPath ?? "")
                let imageUrl = URL(string: url)
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Rectangle()
                        .foregroundStyle(.secondary)
                }
                .frame(width: 120, height: 180)
            }
            
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

#Preview {
    MovieView(index: 0)
}

//MovieModel(dates: Dates(maximum: "", minimum: ""),
//                            page: 1,
//                            totalPages: 169,
//                            totalResults: 3361,
//                            results: [Results(id: 933131,
//                                              originalTitle: "Wonka",
//                                              overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
//                                              posterPath: "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")])
