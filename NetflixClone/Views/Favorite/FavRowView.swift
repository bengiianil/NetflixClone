//
//  FavRowView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 27.02.2024.
//

import SwiftUI

struct FavRowView: View {
    let item: Results
    @ObservedObject var viewModel = MovieViewModel()
    
    private let maxRating = 5
    @Binding var rating: Double


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
                            .stroke(.white, lineWidth: 2)
                        
                    }
                
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .padding(.trailing, 24)

            VStack {
                Text(item.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
//                HStack {
//                    ForEach(.zero..<maxRating, id: \.self) { index in
//                      Image(systemName: "star.fill")
//                        .font(.body)
//                        .overlay(
//                          GeometryReader { proxy in
//                            Rectangle()
//                              .foregroundStyle(Color.yellow)
//                              .frame(
//                                width: proxy.size.width * fillStar(at: index),
//                                height: proxy.size.height
//                              )
//                          }.mask(Image(systemName: "star.fill").font(.body))
//                        )
//                    }
//                  
//                }
            }
            Spacer()
        }
    }
//    private func fillStar(at index: Int) -> CGFloat {
//      return rating >= Double(index) + 1
//      ? 1
//      : (rating > Double(index) ? CGFloat(rating - Double(index)) : .zero)
//    }
}

#Preview {
    FavRowView(item: Results(id: 787699,
                             title: "Wonka",
                             overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
                             posterPath: "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
                             genreIds: [35, 10751, 14]), rating: .constant(4.2))
}
