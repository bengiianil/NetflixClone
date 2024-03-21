//
//  LoginView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 29.02.2024.
//

import FirebaseAuth
import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewModel: LoginViewModel
    @State var email: String = ""
    @State var password: String = ""
    @State var isLoggedIn: Bool = false
    @State private var isLoading = false
    @State private var isRegisterTapped = false
    @State var showAlert: Bool = false
    @State private var description = LoginAlert.invalidData.rawValue
    
    var body: some View {
        if isLoggedIn {
            TabBarView()
        } else {
            NavigationView {
                VStack(spacing: 24){
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
           
                    Spacer()

                    ZStack(alignment: .trailing) {
                        TextField("E-mail", text: $email)
                            .modifier(CustomTextFieldStyle())
                        
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .padding(.trailing, 32)
                    }
                    
                    ZStack(alignment: .trailing) {
                        SecureField("Password", text: $password)
                            .modifier(CustomTextFieldStyle())

                        Image(systemName: "lock.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .padding(.trailing, 32)
                    }

                    HStack {
                        NavigationLink("Forgot Password?") {
                            ForgotPasswordView()
                        }
                        .foregroundStyle(.white)
                        .opacity(0.8)
                        .font(.subheadline)

                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    Button {
                        isLoading = true
                        
                        loginViewModel.login(email: email, password: password) { isSuccessful, description in
                            if isSuccessful {
                                NavigationLink("") {
                                    HomeView()
                                }
                            } else {
                                isLoading = false
                                self.description = description
                                showAlert.toggle()
                            }
                        }
                    } label: {
                        if isLoading {
                            ProgressView()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(12)
                                .foregroundColor(.white)
                        } else {
                            Text("Login")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .background(Color.red)
                                .cornerRadius(12)
                                .bold()
                        }
                    }
                    .padding(.horizontal, 24)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(description)
                        )
                    }
                    
                    Spacer()
                    Text("Do not have an account?")
                    
                 
                    NavigationLink {
                        RegisterView()
                    } label: {
                         Text("Register")
                             .foregroundStyle(.blue)
                    }

                    Spacer()
                }
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
    LoginView()
}
