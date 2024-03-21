//
//  RegisterView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 21.03.2024.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordAgain: String = ""
    @State var showAlert: Bool = false
    @State private var isLoading = false
    @State private var description = LoginAlert.invalidData.rawValue

    var body: some View {
        VStack(spacing: 24) {

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
            
            TextField("Name Surname", text: $name)
                .modifier(CustomTextFieldStyle())
            
            TextField("E-mail", text: $email)
                .modifier(CustomTextFieldStyle())
            
            SecureField("Password", text: $password)
                .modifier(CustomTextFieldStyle())
            
            SecureField("Password again", text: $passwordAgain)
                .modifier(CustomTextFieldStyle())
            
            Button {
                isLoading = true

                if password == passwordAgain {
                    LoginViewModel.shared.register(name: name, email: email, password: password) { isSuccessful, description in
                        if isSuccessful {
                            UserDefaults.standard.set(name, forKey: "username")
                            NavigationLink("") {
                                HomeView()
                            }
                        } else {
                            isLoading = false
                            self.description = description
                            showAlert.toggle()
                        }
                    }
                } else {
                    self.description = LoginAlert.notMatchPassword.rawValue
                    showAlert.toggle()
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
                    Text("Register")
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
        }
    }
}

#Preview {
    RegisterView(name: "", email: "", password: "")
}
