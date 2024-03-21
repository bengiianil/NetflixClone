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
            HStack {
                if let username = UserDefaults.standard.string(forKey: "username") {
                    Text("Hello \(username),")
                        .font(.largeTitle)
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
