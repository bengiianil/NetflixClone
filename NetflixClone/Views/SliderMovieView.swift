//
//  SliderMovieView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import SwiftUI

struct SliderMovieView: View {
    @State var title: String
    @State var index: Int

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
               Text(title)
                   .font(.headline)
               Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { index in
                        MovieView(index: index)
                    }
                }
            }
        }
    }
}

#Preview {
    SliderMovieView(title: "Gündemdekiler", index: 0)
}
