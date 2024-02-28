//
//  RatingView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 28.02.2024.
//

import SwiftUI

struct RatingView: View {
    private let maxRating = 5
    var rating: Double

    var body: some View {
        HStack {
            ForEach(.zero..<maxRating, id: \.self) { index in
              Image(systemName: "star.fill")
                .font(.callout)
                .overlay(
                  GeometryReader { proxy in
                    Rectangle()
                      .foregroundStyle(Color.yellow)
                      .frame(
                        width: proxy.size.width * fillStar(at: index),
                        height: proxy.size.height
                      )
                  }.mask(Image(systemName: "star.fill").font(.callout))
                )
            }
        }
    }
    
    private func fillStar(at index: Int) -> CGFloat {
      return rating >= Double(index) + 1
      ? 1
      : (rating > Double(index) ? CGFloat(rating - Double(index)) : .zero)
    }
}

#Preview {
    RatingView(rating: 3.6)
}
