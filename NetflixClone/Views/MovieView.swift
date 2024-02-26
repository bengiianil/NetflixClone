//
//  MovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 15.02.2024.
//

import SwiftUI

struct MovieView: View {
    let path = SliderCode(rawValue: 1)?.path
    let url: String

    var body: some View {
        VStack {
            let imageUrl = URL(string: url)
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .frame(width: 120, height: 180)
            .padding(.bottom, 8)

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
    MovieView(url: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")
}
