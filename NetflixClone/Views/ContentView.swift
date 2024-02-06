//
//  ContentView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 30.01.2024.
//

import SwiftUI

struct ContentView: View {
    let url = "https://www.omdbapi.com/?i=tt3896198&apikey=edc960e"
    let manager = NetworkManager()
    @State var movie: MovieDetail?
    
    var body: some View {
        VStack {
            if let movie = movie {
                let imageUrl = URL(string: movie.Poster ?? "")
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Rectangle()
                        .foregroundStyle(.secondary)
                }
                .frame(width: 200, height: 400)
                
                HStack {
                    Text("IMDB 7.6")
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2.0)
                        }
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow))

                    Spacer()
                }
                .padding()

                Text(movie.Title ?? "")
                    .bold()
                    .padding()

                HStack {
                    Text(movie.Year ?? "")
                        .padding(.horizontal, 8)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2.0)
                        }
                    Text(movie.Runtime ?? "")
                        .padding(.horizontal, 8)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2.0)
                        }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .padding()
        .frame(width: 360, height: 600)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2.0)
        }
        .task {
            movie = try? await manager.fetchData(for: MovieDetail.self, from: url)
        }
    }
}

#Preview {
    ContentView(movie: MovieDetail(Title: "", Year: "", Runtime: "", imdbRating: "", Poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg"))
}
