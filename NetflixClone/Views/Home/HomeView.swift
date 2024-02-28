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
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                if searchText.isEmpty {
                    VStack(spacing: 32) {
                        SliderMovieView(index: 0)
                        SliderMovieView(index: 1)
                        SliderMovieView(index: 2)
                    }
                } else if searchText.count < 3 {
                    Spacer()
                    VStack(spacing: 32) {
                        Spacer()
                        Text("Please enter min 3 letter for search")
                            .font(.title2)
                        Image(systemName: "exclamationmark.magnifyingglass")
                            .resizable()
                            .frame(width: 64, height: 64)
                        Spacer()
                    }
                } else {
                    FilteredMovieView(searchText: $searchText)
                }

            }
            .padding()
            .navigationTitle("NETFLIX")
            .searchable(text: $searchText, prompt: "Search for movie")
        }
    }
}

#Preview {
    HomeView()
}
