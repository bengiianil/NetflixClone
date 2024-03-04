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
    @State private var currentPage = 0

    var body: some View {
        NavigationView {
            ScrollView {
                if searchText.isEmpty {
                    VStack() {
                        MainMovieView()
                            .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 2)
                        Spacer(minLength: 32)
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 1), spacing: 32) {
                            ForEach(0..<3) { index in
                                SliderMovieView(index: index)
                            }
                        }
                    }
                    .padding(.vertical)
//                } else if searchText.count < 3 {
//                    VStack(spacing: 32) {
//                        Spacer(minLength: 100)
//                        Spacer()
//                        Text("Please enter min 3 letter for search")
//                            .font(.title2)
//                        Image(systemName: "exclamationmark.magnifyingglass")
//                            .resizable()
//                            .frame(width: 64, height: 64)
//                    }
                } else {
                    FilteredMovieView(searchText: $searchText)
                }

            }
            .padding()
            .navigationTitle("MovieLABS")
            .searchable(text: $searchText, prompt: "Search for movie")
        }
    }
}

#Preview {
    HomeView()
}
