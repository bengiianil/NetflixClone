//
//  LoginView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 29.02.2024.
//

import FirebaseAuth
import SwiftUI

struct LoginView: View {
    @State var email: String
    @State var password: String
    @State var isLoggedIn: Bool = false
    @State private var isLoading = false

    var body: some View {
        if isLoggedIn {
            TabBarView()
        } else {
            VStack(spacing: 24) {
                
                Spacer()
  
                HStack {
                    Image(systemName: "movieclapper.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    
                    Text("MovieLABS")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
       
                TextField("E-mail", text: $email)
                    .modifier(CustomTextFieldStyle())

                SecureField("Password", text: $password)
                    .modifier(CustomTextFieldStyle())

//                Spacer()
                Button {
                    login()
                } label: {
                    Text("Login")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(Color.red)
                        .cornerRadius(12)
                        .bold()
                }
                .padding(.horizontal, 24)
                
                Spacer()
                Text("Do not have an account?")
                Button {
                    isLoading = true
                    register()
                } label: {
                    if isLoading {
                         ProgressView()
                             .padding()
                             .frame(maxWidth: .infinity)
                             .background(Color.gray)
                             .cornerRadius(12)
                             .foregroundColor(.white)
                     } else {
                         Text("Register")
                     }               
                }

                Spacer()
            }
            .padding()
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        isLoggedIn.toggle()
                    }
                }
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                isLoading = false
                print(error.localizedDescription)
            } else {
                print("Register successful!")
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login successful!")
            }
        }
    }
}

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(height: 44)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondary, lineWidth: 2)
            )
            .padding(.horizontal, 24)
    }
}

#Preview {
    LoginView(email: "", password: "")
}
