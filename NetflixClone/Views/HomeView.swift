//
//  HomeView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 15.02.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SliderMovieView(index: 0)
                    SliderMovieView(index: 1)
                    SliderMovieView(index: 2)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
