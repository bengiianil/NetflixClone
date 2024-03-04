//
//  TabBarView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorite")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(Color.white)
    }
}

#Preview {
    TabBarView()
}
