//
//  FavoriteView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject private var favoriteViewModel: FavoriteViewModel
    @ObservedObject var viewModel = MovieViewModel()
    @State private var searchText = ""
    @State private var showAlert: Bool = false
    @State private var showLogin: Bool = false
    @State private var description = LoginAlert.invalidData.rawValue
    
    var body: some View {
        NavigationView {
            VStack {
                List(filteredFavMovies) { favorite in
                    NavigationLink {
                        if let genreModel = viewModel.genreModel {
                            MovieDetailView(item: favorite, genres: genreModel)
                        }
                    } label: {
                        FavRowView(viewModel: viewModel, item: favorite, searchText: searchText)
                    }
                }
                .listRowSeparator(.visible)
            }
            .navigationTitle("Favorites")
            .navigationBarItems(trailing:
                Button {
                    showAlert.toggle()
                    LoginViewModel.shared.signOut { isSuccessful, error  in
                        self.description = error
                    }
                 } label: {
                     Text("Sign Out")
                         .foregroundStyle(.white)
                 }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(LoginAlert.signOut.rawValue),
                        primaryButton: .default(Text("OK")) {
                            showLogin = true
                        },
                        secondaryButton: .cancel(Text("Cancel")) {
                            print("Cancel button tapped")
                        }
                    )
                }
                .fullScreenCover(isPresented: $showLogin) {
                    LoginView()
                }
            )
            .searchable(text: $searchText, prompt: "Search for movie")
        }
    }
    
    var filteredFavMovies: [Results] {
        if !searchText.isEmpty {
            return favoriteViewModel.favMovies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        } else {
            return favoriteViewModel.favMovies
        }
    }
}

#Preview {
    FavoriteView()
}
