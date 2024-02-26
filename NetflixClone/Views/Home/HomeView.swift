//
//  HomeView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 15.02.2024.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32) {
                    SliderMovieView(index: 0)
                    SliderMovieView(index: 1)
                    SliderMovieView(index: 2)
                }
            }
            .padding()
            .navigationTitle("NETFLIX")
        }
    }
}

#Preview {
    HomeView()
}
