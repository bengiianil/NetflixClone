//
//  ProfileView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 4.03.2024.
//

import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    var body: some View {
        Button {
            signOut()
        } label: {
            Text("Sign Out")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            // Oturum kapatma başarılı oldu
        } catch let error {
            print("Oturum kapatma hatası: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ProfileView()
}
