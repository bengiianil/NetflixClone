//
//  ForgotPasswordView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 21.03.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    @State private var isLoading = false
    @State private var description = LoginAlert.invalidData.rawValue
    @State private var isSuccessful = false

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your e-mail", text: $email)
                .modifier(CustomTextFieldStyle())
            
            Button {
                isLoading = true
                LoginViewModel.shared.checkIfUserExists(email: email) { isRegistered, registerDesc in
                    if isRegistered {
                        LoginViewModel.shared.forgotPassword(email: email) { isSuccessful, description in
                            isLoading = false
                            self.isSuccessful = isSuccessful
                            self.description = description
                            showAlert.toggle()
                        }
                    } else {
                        isLoading = false
                        self.description = registerDesc
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
                    Text("Send mail")
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
                    title: Text(isSuccessful ? "Successful" : "Error"),
                    message: Text(description),
                    dismissButton: .default(Text("OK")) {
                        if isSuccessful {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
