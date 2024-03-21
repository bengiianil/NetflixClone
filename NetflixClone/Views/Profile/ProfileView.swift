//
//  ProfileView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 4.03.2024.
//

import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    @State private var shouldNavigateToLogin = false

    var body: some View {
        VStack {
            if let username = UserDefaults.standard.string(forKey: "username") {
                Text("Hello \(username),")
                    .font(.largeTitle)
            }
            
            Button("Sign Out") {
                signOut()
                shouldNavigateToLogin = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
            
            NavigationLink(
                 destination: LoginView(email: "", password: ""),
                 isActive: $shouldNavigateToLogin
             ) {
                 EmptyView()
             }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Oturum kapatma hatası: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ProfileView()
}
