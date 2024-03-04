//
//  SwiftUIView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 4.03.2024.
//

import SwiftUI

struct SwiftUIView: View {
    @State var email: String
    @State var password: String
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("MovieLABS")
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            TextField("E-mail", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            ZStack {
                  TextField("E-mail", text: $email)
                      .textFieldStyle(.roundedBorder)
                      .frame(height: 44)
                      .foregroundColor(.white)
                      .padding(.horizontal, 32)
                    
                  
                  RoundedRectangle(cornerRadius: 12)
                      .stroke(Color.secondary, lineWidth: 2)
                      .fill(Color.secondary)
                      .frame(height: 44)
                      .padding(.horizontal, 32)
              }
            
            SecureField("Password", text: $password)
                .modifier(CustomTextFieldStyle())
        }
    }
}

#Preview {
    SwiftUIView(email: "", password: "")
}
