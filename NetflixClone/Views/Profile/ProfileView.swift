//
//  ProfileView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 4.03.2024.
//

import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var shouldNavigateToLogin = false

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Text("Hello A,")
                    .font(.largeTitle)

                if let username = UserDefaults.standard.string(forKey: "username") {
                    Text("Hello \(username),")
                        .font(.largeTitle)
                }
                Spacer()
            }
            
            Spacer()
          
            
            Button("Sign Out") {
                signOut()
                shouldNavigateToLogin = true
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
            
            if shouldNavigateToLogin {
                NavigationLink("") {
                    LoginView()
                }
            }
            Spacer()

        }
        .padding()
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
